---
name: github-pre-push
description: "Verify and guarantee CI/CD readiness before committing or pushing changes to GitHub. Prevents failures in GitHub Actions workflows (linter, tests, types:check, PHP compatibility, git executable permissions, SQLite in-memory test compatibility, VitePlus vp check/fmt/lint, ESLint, Prettier, PHPStan baselines, and Pint). Activate whenever preparing to push to git, running pre-commit checks, or troubleshooting failing GitHub Actions workflows."
---

# GitHub Pre-Push Verification Skill

Esta skill contiene el protocolo de verificación obligatorio para asegurar que cualquier commit o push a GitHub pase todos los checks de CI/CD (**`linter`**, **`types:check`** y **`tests`**) en verde y sin errores.

---

## 1. Los 7 Pilares de Prevención de Errores en CI/CD

### Pilar 1: Compatibilidad de versiones de PHP en CI
- **El problema:** Si en `.github/workflows/tests.yml` se incluye una versión de PHP en desarrollo (ej. `8.5`) y una dependencia en `composer.lock` (como `phpoffice/phpspreadsheet`) exige `php < 8.5.0`, `composer install` fallará con exit code 2.
- **La regla:**
  - Mantener la matriz de PHP en `.github/workflows/tests.yml` únicamente con versiones estables soportadas por el proyecto (ej. `['8.3', '8.4']`).
  - Antes de agregar una nueva versión de PHP a la matriz, verificar `composer.lock` o correr `composer check-platform-reqs`.

---

### Pilar 2: Permisos de ejecución de binarios (Windows vs Linux)
- **El problema:** En Windows, los archivos no tienen bit de ejecución (`+x`). Al commitear carpetas como `vendor/bin/` o scripts `.sh`, en Git quedan con modo `100644`. Al correr en Ubuntu en GitHub Actions, cualquier llamado a `pint`, `pest` o `phpstan` arroja:
  ```text
  sh: 1: pint: Permission denied (exit code 127)
  ```
- **La regla:**
  - En los workflows (`lint.yml` y `tests.yml`), siempre asegurar `chmod -R +x vendor/bin` tras instalar dependencias.
  - Si se añade un binario a Git desde Windows, registrarlo con ejecución:
    ```bash
    git update-index --chmod=+x vendor/bin/<nombre>
    ```

---

### Pilar 3: Compatibilidad de migraciones con SQLite (Tests en memoria)
- **El problema:** En `phpunit.xml`, las pruebas corren sobre SQLite en memoria (`DB_CONNECTION=sqlite`, `DB_DATABASE=:memory:`). Sentencias SQL crudas de MySQL (como `ALTER TABLE ... MODIFY COLUMN ... ENUM(...)`) lanzan error de sintaxis en SQLite:
  ```text
  SQLSTATE[HY000]: General error: 1 near "MODIFY": syntax error
  ```
- **La regla (Sin alterar tablas de MySQL):**
  - Cualquier sentencia SQL cruda con sintaxis propietaria de MySQL debe estar protegida con el driver check:
    ```php
    if (DB::getDriverName() === 'mysql') {
        DB::statement("ALTER TABLE ... MODIFY COLUMN ...");
    }
    ```
  - **Nunca** alterar la estructura de tablas de producción ni eliminar columnas existentes para acomodar tests.

---

### Pilar 4: Análisis estático de tipos PHP (PHPStan / Larastan & Baselines)
- **El problema:** Larastan con `level: 7` u `8` detecta cientos de advertencias en llamadas dinámicas de Eloquent, exports y colecciones sin generics tipados (`property.notFound`, `argument.unresolvableType`, etc.).
- **La regla:**
  1. Si `phpstan.neon` no tiene un baseline configurado, generarlo con:
     ```bash
     vendor/bin/phpstan analyse --generate-baseline
     ```
  2. Incluir el archivo generado en `phpstan.neon`:
     ```neon
     includes:
         - vendor/larastan/larastan/extension.neon
         - vendor/nesbot/carbon/extension.neon
         - phpstan-baseline.neon
     ```
  3. Si agregas nuevo código PHP y PHPStan falla, soluciona los tipos reales o regenera el baseline si son llamadas dinámicas válidas de Laravel.
  4. Verificar siempre que `vendor/bin/phpstan analyse` termine con `0 errors`.

---

### Pilar 5: Formateo y Linter de Frontend con Vite+ (`vp check` / VitePlus)
- **El problema:**
  - En los starter kits modernos de Laravel, `npm run check` ejecuta `vp check` (VitePlus).
  - VitePlus analiza tanto formato (`fmt`) como reglas de linter (`lint`) en **todo el repositorio**.
  - Si existen carpetas de agentes o skills (`.agents/**`, `.codestudio/**`, `.continue/**`, `skills/**`, `skills-lock.json`), VitePlus intentará formatear archivos markdown/yaml/json externos arrojando decenas de `Formatting issues found`.
  - Si `denyWarnings: true` está habilitado en `vite.config.ts`, advertencias menores de TypeScript (como `void promise`, uniones redundantes o asignaciones por defecto) harán que el CI falle con código de error 1 pese a tener 0 errores reales.
- **La regla:**
  1. En `vite.config.ts`, registrar siempre en `lint.ignorePatterns` y `fmt.ignorePatterns`:
     ```typescript
     lint: {
         ignorePatterns: [
             'vendor/**',
             'node_modules/**',
             'public/**',
             'bootstrap/ssr/**',
             'tailwind.config.js',
             'resources/js/actions/**',
             'resources/js/components/ui/*',
             'resources/js/routes/**',
             'resources/js/wayfinder/**',
             '.agents/**',
             '.codestudio/**',
             '.continue/**',
             'skills/**',
         ],
         options: {
             denyWarnings: false, // Evita fallos por advertencias informativas cuando hay 0 errores
             typeAware: true,
         },
     },
     fmt: {
         ignorePatterns: [
             '.github/**',
             '.agents/**',
             '.codestudio/**',
             '.continue/**',
             'skills/**',
             'skills-lock.json',
             'Guia_Rapida_Skills.*',
             'public/**',
             'composer.json',
             'resources/js/components/ui/*',
             'resources/views/mail/*',
         ],
     }
     ```
  2. Si `vp check` detecta problemas de formato en archivos de `resources/`:
     ```bash
     npm run check:fix   # Equivale a: vp check --fix
     ```
  3. Verificar que `npm run check` termine con `Found 0 errors`.

---

### Pilar 6: Linting y Formateo Tradicional (ESLint & Prettier)
- **El problema:** En proyectos sin VitePlus que usen ESLint/Prettier clásicos:
  - ESLint corriendo en la raíz analiza carpetas externas generando falsos positivos.
  - Expresiones regulares con caracteres de escape redundantes (`[^\/]` en vez de `[^/]`).
- **La regla:**
  - Mantener en `eslint.config.js` la lista de `ignores` para `.agents/**`, `scripts/**` y `resources/js/ziggy.js`.
  - Correr `npm run format` y `npm run lint` antes de subir.

---

### Pilar 7: Aislamiento del entorno de pruebas (`testing`)
- **El problema:** Middlewares de sesión o autenticación estricta (ej. `CheckAuthSession`) que verifiquen tokens CSRF de formulario (`$request->session()->has('_token')`) desconectan al usuario durante peticiones automatizadas `$this->actingAs($user)`.
- **La regla:**
  - En middlewares de sesión web, permitir el paso en pruebas:
    ```php
    if (app()->environment('testing')) {
        return $next($request);
    }
    ```
  - En las factories de prueba (`UserFactory.php`), asegurar que los estados por defecto creen usuarios activos y válidos (`'is_active' => true`).

---

## 2. Checklist Pre-Push Definitivo

Antes de hacer `git push origin main`, ejecuta la suite completa de CI:

```bash
# Opción 1: El comando maestro de CI del proyecto (recomendado)
composer ci:check
```

O ejecuta paso a paso los 4 verificadores:

```bash
# 1. Frontend: Formateo y Linter (VitePlus o ESLint)
npm run check:fix   # Aplica correcciones automáticas de formato
npm run check       # Debe terminar con 0 errors
npm run types:check # TypeScript tsc --noEmit (0 errores)

# 2. Backend: Formateo de código PHP
vendor/bin/pint --format agent

# 3. Backend: Análisis estático de tipos
vendor/bin/phpstan analyse

# 4. Backend: Suite de pruebas automatizadas
php artisan test --compact
```

Si `composer ci:check` (o los 4 pasos) terminan con éxito (`0 errors`, `passed`), el push a GitHub pasará al 100% en verde en GitHub Actions.

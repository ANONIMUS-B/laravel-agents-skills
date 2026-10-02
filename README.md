# Laravel & React Agent Skills ⚡

Colección de habilidades especializadas (**Agent Skills**) para potenciar asistentes de Inteligencia Artificial (Claude Code, Cursor, Windsurf, Gemini, Copilot, Amp, Cline, Antigravity) en proyectos basados en el ecosistema **Laravel + Inertia.js + React + Tailwind CSS**.

---

## 🚀 Instalación Rápida: TODAS las Skills en 1 Segundo

Para instalar las **14 skills directamente en tu proyecto dentro de `.agents/skills/`** de forma 100% limpia y automática, abre la terminal en la raíz de tu proyecto y ejecuta según tu sistema:

### 🪟 Windows (PowerShell) - Opción directa (1 sola línea):
```powershell
git clone https://github.com/ANONIMUS-B/laravel-agents-skills.git .temp-skills; New-Item -ItemType Directory -Force .agents/skills; Copy-Item -Path ".temp-skills/skills/*" -Destination ".agents/skills" -Recurse -Force; Remove-Item -Recurse -Force .temp-skills
```

### 🪟 Windows (PowerShell) - Vía script remoto:
```powershell
iwr -useb https://raw.githubusercontent.com/ANONIMUS-B/laravel-agents-skills/main/install.ps1 | iex
```

### 🐧 Linux / macOS / Git Bash:
```bash
curl -sSL https://raw.githubusercontent.com/ANONIMUS-B/laravel-agents-skills/main/install.sh | bash
```

---

## 📦 Instalación Individual con Skills CLI

Si prefieres instalar únicamente una skill específica usando la herramienta oficial [skills.sh](https://skills.sh):

```bash
npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill <nombre-de-la-skill>
```

> **Ejemplo:**
> ```bash
> npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill interface-design
> ```

---

## 📚 Catálogo de Skills Incluidas

| Skill | Categoría | Descripción | Comando de Instalación Individual |
| :--- | :--- | :--- | :--- |
| **`brainstorming`** | Planificación | Marco estructurado para explorar y diseñar requerimientos antes de escribir código. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill brainstorming` |
| **`interface-design`** | UI / UX | Diseño artesanal de interfaces densas, dashboards y SaaS con estándares visuales nivel Stripe/Linear. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill interface-design` |
| **`impeccable`** | Diseño | Auditoría y pulido estético de landing pages, microinteracciones, tipografía y armonía de color. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill impeccable` |
| **`tailwindcss-development`** | Estilos | Maquetación con Tailwind CSS: layouts fluidos, Flexbox/Grid, modo oscuro y diseño responsive. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill tailwindcss-development` |
| **`inertia-react-development`** | Frontend | Desarrollo SPA con Inertia.js v3 y React: formularios `useForm`, instant visits y deferred props. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill inertia-react-development` |
| **`vercel-react-best-practices`** | Rendimiento | Más de 70 directrices de rendimiento de Vercel para eliminar waterfalls y re-renderizados innecesarios. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill vercel-react-best-practices` |
| **`laravel-best-practices`** | Backend | Arquitectura limpia en Laravel: consultas Eloquent optimizadas, FormRequests, Jobs y Policies. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill laravel-best-practices` |
| **`fortify-development`** | Seguridad | Autenticación robusta con Laravel Fortify: 2FA/TOTP con QR, passkeys (WebAuthn) y protección contra fuerza bruta. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill fortify-development` |
| **`wayfinder-development`** | Integración | Rutas fuertemente tipadas entre endpoints de Laravel y el frontend en TypeScript (`@/actions`, `@/routes`). | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill wayfinder-development` |
| **`infer-conventions`** | Convenciones | Escaneo de convenciones y patrones reales del código existente para estandarizar reglas compartidas en `.ai/rules`. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill infer-conventions` |
| **`systematic-debugging`** | Diagnóstico | Protocolo estricto para depuración: prohíbe parches rápidos y exige encontrar la causa raíz comprobada. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill systematic-debugging` |
| **`testing-best-practices`** | Calidad | Diseño de pruebas automatizadas con Pest PHP y PHPUnit: pruebas de características, aislamiento y factories. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill testing-best-practices` |
| **`deploying-to-cloud`** | Despliegue | Configuración, gestión y despliegue continuo en infraestructura Laravel Cloud mediante CLI. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill deploying-to-cloud` |
| **`changelog-generator`** | Release | Generador automático de notas de versión y resúmenes de cambios para usuarios a partir de commits de Git. | `npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill changelog-generator` |

---

## 🔄 Flujo de Trabajo Recomendado

1. **Concepción:** Usa `brainstorming` para definir requerimientos y casos borde.
2. **Diseño:** Usa `interface-design` o `impeccable` con `tailwindcss-development` para el aspecto visual.
3. **Desarrollo:** Conecta backend y frontend usando `laravel-best-practices`, `inertia-react-development` y `wayfinder-development`.
4. **Optimización:** Audita el código React con `vercel-react-best-practices`.
5. **Depuración:** Si aparece un fallo, utiliza `systematic-debugging` para diagnosticar la causa raíz.
6. **Validación:** Asegura el funcionamiento con `testing-best-practices`.
7. **Lanzamiento:** Prepara el changelog con `changelog-generator` y despliega con `deploying-to-cloud`.

---

## 🛠️ Estructura del Repositorio

```text
laravel-agents-skills/
├── README.md
├── install.ps1           # Script de instalación para Windows PowerShell
├── install.sh            # Script de instalación para Linux / macOS / Bash
└── skills/
    ├── brainstorming/
    ├── changelog-generator/
    ├── deploying-to-cloud/
    ├── fortify-development/
    ├── impeccable/
    ├── inertia-react-development/
    ├── infer-conventions/
    ├── interface-design/
    ├── laravel-best-practices/
    ├── systematic-debugging/
    ├── tailwindcss-development/
    ├── testing-best-practices/
    ├── vercel-react-best-practices/
    └── wayfinder-development/
```

---

## 📄 Licencia

Este proyecto está disponible bajo la licencia [MIT](LICENSE). Cada skill mantiene los créditos y licencias de sus respectivos autores originales en la comunidad open source.

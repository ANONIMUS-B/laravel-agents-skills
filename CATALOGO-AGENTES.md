# Catálogo de herramientas para agentes de IA

Este catálogo reúne las fuentes y las instrucciones para reutilizarlas en distintos proyectos. Una skill es una carpeta de instrucciones y recursos; un servidor MCP es un programa al que se conecta un agente. Una aplicación debe admitir el formato o la integración correspondiente: no hay compatibilidad automática con todas las IA.

## Skills incluidas en este repositorio

Consulta la [lista de skills](README.md#-catálogo-completo-de-las-21-skills). Incluye [Diagram Design](skills/diagram-design/SKILL.md), procedente de [cathrynlavery/diagram-design](https://github.com/cathrynlavery/diagram-design), con sus recursos y licencia MIT. La copia corresponde al commit `f24d98b05e2d7a5e68c2dedfe46e5b7173f50118`; para recibir cambios posteriores hay que actualizarla expresamente.

Con Node.js y Git instalados, puedes instalar una skill desde cualquier proyecto o para tu usuario mediante el instalador compatible con Agent Skills:

```powershell
# Para el proyecto actual
npx skills add ANONIMUS-B/laravel-agents-skills --skill diagram-design

# Para los proyectos del usuario, eligiendo los agentes compatibles
npx skills add ANONIMUS-B/laravel-agents-skills --skill diagram-design --global
```

El instalador permite seleccionar agentes. Consulta la [documentación de skills](https://github.com/vercel-labs/skills) para conocer los agentes, opciones y rutas vigentes. Para aplicar cambios, puede ser necesario reiniciar el agente o abrir una nueva sesión. Una instalación global pertenece a ese usuario y equipo; en otro equipo debes repetirla. Las skills del proyecto pueden compartirse con el equipo si se versionan en el repositorio de ese proyecto.

## Fuentes externas

Los enlaces siguientes son referencias a sus proyectos originales. Salvo la copia indicada de Diagram Design, este catálogo no contiene sus archivos ni los instala automáticamente.

### [Chrome DevTools MCP](https://github.com/ChromeDevTools/chrome-devtools-mcp)

Servidor MCP para inspeccionar y automatizar Chrome, incluida la consola y la red. Requiere Node.js, Chrome y un cliente compatible con MCP. Para Codex en Windows, consulta la [configuración oficial](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/client-configurations.md#codex). Otros agentes necesitan su propia configuración MCP. La instalación global de Codex no configura otros clientes.

### [Diagram Design](https://github.com/cathrynlavery/diagram-design)

Skill para crear diagramas en HTML y SVG. Se incluye una copia en este repositorio; también puede instalarse directamente desde su fuente:

```powershell
npx skills add cathrynlavery/diagram-design --global
```

### [Awesome Harness Engineering](https://github.com/walkinglabs/awesome-harness-engineering)

Lista de guías, artículos y herramientas para construir entornos fiables para agentes. Es una referencia para consultar, no una skill ni un programa único que instalar.

### [OpenViking](https://github.com/volcengine/OpenViking)

Sistema de memoria y contexto para agentes. Necesita un servidor y la integración correspondiente para cada agente. Su documentación describe opciones de proveedor, modelos y autenticación, y ofrece una aplicación de escritorio beta para Windows. Sigue la [guía oficial](https://github.com/volcengine/OpenViking#quick-start) y verifica sus requisitos antes de configurarlo. No guardes claves en este repositorio.

### [Anthropic Cybersecurity Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills)

Colección de skills de ciberseguridad. Elige las necesarias durante la instalación:

```powershell
npx skills add mukul975/Anthropic-Cybersecurity-Skills --global
```

### [Scientific Agent Skills](https://github.com/K-Dense-AI/scientific-agent-skills)

Colección de skills científicas. Selecciona las relevantes para tus tareas; algunas pueden necesitar dependencias o servicios adicionales:

```powershell
npx skills add K-Dense-AI/scientific-agent-skills --global
```

### [Agent Memory](https://github.com/AL8ERT/agent-memory)

Enlace guardado para consulta. No se pudo verificar su documentación ni sus requisitos, así que revisa el repositorio y su método de instalación antes de usarlo.

### [Agent Browser](https://agent-browser.dev/skills)

Herramienta para automatizar el navegador y skill que enseña a los agentes a utilizarla. Sigue primero la [instalación de agent-browser](https://agent-browser.dev/installation); instalar la skill por sí sola no instala necesariamente la herramienta. Después puedes instalar la skill para agentes compatibles:

```powershell
npx skills add vercel-labs/agent-browser --global
```

## Uso y mantenimiento

1. Elige la herramienta según la tarea y revisa su documentación, licencia y dependencias.
2. Para varios proyectos del mismo usuario, usa instalación global cuando el agente la soporte; para compartir una configuración con un equipo, usa instalación por proyecto cuando sea apropiado.
3. Selecciona cada aplicación de IA en el instalador o configura su integración por separado. Una IA sin soporte de skills, MCP o acceso a herramientas no las usará automáticamente.
4. Consulta la fuente original para actualizaciones. Las copias dentro de este repositorio no se actualizan automáticamente; conserva sus licencias y atribuciones al actualizarlas.
5. No incluyas contraseñas, claves API, datos privados ni memorias de proyectos en el catálogo público.

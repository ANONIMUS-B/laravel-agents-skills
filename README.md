# Laravel & React Agent Skills ⚡

Colección de habilidades especializadas (**Agent Skills**) para potenciar asistentes de Inteligencia Artificial (Claude Code, Cursor, Windsurf, Gemini, Copilot, Amp, Cline, Antigravity) en proyectos basados en el ecosistema **Laravel + Inertia.js + React + Tailwind CSS**.

Diseñadas para estandarizar la arquitectura, elevar la calidad estética del frontend, optimizar el rendimiento y acelerar la resolución sistemática de problemas.

---

## 📦 Instalación Rápida

Puedes instalar cualquier skill de este repositorio en tu proyecto con un solo comando usando la CLI oficial de [skills.sh](https://skills.sh):

`ash
npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill <nombre-de-la-skill>
`

### Ejemplo:
`ash
npx skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill interface-design
`

---

## 📚 Catálogo de Skills Incluidas

| Skill | Categoría | Descripción | Comando de Instalación |
| :--- | :--- | :--- | :--- |
| **rainstorming** | Planificación | Marco estructurado para explorar y diseñar requerimientos antes de escribir código. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill brainstorming |
| **interface-design** | UI / UX | Diseño artesanal de interfaces densas, dashboards y SaaS con estándares visuales nivel Stripe/Linear. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill interface-design |
| **impeccable** | Diseño | Auditoría y pulido estético de landing pages, microinteracciones, tipografía y armonía de color. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill impeccable |
| **	ailwindcss-development** | Estilos | Maquetación con Tailwind CSS: layouts fluidos, Flexbox/Grid, modo oscuro y diseño responsive. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill tailwindcss-development |
| **inertia-react-development** | Frontend | Desarrollo SPA con Inertia.js v3 y React: formularios useForm, instant visits y deferred props. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill inertia-react-development |
| **ercel-react-best-practices** | Rendimiento | Más de 70 directrices de rendimiento de Vercel para eliminar waterfalls y re-renderizados innecesarios. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill vercel-react-best-practices |
| **laravel-best-practices** | Backend | Arquitectura limpia en Laravel: consultas Eloquent optimizadas, FormRequests, Jobs y Policies. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill laravel-best-practices |
| **ortify-development** | Seguridad | Autenticación robusta con Laravel Fortify: 2FA/TOTP con QR, passkeys (WebAuthn) y protección contra fuerza bruta. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill fortify-development |
| **wayfinder-development** | Integración | Rutas fuertemente tipadas entre endpoints de Laravel y el frontend en TypeScript (@/actions, @/routes). | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill wayfinder-development |
| **infer-conventions** | Convenciones | Escaneo de convenciones y patrones reales del código existente para estandarizar reglas compartidas en .ai/rules. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill infer-conventions |
| **systematic-debugging** | Diagnóstico | Protocolo estricto para depuración: prohíbe parches rápidos y exige encontrar la causa raíz comprobada. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill systematic-debugging |
| **	esting-best-practices** | Calidad | Diseño de pruebas automatizadas con Pest PHP y PHPUnit: pruebas de características, aislamiento y factories. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill testing-best-practices |
| **deploying-to-cloud** | Despliegue | Configuración, gestión y despliegue continuo en infraestructura Laravel Cloud mediante CLI. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill deploying-to-cloud |
| **changelog-generator** | Release | Generador automático de notas de versión y resúmenes de cambios para usuarios a partir de commits de Git. | 
px skills add https://github.com/ANONIMUS-B/laravel-agents-skills --skill changelog-generator |

---

## 🔄 Flujo de Trabajo Recomendado

Para aprovechar al máximo este conjunto de herramientas, combina las skills en las distintas fases del desarrollo:

1. **Concepción:** Usa rainstorming para definir requerimientos y casos borde.
2. **Diseño:** Usa interface-design o impeccable con 	ailwindcss-development para el aspecto visual.
3. **Desarrollo:** Conecta backend y frontend usando laravel-best-practices, inertia-react-development y wayfinder-development.
4. **Optimización:** Audita el código React con ercel-react-best-practices.
5. **Depuración:** Si aparece un fallo, utiliza systematic-debugging para diagnosticar la causa raíz.
6. **Validación:** Asegura el funcionamiento con 	esting-best-practices.
7. **Lanzamiento:** Prepara el changelog con changelog-generator y despliega con deploying-to-cloud.

---

## 🛠️ Estructura del Repositorio

`	ext
laravel-agents-skills/
├── README.md
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
`

---

## 📄 Licencia

Este proyecto está disponible bajo la licencia [MIT](LICENSE). Cada skill mantiene los créditos y licencias de sus respectivos autores originales en la comunidad open source.

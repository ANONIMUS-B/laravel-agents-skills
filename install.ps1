# Script de instalación automática de Agent Skills
Write-Host '⚡ Instalando las 14 Agent Skills en .agents/skills/...' -ForegroundColor Cyan

 = Join-Path C:\laragon\www\pagina_web_gym '.temp-skills'
 = Join-Path C:\laragon\www\pagina_web_gym '.agents\skills'

if (!(Test-Path )) {
    New-Item -ItemType Directory -Force -Path  | Out-Null
}

Write-Host '📥 Descargando repositorio...' -ForegroundColor Yellow
git clone --depth 1 https://github.com/ANONIMUS-B/laravel-agents-skills.git  --quiet

if (Test-Path \skills) {
    Copy-Item -Path \skills\* -Destination  -Recurse -Force
    Remove-Item -Recurse -Force 
    Write-Host '✅ ¡Instalación exitosa! Las 14 skills quedaron listas en .agents/skills/' -ForegroundColor Green
    Get-ChildItem  | ForEach-Object { Write-Host  ✓  -ForegroundColor Gray }
} else {
    Write-Host '❌ Ocurrió un error al descargar las skills.' -ForegroundColor Red
}

# Script de instalación automática de Agent Skills
Write-Host '⚡ Instalando las 20 Agent Skills en .agents/skills/...' -ForegroundColor Cyan

$tempPath = Join-Path (Get-Location) '.temp-skills'
$destPath = Join-Path (Get-Location) '.agents\skills'

if (!(Test-Path $destPath)) {
    New-Item -ItemType Directory -Force -Path $destPath | Out-Null
}

Write-Host '📥 Descargando repositorio...' -ForegroundColor Yellow
git clone --depth 1 https://github.com/ANONIMUS-B/laravel-agents-skills.git $tempPath --quiet

if (Test-Path "$tempPath\skills") {
    Copy-Item -Path "$tempPath\skills\*" -Destination $destPath -Recurse -Force
    Remove-Item -Recurse -Force $tempPath
    Write-Host '✅ ¡Instalación exitosa! Las 20 skills quedaron listas en .agents/skills/' -ForegroundColor Green
    Get-ChildItem $destPath | ForEach-Object { Write-Host "  ✓ $($_.Name)" -ForegroundColor Gray }
} else {
    Write-Host '❌ Ocurrió un error al descargar las skills.' -ForegroundColor Red
}

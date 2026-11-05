#!/bin/bash
set -e
echo "⚡ Instalando Agent Skills en .agents/skills/..."
mkdir -p .agents/skills
git clone --depth 1 https://github.com/ANONIMUS-B/laravel-agents-skills.git .temp-skills --quiet
cp -r .temp-skills/skills/* .agents/skills/
rm -rf .temp-skills
echo "✅ ¡Instalación exitosa! Las skills quedaron listas en .agents/skills/"

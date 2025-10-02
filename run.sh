#!/bin/bash

# 🚀 Script para ejecutar distri-base en Docker usando .env
# Uso: ./run.sh

# Asegurarse de que queries.db exista
if [ ! -f "$(pwd)/queries.db" ]; then
    echo "Creando queries.db..."
    touch "$(pwd)/queries.db"
    chmod 666 "$(pwd)/queries.db"
fi

# Verificar que .env exista
if [ ! -f "$(pwd)/.env" ]; then
    echo "⚠️  No se encontró el archivo .env"
    echo "   Crea uno con tu clave:"
    echo "   GOOGLE_API_KEY=TU_API_KEY_AQUI"
    exit 1
fi

# Ejecutar el contenedor con variables del .env
docker run --rm -it \
  --env-file .env \
  -v "$(pwd)/test.csv:/app/test.csv:ro" \
  -v "$(pwd)/queries.db:/app/queries.db" \
  distri-base:latest

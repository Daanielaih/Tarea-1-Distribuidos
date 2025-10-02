FROM python:3.10-slim

# Dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Instalar dependencias Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos solo el código
COPY distri_base.py .

# Variables útiles
ENV PYTHONUNBUFFERED=1

# Por defecto ejecuto el script
CMD ["python", "distri_base.py"]

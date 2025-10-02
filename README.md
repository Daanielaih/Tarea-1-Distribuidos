# Plataforma de Análisis de Preguntas y Respuestas - Sistemas Distribuidos

## Descripción del Proyecto
Sistema distribuido para comparar y analizar la calidad de respuestas generadas por un LLM (Google Gemini) frente a respuestas humanas del dataset de Yahoo! Answers. El sistema implementa un pipeline modular con generación de tráfico sintético, sistema de caché, evaluación de calidad con similitud de coseno y almacenamiento persistente.


## Módulos Principales

### Generador de Tráfico
- Simula consultas de usuarios con distribuciones **Uniforme** y **Exponencial**
- Extrae preguntas aleatorias del dataset de Yahoo! Answers
- Configuración flexible de tasas de llegada

### Sistema de Caché
- Implementa políticas **LRU** (Least Recently Used) y **LFU** (Least Frequently Used)
- Tamaño configurable (default: 10 elementos)
- Soporte para TTL (Time To Live)
- Optimización de respuestas frecuentes

### Generador de Respuestas
- Integración con **Google Gemini 2.5 Flash API**
- Procesamiento de preguntas no resueltas por caché
- Manejo de errores y contenido bloqueado

### Módulo Score
- Evaluación de calidad con **Similitud de Coseno**
- Comparación semántica entre respuestas LLM y humanas usando embeddings
- Métricas de similitud basadas en vectores

### Sistema de Almacenamiento
- Base de datos **SQLite** para persistencia ligera
- Almacenamiento de preguntas, respuestas, scores y contadores de consultas
- Consultas estructuradas para análisis posterior

## Quick Start

### Prerrequisitos
```bash
Python 3.8+
Google Gemini API Key

## Instalación y Ejecución

# 1. Clonar repositorio
git clone https://github.com/Daanielaih\Tarea-1-Distribuidos.git
cd Tarea-1-Distribuidos

# 2. Instalar dependencias
pip install pandas numpy google-generativeai

# 3. Configurar API Key
export GEMINI_API_KEY= [En comentarios de la entrega]

# 4. Descargar dataset (opcional)
# Colocar test.csv en el directorio raíz

# 5. Ejecutar el sistema
python distri_base.py
```

## Configuración del sistema
### Parámetros de caché

```bash
# Tamaño de caché
CACHE_SIZE = 10

# Política de remoción: "LRU" o "LFU"
CACHE_POLICY = "LRU"

# TTL en segundos (opcional)
CACHE_TTL = 300
```

### Distribuciones de Tráfico
```bash
# Distribución Uniforme (1-5 segundos entre consultas)
tg_uniform = TrafficGenerator(df, distribution="uniform", uniform_low=1, uniform_high=5)

# Distribución Exponencial (λ = 0.5)
tg_exp = TrafficGenerator(df, distribution="exponential", lam=0.5)

#Se cambia dependiendo de la que se vaya usar.
```

## Métricas y Análisis

### Rendimiento de Caché
Hit Rate: Porcentaje de aciertos en caché  
Miss Rate: Porcentaje de fallos en caché  
Tiempo promedio de respuesta

### Calidad de Respuestas
Similitud de Coseno: Score entre 0-1 que mide similitud semántica
Comparativa LLM vs Respuestas Humanas

## Estructura del Proyecto
```bash
├── distri_base.py          # Código principal del sistema
├── README.md              # Este archivo
```


## Dependencias
```bash
pandas>=1.5.0
numpy>=1.21.0
google-generativeai>=0.3.0
```

## Autores
Ariel Jimenez - 21.498.436-9  
Daniela Pérez - 21.510.846-5  
Curso: Sistemas Distribuidos 2025-2  
Fecha: 1 de Octubre de 2025  

## Licencia
Este proyecto es para fines académicos como parte del curso de Sistemas Distribuidos.

## Recursos
Dataset Yahoo! Answers: https://www.kaggle.com/datasets/jarupula/yahoo-answers-dataset  
Google Gemini API:  https://ai.google.dev/gemini-api/docs




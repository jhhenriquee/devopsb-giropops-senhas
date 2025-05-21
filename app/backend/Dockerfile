# Etapa 1: build
FROM python:3.11-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential

COPY requirements.txt .

RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Etapa 2: imagem final (mais enxuta)
FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY app.py .
COPY templates/ templates/
COPY static/ static/
COPY . .

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]


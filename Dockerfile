FROM python:3.11-slim

WORKDIR /app

# Instala o curl e dependências do sistema
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia os arquivos da aplicação
COPY . /app

# Instala as dependências do Flask
RUN pip install --no-cache-dir flask

EXPOSE 5000

# Executa o app
CMD ["python", "app.py"]

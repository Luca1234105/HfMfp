FROM python:3.10-slim-buster

# Set working directory
WORKDIR /app

# Install git e pulizia cache apt
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Clona direttamente i repository nella cartella /app
RUN git clone https://github.com/Luca1234105/MediaProxyLuca.git . || true
RUN git clone https://github.com/Luca1234105/HfMfp.git . || true

# Installa i requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Espone la porta
EXPOSE 7860

# Comando di avvio
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]

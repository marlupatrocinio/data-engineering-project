#!/bin/bash

# Atualizar a VM
sudo apt update && sudo apt upgrade -y

# Instalar Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Instalar Docker Compose
sudo apt install docker-compose -y

# Instalar Python e venv
sudo apt install python3 python3-venv -y

# Instalar Git
sudo apt install git -y

# Clonar o repositório (se ainda não foi clonado)
if [ ! -d "data-engineering-project" ]; then
    git clone https://github.com/marlupatrocinio/data-engineering-project.git
fi
cd data-engineering-project

# Criar e ativar ambiente virtual
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# Instalar dependências do FastAPI
pip install -r fastapi_app/requirements.txt

# Mata qualquer processo usando a porta 8000
sudo kill -9 $(sudo lsof -t -i:8000) 2>/dev/null || true

# Iniciar o FastAPI
uvicorn fastapi_app.main:app --host 0.0.0.0 --port 8000 &
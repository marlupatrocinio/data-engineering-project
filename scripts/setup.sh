#update linux da VM
sudo apt update && sudo apt upgrade -y

# Instalar Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Instalar Docker Compose
sudo apt install docker-compose -y

# Instalar Python e Pip
sudo apt install python3 python3-pip -y

# Instalar Git
sudo apt install git -y

# Clonar o repositório
git clone https://github.com/seu-usuario/data-engineering-project.git
cd data-engineering-project

# Instalar dependências do FastAPI
pip install -r fastapi_app/requirements.txt

# Iniciar o FastAPI
uvicorn fastapi_app.main:app --host 0.0.0.0 --port 8000 &
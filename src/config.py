from dotenv import load_dotenv
import os

# Carrega variáveis do .env
load_dotenv()

# Configurações do banco
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

# URL de conexão (usada pelo SQLAlchemy)
DATABASE_URL = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"


print("🔍 Configurações carregadas:")
print("DB_HOST:", DB_HOST)
print("DB_PORT:", DB_PORT)
print("DB_NAME:", DB_NAME)
print("DB_USER:", DB_USER)
print("DB_PASSWORD:", DB_PASSWORD)

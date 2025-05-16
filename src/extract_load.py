import os
import pandas as pd
from sqlalchemy import create_engine
from config import DATABASE_URL

# Caminho base dos dados
BASE_PATH = os.path.join(os.path.dirname(__file__), '..', 'data')

# Mapeamento dos arquivos CSV para nomes de tabelas
DATASETS = {
    "olist_customers_dataset.csv": "customers",
    "olist_orders_dataset.csv": "orders",
    "olist_order_items_dataset.csv": "order_items",
    "olist_order_payments_dataset.csv": "payments",
    "olist_order_reviews_dataset.csv": "reviews",
    "olist_products_dataset.csv": "products",
    "olist_sellers_dataset.csv": "sellers",
    "product_category_name_translation.csv": "categories"
}

def load_data_to_postgres():
    # Criar conexão com SQLAlchemy
    engine = create_engine(DATABASE_URL)

    for filename, table_name in DATASETS.items():
        file_path = os.path.join(BASE_PATH, filename)

        if not os.path.exists(file_path):
            print(f"⚠️  Arquivo não encontrado: {file_path}")
            continue

        print(f"📥 Lendo {filename}...")
        df = pd.read_csv(file_path)

        print(f"🧱 Enviando para o banco como tabela '{table_name}'...")
        df.to_sql(table_name, engine, if_exists='replace', index=False)
        print(f"✅ Tabela '{table_name}' carregada com sucesso!\n")

    print("🚀 Todas as tabelas foram carregadas para o PostgreSQL.")

if __name__ == "__main__":
    load_data_to_postgres()



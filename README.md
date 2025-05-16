# 🛒 Olist E-commerce Data Warehouse

Projeto completo de Engenharia de Dados e Modelagem Dimensional baseado em dados reais do e-commerce Olist.

Este projeto simula uma arquitetura de dados analítica moderna utilizando o conceito de **camadas (Raw, Bronze, Prata, Ouro)** e implementa um **Data Warehouse com DBT** e PostgreSQL para análises em ferramentas como Power BI.

---

## 🧰 Tecnologias Utilizadas

- **Python** (ETL, ingestão de dados)
- **Pandas + SQLAlchemy**
- **PostgreSQL** (armazenamento e modelagem relacional)
- **DBT Core + dbt-postgres** (transformações e modelo dimensional)
- **Docker** (infraestrutura do banco de dados)
- **Power BI** (dashboards analíticos)
- **Git & GitHub**
- **WSL + VS Code** (ambiente de desenvolvimento)

---

## 🗂️ Estrutura do Projeto

```bash
olist_ecommerce/
├── data/                  # Arquivos CSV originais (dados brutos - camada Raw)
├── src/                   # Scripts Python de ingestão e staging (Bronze)
├── olist_dbt/             # Projeto DBT (camadas Prata e Ouro)
│   ├── models/
│   │   ├── staging/       # Transformações Bronze → Prata
│   │   ├── int/           # Integração intermediária
│   │   ├── marts/
│   │   │   ├── dimensoes/ # Dimensões (ex: Clientes, Produtos)
│   │   │   └── facts/     # Fatos (ex: Pagamentos, Pedidos)
│   └── dbt_project.yml
├── docker-compose.yml     # Serviço PostgreSQL
└── README.md              # Este documento

```
## 🚀 Como Executar o Projeto Localmente
#   1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/olist_ecommerce.git

cd olist_ecommerce´

```

#   2. Suba o PostgreSQL com Docker

```bash
docker-compose up -d
```

#   3. Crie e ative o ambiente virtual
```bash
python -m venv .venv
source .venv/bin/activate  # Linux/Wsl
# ou
.venv\Scripts\activate     # Windows

```
#   4. Instale as dependências
```bash
pip install -r requirements.txt

```
#   5. Ingestão de dados com Python

python src/extract_load.py

#   6. Execute o DBT
```bash
cd olist_dbt

dbt debug

dbt run

dbt test

```     
🔗 Publicação

Confira a publicação sobre este projeto no LinkedIn:

👉 Ver post no LinkedIn: https://www.linkedin.com/in/gildogomes/[post-id](https://www.linkedin.com/pulse/projeto-de-engenharia-dados-completo-com-do-olist-gildo-gomes-guarda-zyevf)


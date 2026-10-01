# Projeto de Análise de Vendas

Projeto desenvolvido para praticar **PostgreSQL, SQL, Views, Python e Pandas**, construindo um fluxo completo de consulta e análise de dados de vendas.

A proposta é utilizar um banco de dados relacional como fonte dos dados, criar consultas SQL e `VIEWs` para organizar as informações e, posteriormente, utilizar **Pandas** para realizar análises sobre esses dados.

## Objetivo

Construir um projeto de análise de dados seguindo o fluxo:

```text
PostgreSQL
    ↓
Tabelas
    ↓
SQL / JOINs / Agregações
    ↓
VIEW
    ↓
Python
    ↓
Pandas
    ↓
Análises e visualizações
```

O projeto busca demonstrar como **SQL e Pandas podem trabalhar juntos**, utilizando o banco de dados para organizar e consultar os dados e o Python para realizar análises mais aprofundadas.

## Tecnologias

* PostgreSQL
* SQL
* Python
* Pandas
* SQLAlchemy
* Matplotlib
* Jupyter Notebook

## Estrutura do projeto

```text
AnalyticsVendas/
│
├── sql/
│   ├── tables/
│   │   ├── customers.sql
│   │   ├── products.sql
│   │   ├── orders.sql
│   │   └── order_items.sql
│   │
│   ├── inserts/
│   │   └── seed.sql
│   │
│   └── views/
│       └── vendas_analise.sql
│
├── src/
│   ├── database/
│   │   └── connection.py
│   │
│   ├── analysis/
│   │   └── vendas.py
│   │
│   └── main.py
│
├── notebooks/
│   └── exploracao.ipynb
│
├── requirements.txt
└── README.md
```

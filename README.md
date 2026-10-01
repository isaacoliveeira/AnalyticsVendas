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

## Modelagem do banco

O banco será estruturado inicialmente com quatro tabelas principais:

### `customers`

Armazena os clientes.

```text
customer_id
name
city
```

### `products`

Armazena os produtos disponíveis para venda.

```text
product_id
name
category
```

### `orders`

Representa os pedidos realizados.

```text
order_id
customer_id
order_date
```

### `order_items`

Representa os produtos presentes em cada pedido.

```text
order_item_id
order_id
product_id
quantity
unit_price
```

Relacionamento simplificado:

```text
customers
    │
    │ 1:N
    ▼
orders
    │
    │ 1:N
    ▼
order_items
    │
    │ N:1
    ▼
products
```

## Views

Após a criação das tabelas, serão construídas `VIEWs` para disponibilizar os dados necessários para as análises.

Uma das principais será:

```text
vendas_analise
```

Essa `VIEW` combinará informações de diferentes tabelas utilizando `JOINs`.

Exemplo conceitual:

```sql
CREATE VIEW vendas_analise AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.name AS customer_name,
    p.product_id,
    p.name AS product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;
```

A `VIEW` permite consultar o resultado como uma tabela, sem criar uma nova tabela física para armazenar os dados.

## Integração com Pandas

O Python será responsável por consultar a `VIEW` no PostgreSQL e transformar o resultado em um `DataFrame`.

Exemplo:

```python
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg://usuario:senha@localhost:5432/vendas"
)

df = pd.read_sql(
    "SELECT * FROM vendas_analise",
    engine
)
```

Nesse momento, o resultado da `VIEW` passa a estar disponível no Pandas:

```text
PostgreSQL
    │
    │ SELECT * FROM vendas_analise
    ▼
Python
    │
    │ pd.read_sql()
    ▼
DataFrame
    │
    ▼
Pandas
```

## Análises

Com os dados disponíveis no `DataFrame`, poderão ser realizadas análises como:

* faturamento total;
* faturamento por período;
* faturamento por produto;
* faturamento por categoria;
* vendas por cliente;
* quantidade de produtos vendidos;
* ticket médio;
* produtos mais vendidos;
* clientes com maior volume de compras;
* evolução das vendas ao longo do tempo.

Exemplo:

```python
vendas_por_categoria = (
    df.groupby("category")["total"]
      .sum()
      .sort_values(ascending=False)
)
```

## Objetivo de aprendizado

O projeto tem como objetivo compreender, na prática, como diferentes ferramentas podem trabalhar em conjunto em um fluxo de análise de dados.

### SQL

Responsável principalmente por:

* consultar os dados;
* relacionar tabelas;
* utilizar `JOINs`;
* filtrar informações;
* realizar agregações;
* criar `VIEWs`.

### Pandas

Responsável principalmente por:

* carregar os dados;
* explorar os dados;
* realizar tratamentos;
* fazer análises;
* gerar estatísticas;
* preparar dados para visualização.

### PostgreSQL

Responsável por armazenar e disponibilizar os dados utilizados pelo projeto.

## Fluxo final

```text
                         PostgreSQL
                             │
                  ┌──────────┴──────────┐
                  │                     │
               Tabelas               Views
                  │                     │
                  └──────────┬──────────┘
                             │
                           Python
                             │
                           Pandas
                             │
                  Análises e visualizações
```

## Como executar

1. Crie o banco de dados no PostgreSQL e execute os scripts em `sql/tables/` para criar as tabelas.
2. Execute `sql/inserts/seed.sql` para popular o banco com dados de exemplo.
3. Execute `sql/views/vendas_analise.sql` para criar a `VIEW` de análise.
4. Instale as dependências do projeto:

```bash
pip install -r requirements.txt
```

5. Configure a conexão com o banco em `src/database/connection.py`.
6. Rode as análises via `src/main.py` ou explore os dados em `notebooks/exploracao.ipynb`.

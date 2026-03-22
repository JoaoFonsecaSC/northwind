# Northwind Traders — Analytics Engineering Project

End-to-end analytics pipeline built for the Northwind Traders business case, covering data ingestion, transformation, dimensional modeling and business analysis.

## Business Context

Northwind Traders is a small company (~30 employees, ~$1.5M/month revenue) that needed to move from ad-hoc spreadsheet reporting to an integrated data platform. The two strategic objectives driving this project:

- **Increase average ticket** (currently $1,525 per order)
- **Reduce customer churn** (16 of 91 customers at risk)

## Tech Stack

| Layer | Tool | Purpose |
|---|---|---|
| Source | PostgreSQL | ERP database |
| Ingestion | dbt Seeds | Load 14 CSV tables into DuckDB |
| Transformation | dbt Core 1.11 | Staging, intermediate, marts |
| Warehouse | DuckDB | Local analytical warehouse |
| Analysis | Python + Pandas | EDA and validation |
| Version Control | GitHub | Pipeline versioning |

## Architecture
```
PostgreSQL (ERP)
    → DuckDB (warehouse)
        → dbt Staging     (14 models — type casting, column standardization)
        → dbt Intermediate (5 models — joins, business logic, aggregations)
        → dbt Marts        (7 models — Star Schema: dims + fcts)
            → Analysis (Python/Pandas)
```

## Star Schema
```
dim_customers ──┐
dim_employees ──┤
dim_products  ──┼──► fct_orders
dim_shippers  ──┤
                └──► fct_customer_activity
                └──► fct_employee_performance
```

## Project Structure
```
northwind/
├── seeds/                          # 14 source CSV files
│   ├── orders.csv
│   ├── order_details.csv
│   ├── customers.csv
│   └── ...
├── models/
│   ├── staging/                    # Bronze — type casting and standardization
│   │   ├── stg_orders.sql
│   │   ├── stg_order_details.sql
│   │   ├── stg_customers.sql
│   │   └── ...
│   ├── intermediate/               # Silver — joins and business logic
│   │   ├── int_orders_items.sql
│   │   ├── int_employees_territories.sql
│   │   ├── int_products_suppliers.sql
│   │   ├── int_customer_orders.sql
│   │   └── int_employee_sales.sql
│   └── marts/                      # Gold — Star Schema
│       ├── dim_customers.sql
│       ├── dim_employees.sql
│       ├── dim_products.sql
│       ├── dim_shippers.sql
│       ├── fct_orders.sql
│       ├── fct_customer_activity.sql
│       └── fct_employee_performance.sql
└── dbt_project.yml
```

## Key Metrics (validated against Pandas)

| Metric | Value |
|---|---|
| Total Orders | 830 |
| Total Revenue | $1,265,793 |
| Average Ticket | $1,525 |
| Active Customers | 91 |
| Customers at Churn Risk | 16 (17.6%) |
| Period | Jul/1996 — May/1998 |

## Key Business Insights

### Ticket Average
- Austria ($3,200) and Ireland ($2,631) have tickets 2x above average — untapped premium markets
- Customers buying from 8 categories have 2.6x higher ticket (Pearson correlation: 0.57)
- Meat/Poultry ($942) and Produce ($735) are highest-value categories

### Churn
- 16 customers without purchase in the last 90 days
- Federal Shipping: 14.5% churn risk vs Speedy Express: 8.0%
- PB Knäckebröd AB supplier associated with 20.6% churn risk

### Sales Performance
- Margaret Peacock leads in total revenue ($232,891, 156 orders)
- Anne Dodsworth leads in average ticket ($1,798) with lowest churn rate (7%)

## Setup
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/northwind.git
cd northwind

# Create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dbt with DuckDB adapter
pip install dbt-core dbt-duckdb

# Configure profiles.yml (~/.dbt/profiles.yml)
# See profiles.yml.example for reference

# Load source data
dbt seed --full-refresh

# Run all transformations
dbt run

# Validate
dbt test
```

## profiles.yml example
```yaml
northwind:
  outputs:
    dev:
      type: duckdb
      path: dev.duckdb
      threads: 1
  target: dev
```

## Revenue Formula
```
revenue = unit_price × quantity × (1 - discount)
```

Freight is analyzed separately as an operational cost indicator — not included in revenue totals.

## Data Limitations

- `customer_customer_demo` and `customer_demographics` tables are empty in the current ERP
- May/1998 data is incomplete — excluded from trend analysis
- `ship_region` has 507 nulls out of 830 orders — geographic analysis uses `ship_country`

## Report

Full business report available as PDF — covers ticket analysis, churn analysis, sales performance, strategic recommendations and data architecture appendix.

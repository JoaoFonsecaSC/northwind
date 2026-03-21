with orders as (
    select * from "dev"."main"."stg_orders"
),
order_details as (
    select * from "dev"."main"."stg_order_details"
),
products as (
    select * from "dev"."main"."stg_products"
),
categories as (
    select * from "dev"."main"."stg_categories"
),
suppliers as (
    select * from "dev"."main"."stg_suppliers"
),
shippers as (
    select * from "dev"."main"."stg_shippers"
),
joined as (
    select
        -- chaves
        o.order_id,
        o.customer_id,
        o.employee_id,
        o.ship_via        as shipper_id,

        -- datas
        o.order_date,
        o.shipped_date,
        o.required_date,

        -- produto
        p.product_id,
        p.product_name,
        c.category_id,
        c.category_name,

        -- fornecedor
        s.supplier_id,
        s.company_name    as supplier_name,
        s.country         as supplier_country,

        -- transportadora
        sh.company_name   as shipper_name,

        -- métricas
        od.unit_price,
        od.quantity,
        od.discount,
        od.unit_price * od.quantity * (1 - od.discount) as revenue,
        o.freight

    from orders o
    inner join order_details od using(order_id)
    inner join products p using(product_id)
    inner join categories c using(category_id)
    inner join suppliers s using(supplier_id)
    inner join shippers sh on o.ship_via = sh.shipper_id
)

select * from joined
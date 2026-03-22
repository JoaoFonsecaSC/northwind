with orders as (
    select * from {{ ref('stg_orders') }}
),

order_details as (
    select * from {{ ref('stg_order_details') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

categories as (
    select * from {{ ref('stg_categories') }}
),

shippers as (
    select * from {{ ref('stg_shippers') }}
),

joined as (
    select
        -- chaves
        o.order_id,
        o.customer_id,
        o.employee_id,
        o.ship_via                                          as shipper_id,
        od.product_id,
        p.category_id,

        -- datas
        o.order_date,
        o.shipped_date,
        o.required_date,

        -- produto
        p.product_name,
        c.category_name,

        -- transportadora
        sh.company_name                                     as shipper_name,

        -- geografia de entrega
        o.ship_country,
        o.ship_city,

        -- métricas do item
        od.unit_price,
        od.quantity,
        od.discount,
        od.unit_price * od.quantity * (1 - od.discount)    as revenue,

        -- frete (nível do pedido, repetido por item)
        o.freight

    from orders o
    inner join order_details od  using(order_id)
    inner join products p        using(product_id)
    inner join categories c      using(category_id)
    inner join shippers sh       on o.ship_via = sh.shipper_id
)

select * from joined

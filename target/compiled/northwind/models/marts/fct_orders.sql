with orders_items as (
    select * from "dev"."main"."int_orders_items"
),

order_revenue as (
    select
        order_id,
        sum(revenue) as order_total_revenue
    from orders_items
    group by order_id
),

final as (
    select
        oi.order_id,
        oi.customer_id,
        oi.employee_id,
        oi.product_id,
        oi.category_id,
        oi.shipper_id,
        oi.order_date,
        oi.shipped_date,
        oi.required_date,
        oi.product_name,
        oi.category_name,
        oi.shipper_name,
        oi.ship_country,
        oi.ship_city,
        oi.unit_price,
        oi.quantity,
        oi.discount,
        oi.revenue,
        or_.order_total_revenue,
        oi.freight
    from orders_items oi
    inner join order_revenue or_ using(order_id)
)

select * from final
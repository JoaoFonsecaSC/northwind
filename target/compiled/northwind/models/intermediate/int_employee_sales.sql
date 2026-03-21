with orders_items as (
    select * from "dev"."main"."int_orders_items"
),

final as (
    select
        employee_id,
        count(distinct order_id)                as total_orders,
        sum(revenue)                            as total_revenue,
        avg(revenue)                            as avg_order_value,
        max(order_date)                         as last_order_date
    from orders_items
    group by employee_id
)

select * from final
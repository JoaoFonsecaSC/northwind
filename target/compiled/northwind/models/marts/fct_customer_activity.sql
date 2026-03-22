with customers as (
    select * from "dev"."main"."stg_customers"
),

customer_orders as (
    select * from "dev"."main"."int_customer_orders"
),

final as (
    select
        c.customer_id,
        c.company_name,
        c.city,
        c.country,
        co.last_order_date,
        co.days_since_last_order,
        co.is_active_90d,
        co.total_orders,
        co.total_revenue,
        co.avg_order_value,
        co.distinct_categories,
        co.orders_last_90d,
        co.revenue_last_90d,
        co.orders_last_120d,
        co.revenue_last_120d,
        co.orders_last_365d,
        co.revenue_last_365d
    from customers c
    inner join customer_orders co using(customer_id)
)

select * from final
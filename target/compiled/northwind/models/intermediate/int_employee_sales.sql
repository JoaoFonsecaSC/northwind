with orders_items as (
    select * from "dev"."main"."int_orders_items"
),

order_revenue as (
    select
        order_id,
        employee_id,
        customer_id,
        category_id,
        order_date,
        sum(revenue) as order_total_revenue
    from orders_items
    group by order_id, employee_id, customer_id, category_id, order_date
),

agg as (
    select
        employee_id,
        count(distinct order_id)        as total_orders,
        sum(order_total_revenue)        as total_revenue,
        avg(order_total_revenue)        as avg_order_value,
        max(order_date)                 as last_order_date,
        min(order_date)                 as first_order_date,
        count(distinct customer_id)     as distinct_customers,
        count(distinct category_id)     as distinct_categories_sold
    from order_revenue
    group by employee_id
)

select * from agg
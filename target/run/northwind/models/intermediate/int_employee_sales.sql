
  
  create view "dev"."main"."int_employee_sales__dbt_tmp" as (
    with orders_items as (
    select * from "dev"."main"."int_orders_items"
),

agg as (
    select
        employee_id,
        count(distinct order_id)    as total_orders,
        sum(revenue)                as total_revenue,
        avg(revenue)                as avg_order_value,
        max(order_date)             as last_order_date,
        min(order_date)             as first_order_date,
        count(distinct customer_id) as distinct_customers,
        count(distinct category_id) as distinct_categories_sold
    from orders_items
    group by employee_id
)

select * from agg
  );

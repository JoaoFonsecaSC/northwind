
  
  create view "dev"."main"."fct_customer_activity__dbt_tmp" as (
    with customer_orders as (
    select * from "dev"."main"."int_customer_orders"
),

customers as (
    select * from "dev"."main"."stg_customers"
),

final as (
    select
        c.customer_id,
        c.company_name,
        c.city,
        c.country,
        co.last_order_date,
        co.is_active_90d,
        co.orders_last_90d,
        co.orders_last_120d,
        co.orders_last_365d,
        co.revenue_last_90d,
        co.revenue_last_120d,
        co.revenue_last_365d
    from customers c
    inner join customer_orders co using(customer_id)
)

select * from final
  );

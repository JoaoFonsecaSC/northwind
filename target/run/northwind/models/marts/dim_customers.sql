
  
    
    

    create  table
      "dev"."main"."dim_customers__dbt_tmp"
  
    as (
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
        c.contact_title,
        c.city,
        c.region,
        c.country,
        c.postal_code,
        co.last_order_date,
        co.days_since_last_order,
        coalesce(co.is_active_90d, false)   as is_active_90d,
        coalesce(co.total_orders, 0)        as total_orders,
        coalesce(co.total_revenue, 0)       as total_revenue,
        coalesce(co.avg_order_value, 0)     as avg_order_value,
        coalesce(co.distinct_categories, 0) as distinct_categories,
        coalesce(co.orders_last_90d, 0)     as orders_last_90d,
        coalesce(co.orders_last_120d, 0)    as orders_last_120d,
        coalesce(co.orders_last_365d, 0)    as orders_last_365d,
        coalesce(co.revenue_last_90d, 0)    as revenue_last_90d,
        coalesce(co.revenue_last_120d, 0)   as revenue_last_120d,
        coalesce(co.revenue_last_365d, 0)   as revenue_last_365d
    from customers c
    left join customer_orders co using(customer_id)
)

select * from final
    );
  
  

  
  create view "dev"."main"."int_customer_orders__dbt_tmp" as (
    with orders_items as (
    select * from "dev"."main"."int_orders_items"
),

final as (
    select
        customer_id,
        max(order_date)                         as last_order_date,

        -- booleano ativo nos últimos 90 dias
        max(order_date) >= current_date - interval '90' day as is_active_90d,

        -- pedidos por período
        count(distinct case when order_date >= current_date - interval '90' day
            then order_id end)                  as orders_last_90d,
        count(distinct case when order_date >= current_date - interval '120' day
            then order_id end)                  as orders_last_120d,
        count(distinct case when order_date >= current_date - interval '365' day
            then order_id end)                  as orders_last_365d,

        -- receita por período
        sum(case when order_date >= current_date - interval '90' day
            then revenue else 0 end)            as revenue_last_90d,
        sum(case when order_date >= current_date - interval '120' day
            then revenue else 0 end)            as revenue_last_120d,
        sum(case when order_date >= current_date - interval '365' day
            then revenue else 0 end)            as revenue_last_365d

    from orders_items
    group by customer_id
)

select * from final
  );

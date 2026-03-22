
  
  create view "dev"."main"."int_customer_orders__dbt_tmp" as (
    with orders_items as (
    select * from "dev"."main"."int_orders_items"
),

-- data de referência = último pedido nos dados
ref_date as (
    select max(order_date) as max_date
    from orders_items
),

agg as (
    select
        oi.customer_id,

        -- última compra e dias sem comprar
        max(oi.order_date)                                              as last_order_date,
        date_diff('day', max(oi.order_date), r.max_date)                as days_since_last_order,

        -- flag de churn (sem compra nos últimos 90 dias)
        case
            when date_diff('day', max(oi.order_date), r.max_date) <= 90
            then true else false
        end                                                             as is_active_90d,

        -- pedidos por período
        count(distinct case
            when date_diff('day', oi.order_date, r.max_date) <= 90
            then oi.order_id end)                                       as orders_last_90d,
        count(distinct case
            when date_diff('day', oi.order_date, r.max_date) <= 120
            then oi.order_id end)                                       as orders_last_120d,
        count(distinct case
            when date_diff('day', oi.order_date, r.max_date) <= 365
            then oi.order_id end)                                       as orders_last_365d,

        -- receita por período
        sum(case
            when date_diff('day', oi.order_date, r.max_date) <= 90
            then oi.revenue else 0 end)                                 as revenue_last_90d,
        sum(case
            when date_diff('day', oi.order_date, r.max_date) <= 120
            then oi.revenue else 0 end)                                 as revenue_last_120d,
        sum(case
            when date_diff('day', oi.order_date, r.max_date) <= 365
            then oi.revenue else 0 end)                                 as revenue_last_365d,

        -- totais históricos
        count(distinct oi.order_id)                                     as total_orders,
        sum(oi.revenue)                                                 as total_revenue,
        avg(oi.revenue)                                                 as avg_order_value,
        count(distinct oi.category_id)                                  as distinct_categories

    from orders_items oi
    cross join ref_date r
    group by oi.customer_id, r.max_date
)

select * from agg
  );

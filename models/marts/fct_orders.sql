with orders_items as (
    select * from {{ ref('int_orders_items') }}
),

final as (
    select
        -- chaves
        order_id,
        customer_id,
        employee_id,
        product_id,
        category_id,
        supplier_id,
        shipper_id,
        order_date      as date_id,

        -- métricas
        unit_price,
        quantity,
        discount,
        revenue,
        freight

    from orders_items
)

select * from final

with products as (
    select * from {{ ref('int_products_suppliers') }}
),

final as (
    select
        product_id,
        product_name,
        category_id,
        category_name,
        category_description,
        supplier_id,
        supplier_name,
        supplier_city,
        supplier_country,
        unit_price,
        quantity_per_unit,
        units_in_stock,
        units_on_order,
        reorder_level,
        discontinued
    from products
)

select * from final

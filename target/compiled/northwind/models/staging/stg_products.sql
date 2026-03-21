with source as (
    select * from "dev"."main"."products"
),

renamed as (
    select
        product_id::integer         as product_id,
        product_name::varchar       as product_name,
        supplier_id::integer        as supplier_id,
        category_id::integer        as category_id,
        quantity_per_unit::varchar  as quantity_per_unit,
        unit_price::decimal         as unit_price,
        units_in_stock::integer     as units_in_stock,
        units_on_order::integer     as units_on_order,
        reorder_level::integer      as reorder_level,
        discontinued::boolean       as discontinued
    from source
)

select * from renamed
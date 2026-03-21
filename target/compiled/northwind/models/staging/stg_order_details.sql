with source as (
    select * from "dev"."main"."order_details"
),

renamed as (
    select
        order_id::integer     as order_id,
        product_id::integer   as product_id,
        unit_price::decimal   as unit_price,
        quantity::integer     as quantity,
        discount::decimal     as discount
    from source
)

select * from renamed
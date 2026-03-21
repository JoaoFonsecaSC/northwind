with source as (
    select * from "dev"."main"."categories"
),
renamed as (
    select
        category_id::integer        as  category_id,
        category_name::varchar      as  category_name,
        "description"::varchar      as category_description
        -- picture descartado: dado binário, sem uso analítico
    from source
)
select * from renamed
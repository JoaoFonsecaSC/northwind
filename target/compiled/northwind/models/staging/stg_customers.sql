with source as (
    select * from "dev"."main"."customers"
),

renamed as (
    select
        customer_id::varchar    as customer_id,
        company_name::varchar   as company_name,
        contact_name::varchar   as contact_name,
        contact_title::varchar  as contact_title,
        address::varchar        as address,
        city::varchar           as city,
        region::varchar         as region,
        postal_code::varchar    as postal_code,
        country::varchar        as country,
        phone::varchar          as phone,
        fax::varchar            as fax
    from source
)

select * from renamed
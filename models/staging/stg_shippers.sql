with source as (
    select * from {{ ref('shippers') }}
),

renamed as (
    select
        shipper_id::integer     as shipper_id,
        company_name::varchar   as company_name,
        phone::varchar          as phone
    from source
)

select * from renamed
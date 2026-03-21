with source as (
    select * from {{ ref('customer_customer_demo') }}
),

renamed as (
    select
        customer_id::varchar      as customer_id,
        customer_type_id::varchar as customer_type_id
    from source
)

select * from renamed

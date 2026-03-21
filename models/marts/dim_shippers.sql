with shippers as (
    select * from {{ ref('stg_shippers') }}
),

final as (
    select
        shipper_id,
        company_name,
        phone
    from shippers
)

select * from final

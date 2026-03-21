with source as (
    select * from {{ ref('employee_territories') }}
),

renamed as (
    select
        employee_id::integer  as employee_id,
        territory_id::varchar as territory_id
    from source
)

select * from renamed

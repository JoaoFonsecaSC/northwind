with source as (
    select * from {{ ref('region') }}
),

renamed as (
    select
        region_id::integer          as region_id,
        region_description::varchar as region_description
    from source
)

select * from renamed

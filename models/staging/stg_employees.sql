with source as (
    select * from {{ ref('employees') }}
),

renamed as (
    select
        employee_id::integer        as employee_id,
        last_name::varchar          as last_name,
        first_name::varchar         as first_name,
        title::varchar              as title,
        title_of_courtesy::varchar  as title_of_courtesy,
        birth_date::date            as birth_date,
        hire_date::date             as hire_date,
        address::varchar            as address,
        city::varchar               as city,
        region::varchar             as region,
        postal_code::varchar        as postal_code,
        country::varchar            as country,
        home_phone::varchar         as home_phone,
        extension::varchar          as extension,
        reports_to::integer         as reports_to
        -- photo e photo_path descartados: dados binários, sem uso analítico
        -- notes descartado: texto livre, sem uso analítico
    from source
)

select * from renamed
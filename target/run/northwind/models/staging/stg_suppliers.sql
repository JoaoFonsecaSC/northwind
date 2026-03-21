
  
  create view "dev"."main"."stg_suppliers__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."suppliers"
),

renamed as (
    select
        supplier_id::integer    as supplier_id,
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
        -- homepage descartado: sem uso analítico
    from source
)

select * from renamed
  );


  
  create view "dev"."main"."stg_shippers__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."shippers"
),

renamed as (
    select
        shipper_id::integer     as shipper_id,
        company_name::varchar   as company_name,
        phone::varchar          as phone
    from source
)

select * from renamed
  );

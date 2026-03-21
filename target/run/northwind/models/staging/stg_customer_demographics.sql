
  
  create view "dev"."main"."stg_customer_demographics__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."customer_demographics"
),

renamed as (
    select
        customer_type_id::varchar as customer_type_id,
        customer_desc::varchar    as customer_desc
    from source
)

select * from renamed
  );

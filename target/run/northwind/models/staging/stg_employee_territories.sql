
  
  create view "dev"."main"."stg_employee_territories__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."employee_territories"
),

renamed as (
    select
        employee_id::integer  as employee_id,
        territory_id::varchar as territory_id
    from source
)

select * from renamed
  );

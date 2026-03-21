
  
  create view "dev"."main"."stg_orders__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."orders"
),

renamed as (
    select
        order_id::integer         as order_id,
        customer_id::varchar      as customer_id,
        employee_id::integer      as employee_id,
        order_date::date          as order_date,
        required_date::date       as required_date,
        shipped_date::date        as shipped_date,
        ship_via::integer         as ship_via,
        freight::decimal          as freight,
        ship_name::varchar        as ship_name,
        ship_address::varchar     as ship_address,
        ship_city::varchar        as ship_city,
        ship_region::varchar      as ship_region,
        ship_postal_code::varchar as ship_postal_code,
        ship_country::varchar     as ship_country
    from source
)

select * from renamed
  );

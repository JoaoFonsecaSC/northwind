
  
  create view "dev"."main"."stg_territories__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."territories"
),

renamed as (
    select
        territory_id::varchar           as territory_id,
        territory_description::varchar  as territory_description,
        region_id::integer              as region_id
    from source
)

select * from renamed
  );

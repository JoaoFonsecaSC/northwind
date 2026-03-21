
  
  create view "dev"."main"."stg_us_states__dbt_tmp" as (
    with source as (
    select * from "dev"."main"."us_states"
),

renamed as (
    select
        state_id::integer       as state_id,
        state_name::varchar     as state_name,
        state_abbr::varchar     as state_abbr,
        state_region::varchar   as state_region
    from source
)

select * from renamed
  );


  
    
    

    create  table
      "dev"."main"."dim_shippers__dbt_tmp"
  
    as (
      with shippers as (
    select * from "dev"."main"."stg_shippers"
),

final as (
    select
        shipper_id,
        company_name,
        phone
    from shippers
)

select * from final
    );
  
  
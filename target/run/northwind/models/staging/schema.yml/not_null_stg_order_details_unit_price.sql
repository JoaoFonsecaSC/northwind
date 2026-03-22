
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select unit_price
from "dev"."main"."stg_order_details"
where unit_price is null



  
  
      
    ) dbt_internal_test
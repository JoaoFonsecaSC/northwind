
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select shipper_id
from "dev"."main"."dim_shippers"
where shipper_id is null



  
  
      
    ) dbt_internal_test

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select shipper_id
from "dev"."main"."stg_shippers"
where shipper_id is null



  
  
      
    ) dbt_internal_test
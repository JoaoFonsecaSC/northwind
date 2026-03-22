
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_id
from "dev"."main"."int_products_suppliers"
where product_id is null



  
  
      
    ) dbt_internal_test
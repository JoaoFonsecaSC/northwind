
    
    

select
    product_id as unique_field,
    count(*) as n_records

from "dev"."main"."int_products_suppliers"
where product_id is not null
group by product_id
having count(*) > 1



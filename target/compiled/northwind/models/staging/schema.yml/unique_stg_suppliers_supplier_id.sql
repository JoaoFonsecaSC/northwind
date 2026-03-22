
    
    

select
    supplier_id as unique_field,
    count(*) as n_records

from "dev"."main"."stg_suppliers"
where supplier_id is not null
group by supplier_id
having count(*) > 1



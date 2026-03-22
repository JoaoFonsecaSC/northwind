
    
    

select
    employee_id as unique_field,
    count(*) as n_records

from "dev"."main"."fct_employee_performance"
where employee_id is not null
group by employee_id
having count(*) > 1



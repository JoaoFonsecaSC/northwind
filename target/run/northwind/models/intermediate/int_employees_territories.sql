
  
  create view "dev"."main"."int_employees_territories__dbt_tmp" as (
    with employees as (
    select * from "dev"."main"."stg_employees"
),

employee_territories as (
    select * from "dev"."main"."stg_employee_territories"
),

territories as (
    select * from "dev"."main"."stg_territories"
),

region as (
    select * from "dev"."main"."stg_region"
),

joined as (
    select
        e.employee_id,
        e.first_name,
        e.last_name,
        e.title,
        e.hire_date,
        e.city,
        e.region,
        e.country,
        e.reports_to,
        t.territory_description,
        r.region_description,

        -- cálculos de idade e tempo de casa
        date_diff('year', e.birth_date, current_date) as age,
        case
            when date_diff('year', e.birth_date, current_date) < 30 then 'Menos de 30'
            when date_diff('year', e.birth_date, current_date) < 40 then '30-40'
            when date_diff('year', e.birth_date, current_date) < 50 then '40-50'
            else 'Acima de 50'
        end as age_group,
        date_diff('year', e.hire_date, current_date) as years_at_company

    from employees e
    inner join employee_territories et using(employee_id)
    inner join territories t using(territory_id)
    inner join region r using(region_id)
)

select * from joined
  );

with employees as (
    select * from {{ ref('stg_employees') }}
),

employee_territories as (
    select * from {{ ref('stg_employee_territories') }}
),

territories as (
    select * from {{ ref('stg_territories') }}
),

region as (
    select * from {{ ref('stg_region') }}
),

joined as (
    select
        e.employee_id,
        e.first_name,
        e.last_name,
        e.title,
        e.birth_date,
        e.hire_date,
        e.city,
        e.region,
        e.country,
        e.reports_to,
        t.territory_description,
        r.region_description

    from employees e
    inner join employee_territories et using(employee_id)
    inner join territories t using(territory_id)
    inner join region r using(region_id)
)

select * from joined

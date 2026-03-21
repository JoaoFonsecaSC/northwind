with employees as (
    select * from {{ ref('int_employees_territories') }}
),

final as (
    select
        employee_id,
        first_name,
        last_name,
        title,
        hire_date,
        city,
        region,
        country,
        reports_to,
        territory_description,
        region_description,
        age,
        age_group,
        years_at_company
    from employees
)

select * from final

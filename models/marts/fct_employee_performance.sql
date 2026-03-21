with employee_sales as (
    select * from {{ ref('int_employee_sales') }}
),

employees as (
    select * from {{ ref('int_employees_territories') }}
),

final as (
    select
        e.employee_id,
        e.first_name,
        e.last_name,
        e.title,
        e.territory_description,
        e.region_description,
        e.age_group,
        e.years_at_company,
        s.total_orders,
        s.total_revenue,
        s.avg_order_value,
        s.last_order_date
    from employees e
    inner join employee_sales s using(employee_id)
)

select * from final

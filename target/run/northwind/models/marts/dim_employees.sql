
  
  create view "dev"."main"."dim_employees__dbt_tmp" as (
    with employees as (
    select * from "dev"."main"."int_employees_territories"
),

sales as (
    select * from "dev"."main"."int_employee_sales"
),

final as (
    select
        e.employee_id,
        e.full_name,
        e.first_name,
        e.last_name,
        e.title,
        e.hire_date,
        e.city,
        e.country,
        e.territories,
        e.region_description,
        e.age_group,
        e.years_at_company,
        e.reports_to,
        s.total_orders,
        s.total_revenue,
        s.avg_order_value,
        s.last_order_date,
        s.distinct_customers,
        s.distinct_categories_sold
    from employees e
    inner join sales s using(employee_id)
)

select * from final
  );

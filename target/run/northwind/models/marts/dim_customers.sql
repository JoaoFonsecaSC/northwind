
  
  create view "dev"."main"."dim_customers__dbt_tmp" as (
    with customers as (
    select * from "dev"."main"."stg_customers"
),

final as (
    select
        customer_id,
        company_name,
        contact_title,
        city,
        region,
        country,
        postal_code
    from customers
)

select * from final
  );

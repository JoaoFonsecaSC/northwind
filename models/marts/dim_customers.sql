with customers as (
    select * from {{ ref('stg_customers') }}
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

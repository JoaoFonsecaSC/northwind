
  
  create view "dev"."main"."int_products_suppliers__dbt_tmp" as (
    with products as (
    select * from "dev"."main"."stg_products"
),

suppliers as (
    select * from "dev"."main"."stg_suppliers"
),

categories as (
    select * from "dev"."main"."stg_categories"
),

joined as (
    select
        p.product_id,
        p.product_name,
        p.quantity_per_unit,
        p.unit_price,
        p.units_in_stock,
        p.units_on_order,
        p.reorder_level,
        p.discontinued,
        c.category_id,
        c.category_name,
        c.category_description,
        s.supplier_id,
        s.company_name  as supplier_name,
        s.city          as supplier_city,
        s.country       as supplier_country

    from products p
    inner join suppliers s  using(supplier_id)
    inner join categories c using(category_id)
)

select * from joined
  );

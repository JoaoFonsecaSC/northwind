with date_spine as (
    select unnest(generate_series(
        '1996-01-01'::date,
        '2000-12-31'::date,
        interval '1 day'
    )) as date_day
),

final as (
    select
        date_day                                        as date_id,
        extract(year from date_day)::integer            as year,
        extract(quarter from date_day)::integer         as quarter,
        extract(month from date_day)::integer           as month,
        monthname(date_day)                             as month_name,
        extract(week from date_day)::integer            as week,
        extract(day from date_day)::integer             as day,
        dayname(date_day)                               as day_name,
        case when dayofweek(date_day) in (1, 7)
            then true else false end                    as is_weekend
    from date_spine
)

select * from final

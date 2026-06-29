with days as (
    -- Generates a clean sequence of dates using Snowflake's generator function
    select 
        dateadd(day, seq4(), '2026-01-01')::date as date_day
    from table(generator(rowcount => 365))
)

select date_day from days
with source as (
    select * from {{ source('ecom_raw', 'raw_orders') }}
),
renamed as (
    select
        order_id as order_id,
        customer_id as customer_id,
        order_date as ordered_at,
        upper(status) as order_status
    from source
)
select * from renamed
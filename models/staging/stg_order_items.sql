with source as (
    select * from {{ source('ecom_raw', 'raw_order_items') }}
),
renamed as (
    select
        item_id as order_item_id,
        order_id as order_id,
        product_id as product_id,
        cast(price as float) as item_price_usd
    from source
)
select * from renamed
with order_items as (
    select * from {{ ref('stg_order_items') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

joined as (
    select
        item.order_item_id,
        item.order_id,
        ord.customer_id,
        ord.ordered_at,
        ord.order_status,
        item.item_price_usd
    from order_items as item
    left join orders as ord 
        on item.order_id = ord.order_id
)

select * from joined
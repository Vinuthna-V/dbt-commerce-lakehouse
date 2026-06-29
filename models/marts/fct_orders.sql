with intermediate_grossed as (
    -- Read directly from our Step 3 intermediate model
    select * from {{ ref('int_order_items_grossed') }}
),

aggregated_orders as (
    select
        order_id,
        customer_id,
        ordered_at,
        order_status,
        -- Calculate key business metrics per order
        count(order_item_id) as total_items,
        sum(item_price_usd) as total_revenue_usd
    from intermediate_grossed
    group by 1, 2, 3, 4
)

select * from aggregated_orders
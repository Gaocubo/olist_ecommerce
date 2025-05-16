with base as (
    select
        order_id as id_pedido,
        customer_id as id_cliente,
        cast(order_status as text) as status_pedido,
        cast(order_purchase_timestamp as date) as dt_compra,
        cast(order_approved_at as date) as dt_aprovacao,
        cast(order_delivered_carrier_date as date) as dt_envio_transportadora,
        cast(order_delivered_customer_date as date) as dt_entrega_cliente,
        cast(order_estimated_delivery_date as date) as dt_entrega_estimada
    from {{ ref('stg_orders') }}
    where order_id is not null
)

select * from base



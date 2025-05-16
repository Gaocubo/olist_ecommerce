with base as (
    select
        order_id as id_pedido,
        order_item_id as id_item_pedido,
        product_id as id_produto,
        seller_id as id_vendedor,
        cast(price as numeric(10,2)) as preco_unitario,
        cast(freight_value as numeric(10,2)) as valor_frete,
        1 as quantidade
    from {{ ref('stg_order_items') }}
    where order_id is not null
)

select * from base


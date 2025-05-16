with pedidos as (
    select
        o.id_pedido,
        c.sk_cliente,
        p.sk_produto,
        v.sk_vendedor,
        oi.id_item_pedido,
        o.dt_compra,
        o.dt_aprovacao,
        o.status_pedido,
        oi.preco_unitario,
        oi.valor_frete,
        -- Total por item
        (oi.preco_unitario + oi.valor_frete) as valor_total_item
    from {{ ref('int_orders') }} o
    left join {{ ref('dim_clientes') }} c
        on o.id_cliente = c.id_cliente
    left join {{ ref('int_order_items') }} oi
        on o.id_pedido = oi.id_pedido
    left join {{ ref('dim_produtos') }} p
        on oi.id_produto = p.id_produto
    left join {{ ref('dim_vendedores') }} v
        on oi.id_vendedor = v.id_vendedor
)

select
    {{ dbt_utils.generate_surrogate_key(['id_pedido', 'sk_produto', 'sk_vendedor']) }} as sk_fato_pedido,
    *
from pedidos


with pagamentos_agrupados as (
    select
        id_pedido,
        sum(valor_pago) as valor_total_pago
    from {{ ref('int_payments') }}
    group by id_pedido
),

itens_validos as (
    -- Garante que só traga itens de pedidos que existem na int_orders
    select
        i.*
    from {{ ref('int_order_items') }} i
    inner join {{ ref('int_orders') }} o
        on i.id_pedido = o.id_pedido
),

pedidos as (
    select
        o.id_pedido,
        c.sk_cliente,
        p.sk_produto,
        v.sk_vendedor,
        i.id_item_pedido,
        o.dt_compra,
        o.dt_aprovacao,
        t.sk_data as sk_data_pedido,         -- Join com a dim_temporal
        o.status_pedido,
        i.preco_unitario,
        i.valor_frete,
        (i.preco_unitario + i.valor_frete) as valor_total_item,
        pg.valor_total_pago
    from {{ ref('int_orders') }} o
    left join {{ ref('dim_clientes') }} c
        on o.id_cliente = c.id_cliente
    inner join itens_validos i
        on o.id_pedido = i.id_pedido
    left join {{ ref('dim_produtos') }} p
        on i.id_produto = p.id_produto
    left join {{ ref('dim_vendedores') }} v
        on i.id_vendedor = v.id_vendedor
    left join pagamentos_agrupados pg
        on o.id_pedido = pg.id_pedido
    left join {{ ref('dim_temporal') }} t
        on cast(o.dt_compra as date) = t.data
)

select
    {{ dbt_utils.generate_surrogate_key(['id_pedido', 'sk_produto', 'sk_vendedor']) }} as sk_fato_pedido,
    *
from pedidos





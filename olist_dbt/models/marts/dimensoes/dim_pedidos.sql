with pedidos as (
    select distinct
        o.id_pedido,
        o.id_cliente,
        o.dt_compra,
        o.dt_aprovacao,
        o.status_pedido
    from {{ ref('int_orders') }} o
)

select
    {{ dbt_utils.generate_surrogate_key(['id_pedido']) }} as sk_pedido,
    *
from pedidos

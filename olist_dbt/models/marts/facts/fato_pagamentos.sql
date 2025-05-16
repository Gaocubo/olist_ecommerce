with pagamentos as (
    select
        p.id_pedido as id_pedido,
        c.sk_cliente,
        t.sk_data as sk_data_pagamento,
        p.payment_sequential,
        p.tipo_pagamento,
        p.parcelas,
        cast(p.valor_pago as numeric) as valor_pago

    from {{ ref('int_payments') }} p
    left join {{ ref('int_orders') }} o
        on p.id_pedido = o.id_pedido
    left join {{ ref('dim_clientes') }} c
        on o.id_cliente = c.id_cliente
    left join {{ ref('dim_temporal') }} t
        on o.dt_compra = t.data  -- se não houver data de pagamento, essa é uma boa aproximação
)

select
    {{ dbt_utils.generate_surrogate_key(['id_pedido', 'payment_sequential']) }} as sk_fato_pagamento,
    *
from pagamentos
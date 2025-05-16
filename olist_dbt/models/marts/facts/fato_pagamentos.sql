with pagamentos as (
    select
        p.id_pedido,
        d.sk_pedido,
        c.sk_cliente,
        t.sk_data as sk_data_pagamento,
        tp.sk_tipo_pagamento,
        p.payment_sequential,
        p.parcelas,
        p.valor_pago
    from {{ ref('int_payments') }} p
    left join {{ ref('dim_pedidos') }} d
        on p.id_pedido = d.id_pedido
    left join {{ ref('dim_clientes') }} c
        on d.id_cliente = c.id_cliente
    left join {{ ref('dim_temporal') }} t
        on d.dt_compra = t.data  -- Proxy para data de pagamento
    left join {{ ref('dim_tipo_pagamento') }} tp
        on p.tipo_pagamento = tp.tipo_pagamento
)

select
    {{ dbt_utils.generate_surrogate_key(['id_pedido', 'payment_sequential']) }} as sk_fato_pagamento,
    id_pedido,
    sk_pedido,
    sk_cliente,
    sk_data_pagamento,
    sk_tipo_pagamento,
    payment_sequential,
    parcelas,
    valor_pago
from pagamentos


with pagamentos as (
    select
        order_id as id_pedido,
        payment_sequential,
        upper(payment_type) as tipo_pagamento,
        payment_installments as parcelas,
        cast(payment_value as numeric(10,2)) as valor_pago
    from {{ ref('stg_payments') }}
)

select * from pagamentos


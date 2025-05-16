with pagamentos as (
    select distinct
        tipo_pagamento
    from {{ ref('int_payments') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['tipo_pagamento']) }} as sk_tipo_pagamento,
    tipo_pagamento
from pagamentos


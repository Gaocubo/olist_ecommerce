with base as (
    select
        cast(customer_id as varchar) as id_cliente,           -- id alfanumérico, trate como string, mas não upper
        upper(customer_unique_id) as id_unico_cliente,        -- se for texto, pode usar upper
        upper(customer_zip_code_prefix::varchar) as cep,      -- faça cast para texto antes de upper
        upper(customer_city) as cidade,
        upper(customer_state) as estado
    from {{ ref('stg_customers') }}
    where customer_id is not null
),

com_surrogate_key as (
    select
        row_number() over (order by id_cliente) as sk_cliente,
        *
    from base
)

select * from com_surrogate_key

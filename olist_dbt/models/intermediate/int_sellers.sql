with base as (
    select
        seller_id as id_vendedor,
        upper(seller_city) as cidade,
        upper(seller_state) as estado
    from {{ ref('stg_sellers') }}
    where seller_id is not null
),

com_surrogate_key as (
    select
        row_number() over (order by id_vendedor) as sk_vendedor,
        *
    from base
)

select * from com_surrogate_key

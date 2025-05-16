with base as (
    select
        product_id as id_produto,
        upper(product_category_name) as categoria,
        cast(product_weight_g as integer) as peso,
        cast(product_length_cm as integer) as comprimento,
        cast(product_height_cm as integer) as altura,
        cast(product_width_cm as integer) as largura
    from {{ ref('stg_products') }}
    where product_id is not null
),

com_surrogate_key as (
    select
        row_number() over (order by id_produto) as sk_produto,
        *
    from base
)

select * from com_surrogate_key


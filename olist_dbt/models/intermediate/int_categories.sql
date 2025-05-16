with base as (
    select
        row_number() over (order by product_category_name) as sk_categoria,
        upper(trim(product_category_name)) as nome_categoria
    from {{ ref('stg_categories') }}
    where product_category_name is not null
)

select * from base

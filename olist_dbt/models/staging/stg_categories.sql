{{ config(materialized='view') }}

with source as (
    select * from {{ source('olist', 'categories') }}
),

renamed as (
    select
        product_category_name,
        product_category_name_english
    from source
)

select * from renamed

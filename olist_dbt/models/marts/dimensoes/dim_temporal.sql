with calendario as (
    select
        data::date as data,
        extract(day from data) as dia,
        extract(month from data) as mes,
        extract(year from data) as ano,
        extract(quarter from data) as trimestre,
        to_char(data, 'Day') as nome_dia,
        to_char(data, 'Month') as nome_mes
    from generate_series(
        '2016-01-01'::date,
        '2025-12-31'::date,
        interval '1 day'
    ) as data
)

select
    {{ dbt_utils.generate_surrogate_key(['data']) }} as sk_data,
    *
from calendario

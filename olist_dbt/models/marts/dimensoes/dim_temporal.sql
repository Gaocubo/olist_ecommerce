with calendario as (
    select
        data::date as data,
        extract(day from data) as dia,
        extract(month from data) as mes,
        extract(year from data) as ano,
        extract(quarter from data) as trimestre,
        extract(dow from data) + 1 as dia_semana_numero,  -- Domingo = 1
        initcap(trim(to_char(data, 'Day'))) as nome_dia,
        initcap(trim(to_char(data, 'Month'))) as nome_mes,
        to_char(data, 'YYYY-MM') as ano_mes,
        case when extract(dow from data) in (0, 6) then true else false end as fim_de_semana
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


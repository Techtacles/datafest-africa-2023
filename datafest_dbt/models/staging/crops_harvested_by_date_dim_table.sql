with crops_harvested_by_date_cte as (
    select 
    distinct fact.date_field as date, 
    count(crop.crop_type) as total_harvests
    from {{ ref('fact_table') }} fact
    join 
    {{ ref('crop_data_stg') }} crop 
    on fact.date_field=crop.date_field
    group by fact.date_field

)
select * from crops_harvested_by_date_cte

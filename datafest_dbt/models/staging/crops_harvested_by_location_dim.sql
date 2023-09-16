with crops_harvested_by_location_cte as (
    select 
    count(crop.crop_type) as total_harvests,
    location.region

    from {{ ref('fact_table') }} fact
    join 
    {{ ref('location_data_stg') }} location 
    on fact.sensor_id=location.sensor_id
    join {{ ref('crop_data_stg') }} crop on crop.date_field=fact.date_field
    group by location.region

)
select * from crops_harvested_by_location_cte

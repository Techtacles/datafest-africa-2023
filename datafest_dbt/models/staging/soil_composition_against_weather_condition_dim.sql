with soil_composition_cte as (
    select  weather.weather_condition, avg(soil.soil_moisture) as avg_soil_moisture 
    from 
    {{ ref('fact_table') }} fact 
    join 
    {{ ref('weather_data_stg') }} weather
    on fact.date_field=weather.date_field
    join {{ref('soil_data_stg')}} soil 
    on weather.date_field=soil.date_field
    group by weather.weather_condition

)
select * from soil_composition_cte

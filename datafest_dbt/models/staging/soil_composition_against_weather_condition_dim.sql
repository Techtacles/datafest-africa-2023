with soil_composition_cte as (
    select fact.date_field , weather.weather_condition, weather.wind_speed, weather.precipitation,
    soil.soil_comp, soil.soil_moisture
    from 
    {{ ref('fact_table') }} fact 
    join 
    {{ ref('weather_data_stg') }} weather
    on fact.date_field=weather.date_field
    join {{ref('soil_data_stg')}} soil 
    on weather.date_field=soil.date_field

)
select * from soil_composition_cte

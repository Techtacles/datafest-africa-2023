with weather_data_stg_cte as (
    select  
    timestamp,
    CAST(SPLIT_PART(timestamp, ' ', 1) AS DATE) AS date_field,
    SPLIT_PART(timestamp, ' ', 2) AS time_field, 
    CAST(weather_condition as varchar(50)) as weather_condition,
    CAST(wind_speed as float) as wind_speed,
    CAST(precipitation as float) as precipitation
    from {{source('raw_source','WEATHERDATARAW')}}
    where 
    weather_condition != 'NA'
    and 
    wind_speed != 'NA'
    and
    precipitation != 'NA'

)
select * from weather_data_stg_cte

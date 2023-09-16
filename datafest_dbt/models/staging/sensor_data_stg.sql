with sensor_data_stg_cte as (
    select 
    CAST(split_part(sensor_id,'"',2) as varchar(20)) as sensor_id,
    timestamp,
    {{ fmt_sensor_year('timestamp') }} as year,
    {{ fmt_sensor_month('timestamp') }} as month,
    {{ fmt_sensor_day('timestamp') }} as day,
    CAST(CONCAT(year,'-',month,'-',day) as date) as date_field,
    SPLIT_PART(timestamp, ' ', 2) AS time_field, 
    CAST(temperature as float) as temperature,
    CAST(humidity as float) as humidity,
    CAST(soil_moisture as float) as soil_moisture,
    CAST(light_intensity as float) as light_intensity,
    CAST(battery_level as float) as battery_level
    from {{source('raw_source','SENSORDATARAW')}}
    where 
    temperature!='NA'
    and 
    humidity!='NA'
    and
    soil_moisture!='NA'
    and
    light_intensity!='NA'
    and
    battery_level!='NA'

)
select * from sensor_data_stg_cte

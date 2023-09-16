with fact_table as (
    select distinct sensor.sensor_id as sensor_id,sensor.date_field from {{ ref('sensor_data_stg') }} sensor 
    join
    {{ ref('location_data_stg') }} location 
    on
    sensor.sensor_id=location.sensor_id 
)
select * from fact_table

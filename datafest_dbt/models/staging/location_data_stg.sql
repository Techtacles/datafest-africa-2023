with location_data_stg_cte as (
    select 
    {{ fmt_sensor_id_location('sensor_id') }} as sensor_id,
    location_name,latitude,longitude,
    cast(elevation as float) as elevation,
    cast(region as varchar(50)) as region
    from {{source('raw_source','LOCATIONDATARAW')}}

)
select * from location_data_stg_cte

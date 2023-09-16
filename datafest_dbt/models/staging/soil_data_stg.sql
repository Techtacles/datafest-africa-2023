with soil_data_stg_cte as (
    select 
    timestamp,
    CAST(SPLIT_PART(timestamp, ' ', 1) AS DATE) AS date_field,
    SPLIT_PART(timestamp, ' ', 2) AS time_field, 
    CAST(soil_comp as float) as soil_comp,
    CAST(soil_moisture as float) as soil_moisture,
    CAST(soil_ph as float) as soil_ph,
    CAST(nitrogen_level as float) as nitrogen_level,
    CAST(phosphorus_level as float) as phosphorus_level,
    CAST(organic_matter as float) as organic_matter
    from {{source('raw_source','SOILDATARAW')}}
    where soil_comp!='NA' 
    and
    nitrogen_level !='NA'
    and
    organic_matter != 'NA'
    and 
    phosphorus_level != 'NA'
    and 
    soil_ph != 'NA'
    and 
    soil_moisture != 'NA'
    and 
    soil_comp != 'NA'
)
select * from soil_data_stg_cte

with crop_data_stg_cte as (
    select 
    timestamp,
    CAST(SPLIT_PART(timestamp, ' ', 1) AS DATE) AS date_field,
    SPLIT_PART(timestamp, ' ', 2) AS time_field,
    cast(crop_yield as float) as crop_yield,
    cast(crop_type as varchar(50)) as crop_type, 
    cast(growth_stage as varchar(100)) as growth_stage,
    cast(pest_issue as varchar(100)) as pest_issue
    from {{source('raw_source','CROPDATARAW')}} 
    where crop_yield != 'NA'

)
select * from crop_data_stg_cte

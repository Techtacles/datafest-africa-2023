with pest_data_stg_cte as (
    select 
    timestamp,
    CAST(SPLIT_PART(timestamp, ' ', 1) AS DATE) AS date_field,
    SPLIT_PART(timestamp, ' ', 2) AS time_field, 
    CAST(pest_type as VARCHAR(50)) as pest_type,
    CAST(pest_description as VARCHAR(200)) as pest_description,
    CAST(pest_severity as VARCHAR(50)) as pest_severity
    from {{source('raw_source','PESTDATARAW')}}

)
select * from pest_data_stg_cte

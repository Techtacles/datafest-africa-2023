with pest_dim as (
    select 
    distinct sensor_id , fact.date_field, pest.pest_type,pest.pest_severity 
    from
    {{ ref('fact_table') }} fact 
    join {{ref('pest_data_stg')}} pest 
    on
    fact.date_field=pest.date_field

)
select * from pest_dim

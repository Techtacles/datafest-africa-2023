{% macro fmt_sensor_id_location(sensor_id) %}

cast(split_part(split_part(sensor_id,'_#',0),'_',2) as varchar(20))
 {% endmacro %}

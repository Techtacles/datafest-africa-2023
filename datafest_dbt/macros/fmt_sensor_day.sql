{% macro fmt_sensor_day(timestamp) %}

 SPLIT_PART(REPLACE(SPLIT_PART(timestamp, ' ', 1),'-','/' ),'/',3)
 {% endmacro %}

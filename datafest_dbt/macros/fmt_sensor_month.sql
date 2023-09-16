{% macro fmt_sensor_month(timestamp) %}

SPLIT_PART(REPLACE(SPLIT_PART(timestamp, ' ', 1),'-','/' ),'/',2)
{% endmacro %}


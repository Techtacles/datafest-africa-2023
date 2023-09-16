{% macro fmt_sensor_year(timestamp) %}
    SPLIT_PART(SPLIT_PART(REPLACE(SPLIT_PART({{ timestamp }}, ' ', 1),'-','/' ),'/',1),'"',2)
{% endmacro %}

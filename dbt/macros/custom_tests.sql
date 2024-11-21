
{% macro test_custom_tests_total_bookings_greater_than_zero(model ,column_name) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} <=0 
{% endmacro %}

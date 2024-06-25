{% macro drop_tables(tables) %}
    {% for table in tables %}
        {% set sql = "DROP TABLE IF EXISTS " ~ table %}
        {{ log(sql, info=True) }}
        {{ run_query(sql) }}
    {% endfor %}
{% endmacro %}

{%if target.name == 'QA' %}
    {% set warehouse=var('qa_wh')%}
{%elif target.name == 'PROD' %}
    {% set warehouse=var('prod_wh') %}
{%else%}
    {% set warehouse=var('dev_wh') %}
{%endif %}

    
{{config(
    materialized = 'dynamic_table',
    snowflake_warehouse = warehouse,
    target_lag = '3 hour',
    on_configuration_change = 'apply'
)}}
   WITH test AS (
     select * from DBT.PUBLIC.SCHEMATA 
   )
   SELECT * FROM test

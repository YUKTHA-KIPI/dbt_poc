{{config(
    materialized = 'dynamic_table',
    snowflake_warehouse = dbt_dev_wh,
    target_lag = 'DOWNSTREAM',
    on_configuration_change = 'apply'
)}}
   WITH test1 AS (
    select * from DEV.INFORMATION_SCHEMA.COLUMNS
   )
   WITH test2 as (
    SELECT * from test1 WHERE TABLE_NAME='TABLES'
   )
   SELECT * FROM test2
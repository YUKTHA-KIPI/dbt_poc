{{config(
    materialized = 'dynamic_table',
    snowflake_warehouse = 'dbt_dev_wh',
    target_lag = 'DOWNSTREAM',
    on_configuration_change = 'apply'
)}}

   WITH test1 AS 
   (
    select * from DEV.PUBLIC.TEST
   ),
   test2 AS 
   (
     SELECT * from test1 WHERE ID > 3
   )
   SELECT * FROM test2
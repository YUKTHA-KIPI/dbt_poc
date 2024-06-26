{{config(
    materialized = 'dynamic_table',
    snowflake_warehouse ='compute_wh' ,
    target_lag = '1 hour',
    on_configuration_change = 'apply'
)}}
WITH DIM_EVENT_MAPPING
AS ( select * from DBT.PUBLIC.ORDERS)
SELECT * FROM DIM_EVENT_MAPPING


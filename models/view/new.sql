{{config(
    materialized = 'view',
    on_configuration_change = 'apply'
)}}
   WITH test AS (
     select * from DBT_HOL_DEV.INFORMATION_SCHEMA.DATABASES 
   )
   SELECT * FROM test

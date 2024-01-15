{{config(
    materialized = 'view'
)}}
   WITH test AS (
     select * from DBT_HOL_DEV.INFORMATION_SCHEMA.DATABASES 
   )
   SELECT * FROM test

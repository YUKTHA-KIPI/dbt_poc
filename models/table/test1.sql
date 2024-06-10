{{ config(materialized='incremental') }}

with source_data as (

     select
        EMPLOYEE_ID,
        first_name,
        last_name,
        SALARY,
        DEPARTMENT_ID,
    null as ID
    from DBT.PUBLIC.EMPLOYEES

)
select *
from source_data


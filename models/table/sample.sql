with SAMPLE as (
    select
        EMPLOYEE_ID,
        first_name,
        last_name,
        SALARY,
        DEPARTMENT_ID
    from DBT.PUBLIC.EMPLOYEES
)

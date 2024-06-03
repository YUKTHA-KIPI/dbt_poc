with employee_details AS (
    SELECT 
    employee_id,
    CONCAT(first_name,'  ', last_name) AS nameee1,
    department_id,
    salary
FROM 
    DBT.PUBLIC.employees)

select * from employee_details

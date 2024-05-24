with employee_details AS (
    SELECT 
    employee_id,
    CONCAT(first_name,' ', last_name) AS name,
    department_id,
    salary
FROM 
    DBT.PUBLIC.employees)

select * from employee_details

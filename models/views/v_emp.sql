CREATE OR REPLACE VIEW employee_details AS
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    department_id,
    salary
FROM 
    DBT.PUBLIC.employees;

with employee_details AS (
    SELECT 
    employee_id,
<<<<<<< HEAD
    CONCAT(first_name,' ', last_name) AS name,
=======
    CONCAT(first_name,'   ', last_name) AS full_name,
>>>>>>> b527ce66c5fdaf8f19789daae6d7ed8ae12657a2
    department_id,
    salary
FROM 
    DBT.PUBLIC.employees)

select * from employee_details

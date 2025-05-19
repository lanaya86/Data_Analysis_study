--https://datalemur.com/questions/sql-well-paid-employees

--Companies often perform salary analyses to ensure fair compensation practices. 
--One useful analysis is to check if there are any employees earning more than their direct managers.
--As an HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.

SELECT 
      e.employee_id,
      name
FROM 
  employee AS e
LEFT JOIN 
  (
  SELECT employee_id, salary AS manager_salary
  FROM employee 
  WHERE manager_id is NULL
  ) AS m 
ON e.manager_id = m.employee_id
WHERE 
    manager_salary IS NOT NULL
    AND salary > manager_salary
      

--https://datalemur.com/questions/sql-ibm-db2-product-analytics

--IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
--The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). 
--Additionally, it should count the number of employees who did not run any queries during this period.
--Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.
SELECT unique_queries, COUNT(employee_id) AS employee_count
FROM
  (
    SELECT 
        q.employee_id, 
        COALESCE(COUNT( DISTINCT query_id), 0) AS unique_queries
    FROM employees AS q
    LEFT JOIN queries AS e
    ON q.employee_id = e.employee_id
          AND query_starttime >= '2023-07-01'
          AND query_starttime <  '2023-10-01'
    GROUP BY q.employee_id
  ) AS sub
GROUP BY unique_queries
ORDER BY 1 ASC

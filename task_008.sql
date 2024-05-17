--Вивести дані по співробітнику, який отримує другу по розміру
--зп в таблиці
SELECT *
FROM
(
SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 2
) AS t
ORDER BY salary_in_usd ASC
LIMIT 1;

SELECT *
from salaries
ORDER BY salary_in_usd DESC
LIMIT 1 OFFSET 1
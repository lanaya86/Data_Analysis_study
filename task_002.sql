-- Вивести всіх співробітників, 
-- які в 2023 отримували з/п більшу за $300тис
SELECT 
FROM salaries
WHERE year = 2023
	AND salary_in_usd > 300000
LIMIT 20;
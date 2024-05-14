-- Вивести кількість країн, які починаються на "С"
SELECT 
	COUNT (DISTINCT emp_location)
FROM salaries
WHERE emp_location LIKE ('C%')

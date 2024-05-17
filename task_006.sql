-- Вивести всіх спеціалістів, які живуть в країнах, де
-- середня зп вища 
-- за середню усіх країн
SELECT *
FROM salaries
WHERE emp_location IN
(
	SELECT comp_location
	FROM salaries
	GROUP BY 1
	HAVING AVG(salary_in_usd) >	
(
		SELECT AVG(salary_in_usd)
		FROM salaries
)
)
;


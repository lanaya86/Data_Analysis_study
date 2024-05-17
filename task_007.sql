--По кожній професії вивести різницю між середньою зп
--та максимальною зп усіх специалістів
-- 
-- 1. AVG salary among all specialists of this job
-- 2. MAX salary among all specialists of this job
-- 3. DIFFERENCE in these values for every distinct job

SELECT AVG(salary_in_usd)
FROM salaries
GROUP BY job_title;
SELECT MAX(salary_in_usd)
FROM salaries
GROUP BY job_title;
SELECT 
	MAX(salary_in_usd) - AVG(salary_in_usd) AS Difference
	, job_title
FROM salaries
GROUP BY job_title;
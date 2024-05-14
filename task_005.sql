-- Вивести професії, назва яких не складається з трьох слів
SELECT job_title
FROM salaries
WHERE job_title NOT LIKE ('% % %')
ORDER BY job_title


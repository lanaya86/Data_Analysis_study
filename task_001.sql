--  Порахувати кількість працівників в таблиці,
--  які в 2023 році працюють 
--  на компанії розміру "М" і отримують з/п вищу за $100 000
SELECT 
	COUNT (*)
FROM salaries
WHERE 
	comp_size = 'M'
	AND salary_in_usd > 100000
	AND year = 2023


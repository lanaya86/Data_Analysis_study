-- Чи є співробітники,
-- які працювали на Українську компанію повністю віддалено?
SELECT *
FROM salaries
WHERE comp_location = 'UA'
	AND remote_ratio = 100

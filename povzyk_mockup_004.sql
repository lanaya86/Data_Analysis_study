--  Коли частіше виходять фільми: у грудні чи у липні? І які з них у середньому більше приносять?
WITH categories AS
(
SELECT *
	, CASE 
		WHEN "Release_Date" LIKE '%Dec%' THEN 'Dec'
		WHEN "Release_Date" LIKE '%Jul%' THEN 'July'
	END AS category
	
FROM highest_holywood_grossing_movies hhgm 
)
SELECT 
	COUNT("Title")
	, category
	, AVG("World_Wide_Sales")
FROM categories 
GROUP BY category 

povzyk_mockup_003.sql

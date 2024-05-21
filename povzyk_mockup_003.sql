-- WHICH MOVIES ARE MORE BENEFICIAL: shorter 2 hours, 2-3 hours long, 3+ hours long
WITH categories AS
(
	SELECT 
		 "World_Wide_Sales" 
		, "Running_Time" 
		, CASE
			WHEN "Running_Time" LIKE '3%' THEN 'LONG'
			WHEN "Running_Time" LIKE '2%' THEN 'MID'
			ELSE 'SHORT'
	END AS category
FROM highest_holywood_grossing_movies hhgm 
)
SELECT 
	ROUND(AVG("World_Wide_Sales"), 1) AS average_sales
	, category 
FROM categories
GROUP BY category 
ORDER BY 1;




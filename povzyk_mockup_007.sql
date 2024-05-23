--Скільки відсотків від загального заробітку припадає на топ-5 ресторанів?

SELECT *
FROM food_order fo ;

WITH top_5_restaurants AS(
	SELECT sum(total_restaurant_sales) AS total_sales
	FROM 
	(
		SELECT 
			sum(cost_of_the_order) AS total_restaurant_sales
			, restaurant_name 
		FROM food_order fo 
		GROUP BY restaurant_name 
		ORDER BY 1 DESC 
		LIMIT 5
	)
)
, all_restaurants AS(
	SELECT sum(restaurant_sales) AS total_sales
	FROM 
	(
		SELECT 
			 restaurant_name 
			, SUM(cost_of_the_order) AS restaurant_sales
		FROM food_order fo 
		GROUP BY restaurant_name
	)
)
SELECT min(total_sales) / max(total_sales) * 100 AS top_5_restaurants_perecentage_of_total_sales 
FROM(
	SELECT *  FROM top_5_restaurants 
	UNION ALL
	SELECT * FROM all_restaurants 
)
-- better decision
	-- SELECT sum(total_restaurant_sales) / (SELECT sum(cost_of_the_order) FROM food_order fo)
	-- FROM(
	-- 	SELECT 
	-- 		sum(cost_of_the_order) AS total_restaurant_sales
	-- 		, restaurant_name 
	-- 	FROM food_order fo 
	-- 	GROUP BY restaurant_name 
	-- 	ORDER BY 1 DESC 
	-- 	LIMIT 5
	-- )

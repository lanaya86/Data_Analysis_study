-- Який улюблений ресторан найактивнішого клієнта?

WITH clients_restaurants_count AS(
	SELECT customer_id
		, COUNT(restaurant_name) OVER(PARTITION BY customer_id) AS restaurant_count
		, restaurant_name 	
	FROM food_order fo 
	ORDER BY 2 DESC
)
SELECT 
	customer_id 
	, COUNT(restaurant_name) restaurant_visit_count
	, restaurant_name
	, COUNT (restaurant_name) OVER(PARTITION BY customer_id) AS unique_restaurants_of_customer_count
FROM clients_restaurants_count 
GROUP BY customer_id, restaurant_name 
ORDER BY 4 DESC

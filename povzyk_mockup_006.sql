--Який ресторан змушує найдовше чекати своїх користувачів? 
--І який у нього при цьому рейтинг? Клієнт мав залишити рейтинг, ресторан повинен мати не менше 10 замовлень.

SELECT *
FROM food_order fo ;
SELECT 
	restaurant_name  
	, round(avg(rating::int), 2) AS avg_rating
	, count(order_id) AS restaurant_count_orders
	, round(avg(delivery_time), 2) + round(avg(food_preparation_time), 2) AS avg_delivery_time
FROM food_order fo 	
WHERE rating != 'Not given'
GROUP BY restaurant_name 
HAVING count(order_id) >= 10
ORDER BY 4 desc

--https://datalemur.com/questions/completed-trades
--Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
--Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
--Output the city name and the corresponding number of completed trade orders.

SELECT 
      city,
      COUNT(*) AS total_orders
FROM trades
LEFT JOIN users
USING (user_id)
WHERE status = 'Completed'
GROUP BY city
ORDER BY 2 DESC
LIMIT 3;

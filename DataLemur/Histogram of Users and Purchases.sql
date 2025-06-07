--https://datalemur.com/questions/histogram-users-purchases

--Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, write a query that retrieve the users along with the number of products they bought.
--Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order by the transaction date.

WITH cte AS(
    SELECT 
        user_id, 
        MAX(transaction_date) AS recent_date
    FROM user_transactions
    GROUP BY user_id)
    
SELECT 
    transaction_date,
    t.user_id,
    COUNT(*)
FROM user_transactions AS t
INNER JOIN cte AS c
ON t.user_id = c.user_id 
  AND transaction_date = recent_date
GROUP BY t.user_id, transaction_date
ORDER BY transaction_date

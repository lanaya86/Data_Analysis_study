--https://datalemur.com/questions/user-retention

--Assume you're given a table containing information on Facebook user actions. Write a query to obtain number of monthly active users (MAUs) in July 2022, including the month in numerical format "1, 2, 3".
--An active user is defined as a user who has performed actions such as 'sign-in', 'like', or 'comment' in both the current month and the previous month.

WITH cte AS(
    SELECT 
        *, 
        DATE_TRUNC('Month', event_date) AS month,
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_date) AS rn
    FROM user_actions
    WHERE 
          DATE_TRUNC('Month', event_date) = DATE '2022-07-01' 
          OR DATE_TRUNC('Month', event_date) = DATE '2022-06-01'
),

cte2 AS(
    SELECT user_id
    FROM
        (SELECT user_id, month
        FROM cte 
        GROUP BY user_id, month) AS s
    GROUP BY user_id
    HAVING COUNT(DISTINCT month) > 1
)

SELECT '7' AS month, COUNT(*)
FROM cte2;

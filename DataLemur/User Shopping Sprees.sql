--https://datalemur.com/questions/amazon-shopping-spree

--In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

WITH trans AS(
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rn
    FROM transactions)
  
SELECT user_id
FROM trans
WHERE rn = 3;

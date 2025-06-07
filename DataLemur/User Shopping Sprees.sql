--https://datalemur.com/questions/amazon-shopping-spree

--In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

WITH trans AS(
    SELECT 
        user_id,
        transaction_date,
        LEAD(transaction_date, 1) 
              OVER (PARTITION BY user_id ORDER BY transaction_date) AS snd_day,
        LEAD(transaction_date, 2) 
              OVER (PARTITION BY user_id ORDER BY transaction_date) AS trd_day
    FROM transactions)
  
SELECT user_id
FROM trans
WHERE 
        snd_day - transaction_date = INTERVAL '1 day'
        AND trd_day - snd_day = INTERVAL '1 day';

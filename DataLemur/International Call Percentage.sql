--https://datalemur.com/questions/international-call-percentage

-- phone call is considered an international call when the person calling is in a different country than the person receiving the call.
--What percentage of phone calls are international? Round the result to 1 decimal.

WITH cte AS(
    SELECT 
        pc.caller_id,
        pc.receiver_id,
        c.country_id,
        c.caller_id,
        r.country_id,
        r.caller_id,
        CASE WHEN c.country_id != r.country_id THEN 1
             ELSE 0 END AS international
    FROM phone_calls AS pc
    INNER JOIN phone_info AS c
    USING (caller_id)
    INNER JOIN phone_info AS r
    ON pc.receiver_id = r.caller_id)
    
SELECT ROUND(SUM(international) * 100.0 / COUNT(*), 1)
FROM cte

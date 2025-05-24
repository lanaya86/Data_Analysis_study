--https://datalemur.com/questions/time-spent-snaps

--Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.
--Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

SELECT 
    age_bucket,
    ROUND(SUM(time_spent) FILTER (WHERE activity_type = 'send') * 100.0 /
    (SUM(time_spent) FILTER (WHERE activity_type = 'open') + SUM(time_spent) FILTER (WHERE activity_type = 'send')), 2) AS send_perc,
    
    ROUND(SUM(time_spent) FILTER (WHERE activity_type = 'open') * 100.0 /
    (SUM(time_spent) FILTER (WHERE activity_type = 'open') + SUM(time_spent) FILTER (WHERE activity_type = 'send')), 2) AS open_perc
  
FROM activities
LEFT JOIN age_breakdown USING (user_id)
GROUP BY age_bucket
ORDER BY age_bucket ASC;

--https://datalemur.com/questions/uncategorized-calls-percentage

--Calls to the Advocate4Me call centre are classified into various categories, but some calls cannot be neatly categorised. 
--These uncategorised calls are labeled as “n/a”, or are left empty when the support agent does not enter anything into the call category field.
--Write a query to calculate the percentage of calls that cannot be categorised. Round your answer to 1 decimal place. For example, 45.0, 48.5, 57.7.

SELECT 
    ROUND((SELECT COUNT(*) FROM callers WHERE call_category IS NULL OR call_category = 'n/a') 
    * 100.0 / COUNT(*), 1)
    FROM callers

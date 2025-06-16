--https://datalemur.com/questions/median-search-freq

--However, at Google scale, querying the 2 trillion searches is too costly. Luckily, you have access to the summary table which tells you the number of searches made last year and how many Google users fall into that bucket.
--Write a query to report the median of searches made by a user. Round the median to one decimal point.\

WITH c AS(
  SELECT 
    SUM(num_users) OVER (ORDER BY searches) AS cum, 
    searches
  FROM search_frequency
)

SELECT ROUND(SUM(searches) / 2.0, 1) AS median
FROM c 
--  7 / 8 near median values
WHERE cum >= 7 AND cum <= 8

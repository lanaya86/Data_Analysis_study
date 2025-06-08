--https://datalemur.com/questions/yoy-growth-rate

--Assume you're given a table containing information about Wayfair user transactions for different products. 
--Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

WITH total AS(
  SELECT 
      DATE_PART('YEAR', transaction_date) AS year,
      product_id, 
      SUM(spend) AS curr_year_spend
  FROM user_transactions
  GROUP BY product_id, DATE_PART('YEAR', transaction_date)
  ORDER BY 1
)

SELECT 
    year,
    product_id,
    curr_year_spend,
    LAG(curr_year_spend) OVER(PARTITION BY product_id ORDER BY year) AS prev_year_spend ,
    ROUND((curr_year_spend - LAG(curr_year_spend) OVER(PARTITION BY product_id ORDER BY year)) * 100.00 /
    LAG(curr_year_spend) OVER(PARTITION BY product_id ORDER BY year), 2) AS yoy_rate
FROM total

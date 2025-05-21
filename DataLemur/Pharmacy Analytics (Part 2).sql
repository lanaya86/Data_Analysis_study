--https://datalemur.com/questions/non-profitable-drugs

--CVS Health is analyzing its pharmacy sales data, 
--and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.
--Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.

SELECT 
    manufacturer,
    COUNT(drug) AS drug_count,
    ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY 3 DESC;

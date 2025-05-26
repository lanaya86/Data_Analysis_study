--https://datalemur.com/questions/sql-highest-grossing

--Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
--write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

WITH spend_per_product AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY SUM(spend) DESC
        ) AS rn
    FROM product_spend
    WHERE DATE_PART('year', transaction_date) = 2022
    GROUP BY category, product
)
SELECT
    category,
    product,
    total_spend
FROM spend_per_product
WHERE rn IN (1, 2)
ORDER BY category, rn;

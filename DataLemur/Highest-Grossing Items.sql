--https://datalemur.com/questions/sql-highest-grossing

--Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
--write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

WITH spend_per_product AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend
    FROM product_spend
    WHERE DATE_PART('year', transaction_date) = 2022
    GROUP BY category, product
),
ranked AS (
    SELECT
        category,
        product,
        total_spend,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_spend DESC
        ) AS rn
    FROM spend_per_product
)
SELECT
    category,
    product,
    total_spend
FROM ranked
WHERE rn IN (1, 2)
ORDER BY category, rn;

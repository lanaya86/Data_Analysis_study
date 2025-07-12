WITH cleaning AS (
  SELECT
    product_id, 
    COALESCE(product_type, 'Unknown') AS product_type,
    COALESCE(brand, 'Unknown') AS brand,
    CASE 
        WHEN weight IS NOT NULL THEN 
        ROUND(CAST(REGEXP_REPLACE(TRIM(weight), '[^0-9\.]+.*$', '', 'g') AS numeric), 2)
        ELSE NULL END AS weight,
    CASE  
	    WHEN price IS NOT NULL THEN ROUND(price::numeric, 2) 
	    ELSE NULL END AS price,
	COALESCE(average_units_sold, 0) AS average_units_sold,
	COALESCE(year_added, 2022) AS year_added,
	COALESCE(stock_location, 'Unknown') AS stock_location
  FROM public.products
),
median_calc AS (
  SELECT
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY weight) AS median_weight,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) AS median_price
  FROM cleaning
  WHERE 
    weight IS NOT NULL
    AND price IS NOT NULL
),
final_cleaning AS(
SELECT 
  product_id, 
  product_type,
  CASE 
	WHEN brand = '-' THEN 'Unknown'
	ELSE brand END AS brand,
  COALESCE(weight, median_calc.median_weight) AS weight,
  COALESCE(price, median_calc.median_price) AS price,
  average_units_sold,
  year_added,
  UPPER(stock_location) AS stock_location
	
FROM cleaning
CROSS JOIN median_calc 
WHERE
  product_id IS NOT NULL
  AND COALESCE(weight, median_calc.median_weight) >= 0
  AND COALESCE(price, median_calc.median_price) >= 0
  AND average_units_sold >= 0	
)

SELECT MIN(weight), MAX(weight)
FROM final_cleaning


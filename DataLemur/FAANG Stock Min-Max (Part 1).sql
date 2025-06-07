--https://datalemur.com/questions/sql-bloomberg-stock-min-max-1

--The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. 
--As a Data Analyst at Bloomberg, you have access to historical data on stock performance.
--Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.
--For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest open prices (refer to the Example Output format).
--Ensure that the results are sorted by ticker symbol.

WITH prices AS(
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open) AS rn_min,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC) AS rn_max
    FROM stock_prices
    ORDER BY ticker),
    
max_prices AS(
    SELECT 
        ticker,
        TO_CHAR(date, 'Mon-YYYY')  AS highest_mth,
        open AS highest_open
    FROM prices
    WHERE rn_max = 1),
    
min_prices AS(
    SELECT 
        ticker,
        TO_CHAR(date, 'Mon-YYYY')  AS lowest_mth,
        open AS lowest_open
    FROM prices
    WHERE rn_min = 1)
    
SELECT 
    mx.ticker,
    highest_mth,
    highest_open,
    lowest_mth,
    lowest_open
FROM max_prices AS mx
LEFT JOIN min_prices AS mn
ON mx.ticker = mn.ticker
    
  

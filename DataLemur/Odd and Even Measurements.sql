--https://datalemur.com/questions/odd-even-measurements

--Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.
--Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. Refer to the Example Output below for the desired format.

WITH rn_table AS(
  SELECT
      *,
      ROW_NUMBER() OVER(PARTITION BY measurement_time::date 
                        ORDER BY measurement_time) AS rn
      FROM measurements
)

SELECT
    measurement_time::date,
    SUM(measurement_value) 
        FILTER (WHERE rn % 2 != 0) AS odd_sum,
    SUM(measurement_value) 
        FILTER (WHERE rn % 2 = 0) AS even_sum
FROM rn_table
GROUP BY measurement_time::date
ORDER BY measurement_time

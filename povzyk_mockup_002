-- The earliest movie of distr and its year
SELECT "Distributor"
	, "year_arr"
	, "Year"
FROM (
	SELECT 
		 ROW_NUMBER () OVER(PARTITION BY "Distributor" ORDER BY "Year") AS year_arr
		 , "Distributor" 
		 , "Year" 
	FROM highest_holywood_grossing_movies hhgm
) t
WHERE "year_arr" = 1
ORDER BY "Year"

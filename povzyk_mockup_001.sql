-- Що вигідніше створювати: комедії чи драми?
WITH drama AS
(
  SELECT Genre
      , AVG(World_Wide_Sales) -  AVG(Budget) AS revenue_d
  FROM "Highest Holywood Grossing Movies"
  WHERE year BETWEEN 2019 AND 2024
   AND Genre LIKE '%Drama%'
  GROUP BY Genre
  ORDER BY 2 DESC
)
, comedy AS
(
  SELECT Genre
      , AVG(World_Wide_Sales) -  AVG(Budget) AS revenue_c
  FROM "Highest Holywood Grossing Movies"
  WHERE year BETWEEN 2019 AND 2024
   AND Genre LIKE '%Comedy%'
  GROUP BY Genre
  ORDER BY 2 DESC
)
SELECT AVG(revenue_c) AS revenue FROM comedy
UNION
SELECT AVG(revenue_d) AS revenue FROM drama

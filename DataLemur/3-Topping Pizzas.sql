--https://datalemur.com/questions/pizzas-topping-cost

--Given a list of pizza toppings, consider all the possible 3-topping pizzas, and print out the total cost of those 3 toppings. 
--Sort the results with the highest total cost on the top followed by pizza toppings in ascending order. 

WITH toppings AS (
  SELECT 
      i1.topping_name AS ingredient1,
      i2.topping_name AS ingredient2,
      i3.topping_name AS ingredient3,
      i1.ingredient_cost + i2.ingredient_cost + i3.ingredient_cost AS total_cost
  FROM pizza_toppings AS i1
  JOIN pizza_toppings AS i2
      ON i1.topping_name < i2.topping_name
  JOIN pizza_toppings AS i3
      ON i2.topping_name < i3.topping_name
)

SELECT 
  STRING_AGG(ing, ',' ORDER BY ing) AS pizza,
  total_cost
FROM toppings,
LATERAL (
  SELECT unnest(ARRAY[ingredient1, ingredient2, ingredient3]) AS ing
) AS ordered
GROUP BY ingredient1, ingredient2, ingredient3, total_cost
ORDER BY 2 DESC;

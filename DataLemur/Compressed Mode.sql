--https://datalemur.com/questions/alibaba-compressed-mode

--You're given a table containing the item count for each order on Alibaba, along with the frequency of orders that have the same item count. Write a query to retrieve the mode of the order occurrences. 
--Additionally, if there are multiple item counts with the same mode, the results should be sorted in ascending order.

WITH cte AS(
    SELECT 
        item_count,
        RANK() OVER(ORDER BY order_occurrences DESC) AS rank
    FROM items_per_order
    ORDER BY order_occurrences ASC)
    
SELECT item_count
FROM cte 
WHERE rank = 1
ORDER BY 1

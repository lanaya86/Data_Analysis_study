--https://datalemur.com/questions/alibaba-compressed-mean

--You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal place using 
--ables which includes information on the count of items in each order (item_count table) 
--and the corresponding number of orders for each item count (order_occurrences table).

SELECT ROUND(
    SUM(order_occurrences * item_count)::numeric / SUM(order_occurrences), 1
) AS mean
FROM items_per_order;

--https://datalemur.com/questions/sql-swapped-food-delivery

--Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions, 
--each item's order was swapped with the item in the subsequent row. As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.

SELECT 
    order_id,
    CASE WHEN order_id % 2 != 0 AND order_id = LAST_VALUE(order_id) OVER() THEN item
         WHEN order_id % 2 != 0 THEN LEAD(item) OVER()
         WHEN order_id % 2 = 0 THEN LAG(item) OVER()
         END AS item
FROM orders 

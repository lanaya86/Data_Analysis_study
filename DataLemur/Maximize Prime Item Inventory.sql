--https://datalemur.com/questions/prime-warehouse-storage

--Amazon wants to maximize the storage capacity of its 500,000 square-foot warehouse by prioritizing a specific batch of prime items. The specific prime product batch detailed in the inventory table must be maintained.
--So, if the prime product batch specified in the item_category column included 1 laptop and 1 side table, that would be the base batch. We could not add another laptop without also adding a side table; they come all together as a batch set.
--After prioritizing the maximum number of prime batches, any remaining square footage will be utilized to stock non-prime batches, which also come in batch sets and cannot be separated into individual items.
--Write a query to find the maximum number of prime and non-prime batches that can be stored in the 500,000 square feet warehouse based on the following criteria:

Prioritize stocking prime batches
After accommodating prime items, allocate any remaining space to non-prime batches
WITH prime_batch AS (
    SELECT
        SUM(square_footage)        AS prime_batch_size,
        COUNT(DISTINCT item_id)    AS prime_batch_item_count
    FROM inventory
    WHERE item_type = 'prime_eligible'
),
not_prime_batch AS (
    SELECT 
        SUM(square_footage)        AS nonprime_batch_size,
        COUNT(DISTINCT item_id)    AS nonprime_batch_item_count
    FROM inventory
    WHERE item_type = 'not_prime'
)

SELECT
    'prime_eligible'    AS item_type,
    FLOOR(500000 / prime_batch_size) * prime_batch_item_count AS item_count
FROM prime_batch

UNION ALL

SELECT
    'not_prime'         AS item_type,
    FLOOR(
        (500000 
         - FLOOR(500000 / prime_batch_size) * prime_batch_size
        ) 
        / nonprime_batch_size
    ) * nonprime_batch_item_count   AS item_count
FROM not_prime_batch
CROSS JOIN prime_batch;

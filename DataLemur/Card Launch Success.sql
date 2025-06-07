--https://datalemur.com/questions/card-launch-success

--Write a query that outputs the name of the credit card, and how many cards were issued in its launch month. 
--The launch month is the earliest record in the monthly_cards_issued table for a given card. Order the results starting from the biggest issued amount.

WITH cte AS(
    SELECT
        card_name, issue_year, issue_month, issued_amount,
        RANK() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month) AS rank
        
    FROM monthly_cards_issued)
    
SELECT card_name, issued_amount
FROM cte
WHERE rank = 1
ORDER BY 2 DESC;



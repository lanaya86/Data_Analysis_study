SELECT 
c.CustomerId
, c.FirstName 
, c.LastName 
, COUNT(DISTINCT t.GenreId) AS genres_count
FROM InvoiceLine il 
LEFT JOIN Invoice i ON il.InvoiceId = i.InvoiceId 
LEFT JOIN Track t ON t.TrackId = il.TrackId  
LEFT JOIN Customer c ON c.CustomerId = i.CustomerId 
GROUP BY 1
HAVING COUNT(DISTINCT t.GenreId) >= 3

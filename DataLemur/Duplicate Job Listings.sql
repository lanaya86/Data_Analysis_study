--https://datalemur.com/questions/duplicate-job-listings
--Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.
--Definition:
--Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

SELECT COUNT(*)
FROM
      (
      SELECT 
            COUNT(title) AS title_count,
            COUNT(DISTINCT title) AS d_title,
            COUNT(description) AS description_count,
            COUNT(DISTINCT description) AS d_des
              
      FROM job_listings
      GROUP BY company_id
      HAVING COUNT(title) > 1
      ) AS sub
WHERE title_count != d_title AND description_count != d_des;

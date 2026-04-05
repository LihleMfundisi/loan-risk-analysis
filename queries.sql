--validate records to see if they match 100
SELECT COUNT(*)
FROM transections;

/*Business Insights*/
--1.Total Spend per Customer: How much has each customer spent in total
SELECT SUM(amount) as total_spent , customer_id
FROM transections
GROUP BY customer_id
ORDER BY total_spent DESC;

--2. Highest transections: What are the biggest transactions
SELECT *
FROM transections
ORDER BY amount DESC
LIMIT 5;

--3. High value customers: Which customers have spent more than 10 000
SELECT  SUM(amount) as total_spent, customer_id 
FROM transections
GROUP BY customer_id
HAVING SUM(amount) > 10000
ORDER BY total_spent DESC;

--4. Recent transactions: Show Transections in the last 30 days
SELECT *
FROM transections
WHERE transection_date >= CURRENT_DATE - INTERVAL '30 days';

--5. Customers who made more than 3 transections:
SELECT COUNT(transection_id) AS transections_no, customer_id
FROM transections 
GROUP BY customer_id
HAVING COUNT(transection_id) > 3;

--6. Customers who made transections in more than 1 location
SELECT customer_id, COUNT(DISTINCT location)
FROM transections
GROUP BY customer_id
HAVING COUNT(DISTINCT location) > 1
ORDER BY location_count DESC;

--7. Average trasection amount per customer:
SELECT customer_id, AVG(amount) AS average_amount
FROM transections
GROUP BY customer_id
ORDER BY average_amount DESC;

--Potentially suspicious transections:8.Transections where the amount was morethan 10000:
SELECT transection_id, customer_id, amount, transection_date
FROM transections
WHERE amount > 10000
ORDER BY amount DESC;

--Potentially suspicious transection and unsual behaiviour:9.Transections where the amount was morethan 10000 in more 1 location:
SELECT customer_id, MAX(amount) AS max_amount, COUNT(DISTINCT location) AS location_count
FROM transections
GROUP BY customer_id
HAVING COUNT(DISTINCT location) > 1
AND MAX(amount) >10000
ORDER BY max_amount DESC;



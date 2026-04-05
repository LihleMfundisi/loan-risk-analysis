-- schema.sql

CREATE TABLE transections (
transection_id INT PRIMARY KEY,
customer_id INT,
transection_date DATE,
amount DECIMAL(10,2),
location VARCHAR(100)
);

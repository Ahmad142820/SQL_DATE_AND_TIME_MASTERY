DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);

INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate) VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);




SELECT * from products;


-- 1. NOW() – Get Current Date and Time

SELECT NOW() AS Current_Datetime;


-- 2. CURRENT_DATE() – Get Current Date
SELECT CURRENT_DATE AS today_date;

SELECT Added_date, Current_Date, (CURRENT_DATE- added_date) AS Days_difference
FROM products;


-- 3. EXTRACT() – Extract Parts of a Date
-- Extract the year, month, and day from the added_date column.

SELECT product_name,
		EXTRACT(YEAR FROM added_date) AS Year_Added,
		EXTRACT(MONTH FROM added_date) AS Month_Added,
		EXTRACT(DAY FROM added_date) AS Day_Added
FROM products;





-- 4. AGE() – Calculate Age Between Dates
-- Calculate the time difference between added_date and today’s date.

SELECT product_name,
	AGE(CURRENT_DATE, added_date) AS Age_since_added
FROM products;
  	

-- 5. TO_CHAR() – Format Dates as Strings
-- Format added_date in a custom format (DD-Mon-YYYY).

SELECT product_name,
	TO_CHAR(added_date, 'DD-Mon-YYYY') AS FORMATED_DATE
FROM products;




-- 6. DATE_PART() – Get Specific Date Part
-- Extract the day of the week from added_date.

SELECT product_name, added_date,
 date_part('isodow', added_date) AS day_of_the_week
 FROM products;




-- 7. DATE_TRUNC() – Truncate Date to Precision
-- Truncate added_date to the start of the month.

SELECT product_name, added_date,
DATE_TRUNC('Week', added_date) AS start_of_the_week
FROM products;





-- 8. INTERVAL – Add or Subtract Time Intervals
-- Add 6 months to the added_date.


SELECT product_name, added_date,
added_date + interval '6 days' AS new_date
FROM products;




-- 9. CURRENT_TIME() – Get Current Time
--Retrieve only the current time.


SELECT CURRENT_TIME AS current_time;

-- 10. TO_DATE() – Convert String to Date
-- Convert a string to a date format.


SELECT TO_DATE('14-06-2024'	, 'DD-MM-YEAR') AS Converted_Date;
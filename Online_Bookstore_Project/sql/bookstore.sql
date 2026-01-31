SHOW DATABASES;
CREATE DATABASE online_bookstore;
USE online_bookstore;


CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    published_year INT
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    quantity INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);



SHOW TABLES;

TRUNCATE TABLE books;
TRUNCATE TABLE customers;
TRUNCATE TABLE orders;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS books;

-- first 5 rows
SELECT * FROM books LIMIT 5;
SELECT * FROM customers LIMIT 5;
SELECT * FROM orders LIMIT 5;

-- Retrieve all books in the "Fiction" genre

SELECT * 
FROM books
WHERE genre = 'Fiction';

-- Find books published after the year 1950

SELECT * 
FROM books
WHERE publish_year > 1950;

-- List all customers from Canada

SELECT * 
FROM customers
WHERE country = 'Canada';


-- Show orders placed in November 2023

SELECT * 
FROM orders
WHERE order_date >= '2023-11-01'
  AND order_date < '2023-12-01';
  
  
  -- Retrieve the total stock of books available
  
  SELECT SUM(stock) AS total_stock
FROM books;


-- Find the details of the most expensive book

SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;

-- Show all customers who ordered more than 1 quantity of a book

SELECT *
FROM orders
WHERE quantity > 1;

-- Retrieve all orders where the total amount exceeds $20

SELECT *
FROM orders
WHERE total_amount > 20;

-- List all genres available in the Books table

SELECT DISTINCT genre
FROM books;

-- Find the book with the lowest stock

SELECT *
FROM books
ORDER BY stock ASC
LIMIT 1;

-- Calculate the total revenue generated from all orders

SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- Retrieve the total number of books sold for each genre

SELECT b.genre, SUM(o.quantity) AS total_sold
FROM books b
JOIN orders o ON b.book_id = o.book_id
GROUP BY b.genre;



-- Find the average price of books in the "Fantasy" genre

SELECT AVG(price) AS avg_price
FROM books
WHERE genre = 'Fantasy';

-- Question: List customers who have placed at least 2 orders

SELECT customer_id, COUNT(order_id) AS num_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 2;

-- Find the most frequently ordered book

SELECT book_id, COUNT(order_id) AS times_ordered
FROM orders
GROUP BY book_id
ORDER BY times_ordered DESC
LIMIT 1;


-- Question: Show the top 3 most expensive books of 'Fantasy' Genre

SELECT *
FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;


-- Question: Retrieve the total quantity of books sold by each author

SELECT b.author, SUM(o.quantity) AS total_sold
FROM books b
JOIN orders o ON b.book_id = o.book_id
GROUP BY b.author;

-- List the cities where customers who spent over $30 are located

SELECT DISTINCT c.city
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount) > 30;

-- Find the customer who spent the most on orders

SELECT c.Customer_id, c.Name, SUM(o.Total_Amount) AS total_spent
FROM customers c
JOIN orders o ON c.Customer_id = o.Customer_ID
GROUP BY c.Customer_id, c.Name
ORDER BY total_spent DESC
LIMIT 1;

-- Calculate the stock remaining after fulfilling all orders

SELECT b.book_id, b.title, b.stock - IFNULL(SUM(o.quantity), 0) AS remaining_stock
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;


DESCRIBE orders;

DESCRIBE customers;
DESCRIBE orders;

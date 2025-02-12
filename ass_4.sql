use e_commerece_238;

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(100),
city VARCHAR(50),
age INT
);

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2),
status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
product_id INT PRIMARY KEY,
name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10,2),
stock INT
);

CREATE TABLE Order_Items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
subtotal DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, name, email, city, age) VALUES
(1, 'Alice', 'alice@gmail.com', 'New York', 30),
(2, 'Bob', 'bob@yahoo.com', 'Los Angeles', 25),
(3, 'Charlie', 'charlie@gmail.com', 'Chicago', 40),
(4, 'David', 'david@hotmail.com', 'Houston', 35),
(5, 'Eve', 'eve@gmail.com', 'San Francisco', 28),
(6, 'Frank', 'frank@gmail.com', 'New York', 33),
(7, 'Grace', 'grace@yahoo.com', 'Los Angeles', 29),
(8, 'Helen', 'helen@gmail.com', 'Chicago', 31);

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status) VALUES
(101, 1, '2024-01-15', 100.00, 'Shipped'),
(102, 2, '2024-01-20', 600.00, 'Completed'),
(103, 3, '2024-02-05', 250.00, 'Processing'),
(104, 3, '2024-02-08', 300.00, 'Completed'),
(105, 4, '2024-02-10', 150.00, 'Pending'),
(106, 5, '2024-02-12', 500.00, 'Shipped'),
(107, 6, '2024-02-15', 700.00, 'Processing'),
(108, 7, '2024-02-18', 450.00, 'Completed'),
(109, 8, '2024-02-20', 90.00, 'Shipped');

-- Insert data into Products table
INSERT INTO Products (product_id, name, category, price, stock) VALUES
(201, 'Laptop', 'Electronics', 1000.00, 5),
(202, 'Headphones', 'Accessories', 150.00, 20),
(203, 'Smartphone', 'Electronics', 800.00, 3),
(204, 'Backpack', 'Bags', 50.00, 30),
(205, 'Gaming Mouse', 'Accessories', 60.00, 10),
(206, 'Tablet', 'Electronics', 500.00, 8),
(207, 'Phone Case', 'Accessories', 25.00, 50),
(208, 'T-Shirt', 'Clothing', 20.00, 100),
(209, 'Jeans', 'Clothing', 40.00, 15),
(210, 'Desk Lamp', 'Furniture', 45.00, 7);

-- Insert data into Order_Items table
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, subtotal) VALUES
(301, 101, 202, 2, 300.00),
(302, 102, 201, 1, 1000.00),
(303, 103, 203, 1, 800.00),
(304, 104, 206, 1, 500.00),
(305, 105, 204, 3, 150.00),
(306, 106, 205, 2, 120.00),
(307, 107, 207, 4, 100.00),
(308, 108, 208, 5, 100.00),
(309, 109, 209, 2, 80.00),
(310, 103, 210, 2, 90.00);

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Order_Items;

-- 1. Find the total amount spent by customer ID 3 (sum of all their orders).
select sum(total_amount)
from Orders
where customer_id = 3;

-- 2. Find the total revenue generated from all orders.
select sum(total_amount)
from Orders;

-- 3. Calculate the stock value (price × stock) for each product.
select product_id, name, price, stock, (price*stock) as stock_value
from Products;

-- 4. Retrieve customers who are above 30 years old and live in "New York".
select * from customers
where (age>30 and city='New York');

-- 5. Find customers who either live in "Los Angeles" or have placed an order worth more
-- than $500.
select c.customer_id, c.name, c.city, c.age, o.total_amount 
from Customers c
left join Orders o on c.customer_id = o.customer_id
where (c.city = 'Los Angeles' or o.total_amount>500.00);

-- 6. List products that are in stock but cost less than $50.
select * from Products
where (stock>0 and price<50);

-- 7. Find Products That Have Less Than 5 Items in Stock
select * from products
where stock<5;

-- 8. Find orders that are not completed (status is not 'Completed').
select * from Orders
where status !='Completed';

-- 9. Find products that are out of stock or belong to the "Electronics" category.
select * from Products
where (stock=0 or category='Electronics');

-- 10. List all email addresses that belong to Gmail.
select email from Customers
where email like '%gmail.com';

-- 11. Find product names containing the word "Phone".
select * from Products
where name like '%Phone%';

-- 12. Find customers whose names have exactly 5 characters.
select * from Customers
where name like '_____';

-- 13. Find Products That Have "Laptop" or "Tablet" in Their Name
select * from Products
where name like '%Laptop%' or name like '%Tablet%';

-- 14. Retrieve orders placed in the year 2024.
select * from orders
where year(order_date) = 2024;

-- 15. Find customers who live in "New York", "Los Angeles", or "Chicago".
select * from Customers
where city in ('New York', 'Los Angeles', 'Chicago');

-- 16. List products that do not belong to the 'Electronics' or 'Clothing' categories.
select * from Products
where category not in ('Electronics', 'Clothing');

-- 17. Find orders placed by customers with IDs 1, 3, or 5.
select * from Orders
where customer_id in (1, 3, 5);

-- 18. Find customers who have not placed any orders.
select Customers.customer_id, Customers.name, Customers.email, Customers.city, Customers.age from Customers
left join Orders
on Customers.customer_id = Orders.customer_id
where Orders.customer_id is null;

-- 19. Show All Orders Placed in the Last 30 Days
select * from Orders
where order_date >= curdate() - interval 30 day;

-- 20. Find Orders Where the Total Amount is an Exact Multiple of 100
SELECT * 
FROM Orders 
WHERE total_amount % 100 = 0;

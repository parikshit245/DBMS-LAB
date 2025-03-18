create database Banking_System_238;
use Banking_System_238;

-- Creating the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    city VARCHAR(100),
    account_type VARCHAR(50)
);

-- Creating the Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(10,2),
    account_type VARCHAR(50),
    branch_id INT,                 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- Creating the Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(50),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- Creating the Branches table
CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(100)
);

-- Creating the Loans table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    loan_type VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting sample data into Customers
INSERT INTO Customers VALUES
(1, 'Alice', '1985-06-15', 'New York', 'Savings'),
(2, 'Bob', '1990-08-20', 'Los Angeles', 'Current'),
(3, 'Charlie', '1975-03-10', 'New York', 'Savings'),
(4, 'David', '1992-07-25', 'Chicago', 'Current'),
(5, 'Emma', '1988-12-30', 'Los Angeles', 'Savings');

select * from Customers;

-- Inserting sample data into Branches
INSERT INTO Branches VALUES
(1, 'Downtown Branch', 'New York'),
(2, 'LA Central', 'Los Angeles'),
(3, 'Chicago North', 'Chicago');
select * from Branches;

-- Inserting sample data into Accounts
INSERT INTO Accounts VALUES
(101, 1, 50000.00, 'Savings', 1),
(102, 2, 30000.00, 'Current', 2),
(103, 3, 10000.00, 'Savings', 1),
(104, 4, 70000.00, 'Current', 3),
(105, 5, 20000.00, 'Savings', 2),
(106, 1, 25000.00, 'Current', 3);
select * from Accounts;

-- Inserting sample data into Transactions
INSERT INTO Transactions VALUES
(201, 101, 5000.00, 'Deposit', '2025-01-10'),
(202, 102, 3000.00, 'Withdrawal', '2025-02-15'),
(203, 103, 2000.00, 'Deposit', '2025-03-10'),
(204, 104, 15000.00, 'Deposit', '2024-12-05'),
(205, 105, 5000.00, 'Withdrawal', '2025-01-25'),
(206, 106, 1000.00, 'Transfer', '2025-02-28');
select * from Transactions;

-- Inserting sample data into Loans
INSERT INTO Loans VALUES
(301, 1, 100000.00, 'Home', 'Approved'),
(302, 3, 50000.00, 'Car', 'Pending'),
(303, 4, 20000.00, 'Personal', 'Approved'),
(304, 5, 40000.00, 'Car', 'Rejected');
select * from Loans;

-- 1. Retrieve the total balance for each account type.
select account_type,sum(balance) as total_balance 
from  Accounts
group by account_type;

-- 2. Count the number of accounts in each branch.
select b.branch_name, count(a.account_id) as account_count
from Accounts as a
join Branches as b on a.branch_id = b.branch_id
group by b.branch_name;

-- 3. Find the number of customers in each city.
select city, count(name) as name_count
from Customers
group by city;

-- 4. Show the number of loans approved per loan type.
select loan_type, count(status) as status_count
from Loans
where status = 'Approved'
group by loan_type;

-- 5. Find the total number of transactions for each transaction type.
select transaction_type, count(*) as transaction_count
from Transactions
group by transaction_type;

-- 6. Show the customers who do not have a loan.
SELECT c.customer_id, c.name
FROM Customers c
LEFT JOIN Loans l ON c.customer_id = l.customer_id
WHERE l.customer_id IS NULL;

-- 7. Retrieve customers who have accounts in more than one branch.

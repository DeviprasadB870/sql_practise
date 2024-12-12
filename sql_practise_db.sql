use  sql_practice_db;
CREATE TABLE employees (
    employee_id INT ,
    emp_name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    email VARCHAR(100),
    years_at_company INT
);

INSERT INTO employees (employee_id, emp_name, age, department, salary, email, years_at_company) VALUES
(101, 'Alice', 25, 'IT', 50000.00, 'alice@gmail.com', 2),
(102, 'Bob', 35, 'HR', 40000.00, 'bob@yahoo.com', 6),
(103, 'Charlie', 30, 'Finance', 55000.00, NULL, 4),
(104, 'Diana', 40, 'IT', 70000.00, 'diana@gmail.com', 10),
(105, 'Evan', 29, 'Sales', 45000.00, 'evan@outlook.com', 3),
(106, 'Fiona', 22, 'IT', 65000.00, 'fiona@gmail.com', 1),
(107, 'George', 45, 'Marketing', 48000.00, 'george@gmail.com', 12),
(108, 'Hannah', 28, 'HR', 47000.00, 'hannah@yahoo.com', 5);

select * from employees;

CREATE TABLE sales (
    product_id INT,
    product_name VARCHAR(100),
    total_sales INT
);
INSERT INTO sales (product_id, product_name, total_sales) VALUES
(201, 'Laptop', 150),
(202, 'Smartphone', 300),
(203, 'Headphones', 200),
(204, 'Monitor', 100),
(205, 'Keyboard', 50);
 
 select * from sales;
 
 
 CREATE TABLE user_logs (
    user_id INT,
    last_login DATE,
    activity_status VARCHAR(50)
);

INSERT INTO user_logs (user_id, last_login, activity_status) VALUES
(301, '2024-11-01', 'Active'),
(302, '2024-09-25', 'Inactive'),
(303, '2024-11-05', 'Active'),
(304, '2024-10-01', 'Inactive'),
(305, '2024-11-03', 'Active'); 
SELECT * FROM user_logs;
drop table user_logs;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50)
);

INSERT INTO customers (customer_id, name, region) VALUES
(401, 'John Doe', 'North'),
(402, 'Jane Smith', 'South'),
(403, 'Emily Johnson', 'East'),
(404, 'Michael Brown', 'West'),
(405, 'Sarah Davis', 'North');
 
 select * from customers ;
 
 CREATE TABLE orders (
    order_id INT ,
    customer_id INT,
    product_id INT,
    order_date DATE,
    shipped_date DATE,
    delivery_date DATE
);
INSERT INTO orders (order_id, customer_id, product_id, order_date, shipped_date, delivery_date) VALUES
(501, 401, 202, '2024-10-01', '2024-10-03', '2024-10-05'),
(502, 402, 203, '2024-11-01', '2024-11-02', '2024-11-04'),
(503, 403, 201, '2024-10-20', '2024-10-22', '2024-10-21'),
(504, 401, 204, '2024-10-25', '2024-10-28', '2024-10-27'),
(505, 405, 203, '2024-11-03', '2024-11-05', '2024-11-06');
 
select * from  orders ;
  
CREATE TABLE user_activity (
    user_id INT,
    activity_status VARCHAR(50),
    last_login DATE
);

INSERT INTO user_activity (user_id, activity_status, last_login) VALUES
(301, 'Active', '2024-11-01'),
(302, 'Inactive', '2024-09-25'),
(303, 'Active', '2024-11-05'),
(304, 'Inactive', '2024-10-01'),
(305, 'Active', '2024-11-03');

select * from user_activity;

##1. Write a query to retrieve all data from a table named employees.
select * from employees;

##2. Fetch the name, age, and department columns from the employees table.
select emp_name , age, department from employees;

##3. Retrieve all employees whose age is greater than 30. 
select * from employees where age>30;

##4. Find employees who work in the IT department and have a salary greater than 50000. 
select * from employees where department = 'IT' and salary > 50000;

##5. Get all employees who work in the HR department or are less than 25 years old.
select * from employees where department = 'HR' or age < 25;

##6. Retrieve all employees who do not work in the Finance department.
select * from employees where department != 'Finance';

##7. Find employees whose names start with the letter 'A'.
select * from employees where emp_name like 'A%';

##8. Retrieve employees whose email addresses contain the domain gmail.com. 
select * from employees where email like '%gmail.com';

##9. Fetch the names and salaries of employees sorted by salary in descending order.
 select emp_name,salary from employees order by salary desc;
 
 ##10. Retrieve the top 5 highest-paid employees. 
 select * from employees order by salary desc limit 5;
 
 ##11. Count the total number of employees in the employees table.
 select count(*) from employees;
 
 ##12. Write a query to find the minimum and maximum salaries in the employees table. 
 select min(salary) as min_salary , max(salary) as max_salary from employees;
 
 #13. Calculate the average salary of employees in each department. 
 select department,avg(salary) as average_salary from employees group by department;
 
 #14. Find all employees who work in the IT department and have a salary greater than 
#60000 or have been with the company for more than 5 years. 
select * from employees where department='IT' and salary > 60000 or years_at_company > 5 ;

#15. Increase the salary of all employees in the Sales department by 10%.
update employees set salary = salary * 1.10 where department = 'Sales';
select * from employees where department="Sales";
#16. Update the department of an employee with employee_id = 101 to Marketing.
 update employees set department = 'Marketing' where employee_id = 101;
 
#17. Find all users who haven’t logged in for more than 30 days from a user_logs table. 
 select user_id, last_login from user_logs where last_login < CURDATE() - interval 30 day;
 
#18. Write a query to fetch the top 3 products with the highest sales from a sales table. 
 select product_name, total_sales from sales order by total_sales desc limit 3;
 
#19. Count the number of customers from each region in the customers table.
 select region, COUNT(*) as customer_count from customers group by region;
 
#20. Retrieve all orders from the orders table where the shipped_date is later than the delivery_date.
 select order_id, customer_id, product_id, order_date, shipped_date, delivery_date from orders where shipped_date > delivery_date;
 
# 21. Sort by Multiple Columns: Retrieve employees sorted by department in ascending order and salary in descending order. 
select employee_id, emp_name, department, salary from employees order by department ASC, salary DESC;

# 22. Fetch the highest-paid employee from each department. 
select department, emp_name, salary from employees
where (department, salary) IN (
    select department, MAX(salary)
    from employees
    group by department
);

# 23. Find all employees whose email addresses are NULL.
 select employee_id, emp_name, department, salary from employees where email IS NULL;
 
# 24. Update the salary to 30000 for all employees whose current salary is NULL.
update employees set salary = 30000 where salary IS NULL; 

#25. Count how many users are active and inactive from the user_activity table.
 select activity_status, COUNT(*) as user_count from user_activity group by activity_status;
 
#26. Using the orders table, calculate the total number of orders placed in the first quarter 
#(January to March) of 2023 and 2024. Compare the results to analyze the growth or decline in order activity.
 select year (order_date) as order_year, count(order_id) as total_orders
 from orders
 where month(order_date) between 1 and 3 
 group by year(order_date)
 order by order_year;
#27. Identify the customer who 1has made the most purchases.
 select customer_id, COUNT(*) AS purchase_count from orders group by customer_id order by purchase_count DESC limit 1;
 
#28. Find the product that has been purchased most frequently. 
select product_id, COUNT(*) as purchase_count from orders group by product_id order by purchase_count DESC limit 1;

#29. Assign a rank to each employee based on their salary in descending order.
 select employee_id, emp_name, salary, rank() over (order by salary DESC) as salary_rank from employees;
 
#30. Retrieve duplicate records from the orders table based on the customer_id and order_date.
select customer_id, order_date, COUNT(*) as duplicate_count from orders
group by customer_id, order_date having COUNT(*) > 1;
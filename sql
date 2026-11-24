
CREATE DATABASE company;
USE company;
CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employee VALUES
(1, 'Amit', 'IT', 50000),
(2, 'Rahul', 'HR', 40000),
(3, 'Priya', 'IT', 80000),
(4, 'Neha', 'HR', 60000),
(5, 'Karan', 'IT', 80000),
(6, 'Simran', 'Sales', 45000),
(7, 'Mohit', 'Sales', 55000);

-- Find the second-highest distinct salary
--offset means first highest ko skip kr diya 
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

-- Find the highest salary in each department
SELECT Department, MAX(Salary) AS Highest_Salary
FROM Employee
GROUP BY Department;

-- Find the third-highest distinct salary
-- OFFSET 2 skips the first two distinct salaries.
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 2;   


-- Display employee(s) receiving the maximum salary in the company
SELECT *
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
);

-- Find employees having duplicate salaries
SELECT *
FROM Employee
WHERE Salary IN (
    SELECT Salary
    FROM Employee
    GROUP BY Salary
    HAVING COUNT(*) > 1
);
-- Find departments having more than one employee
SELECT Department, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Department
HAVING COUNT(*) > 1;

SELECT *
FROM Employee e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE Department = e.Department
);

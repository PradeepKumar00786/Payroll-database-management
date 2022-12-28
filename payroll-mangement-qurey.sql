-- create a table
CREATE TABLE emp_info (
  id INT PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULL,
  age INT,
  city TEXT,
  salary INT
);

-- insert some values
INSERT INTO emp_info VALUES (1, 'Pradeep', 'M', 23, 'Noida', 50000);
INSERT INTO emp_info VALUES (2, 'Pradum', 'M', 31, 'Gorakhpur', 62000);
INSERT INTO emp_info VALUES (3, 'Sudhir', 'M', 50, 'Patna', 70000);
INSERT INTO emp_info VALUES (4, 'Shubhendr', 'M', 22, 'Kanpur', 45000);
INSERT INTO emp_info VALUES (5, 'Asheesh', 'M', 25, 'Banglore', 60000);
INSERT INTO emp_info VALUES (6, 'Prateek', 'M', 18, 'Lucknow', 35000);
INSERT INTO emp_info VALUES (7, 'Pooja', 'F', 35, 'Noida', 67000);
INSERT INTO emp_info VALUES (8, 'Aliya', 'F', 19, 'Gorakhpur', 40000);
INSERT INTO emp_info VALUES (9, 'Ram', 'M', 23, 'Banglore', 51000);
INSERT INTO emp_info VALUES (10, 'Ravi', 'M', 23, 'Patna', 50000);
INSERT INTO emp_info VALUES (11, 'Anu', 'F', 23, 'Noida', 48000);
INSERT INTO emp_info VALUES (12, 'Shahid', 'M', 23, 'Delhi', 50000);
INSERT INTO emp_info VALUES (13, 'Kajal', 'F', 40, 'Lucknow', 58000);
INSERT INTO emp_info VALUES (14, 'Ryan', 'M', 40, 'Delhi', 65000);
INSERT INTO emp_info VALUES (15, 'Joanna', 'F', 31, 'Lucknow', 60000);

-- fetch some values
SELECT * FROM emp_info;

-- createde designation table 
CREATE TABLE designation_info (
    id INT PRIMARY KEY,
    department VARCHAR,
    designation VARCHAR,
    degree VARCHAR
);
-- insert some values
INSERT INTO designation_info VALUES (4,'HR', 'Recruter', 'BBA');
INSERT INTO designation_info VALUES (3,'SDE', 'DSE', 'B.TECH');
INSERT INTO designation_info VALUES (2,'OPERATAR', 'OPERATOR', 'BA');
INSERT INTO designation_info VALUES (1,'DATA SCIENCE', 'DATA SCIENTIST', 'B.TECH');
INSERT INTO designation_info VALUES (5,'SALES', 'SALESMAN', 'BBA');
INSERT INTO designation_info VALUES (6,'ACCOUNT', 'ACCOUNTANT', 'B.COM');
INSERT INTO designation_info VALUES (7,'HR', 'Recruter', 'BBA');
INSERT INTO designation_info VALUES (8,'SDE', 'SDE', 'B.TECH');
INSERT INTO designation_info VALUES (9,'HR', 'Recruter', 'BBA');
INSERT INTO designation_info VALUES (15,'OPERATOR', 'OPERATOR', 'BA');
INSERT INTO designation_info VALUES (14,'SALES', 'SALESMAN', 'BBA');
INSERT INTO designation_info VALUES (13,'SDE', 'SDE', 'B.TECH');
INSERT INTO designation_info VALUES (12,'DATA SCIENCE', 'DATA SCIENTIST', 'B.TECH');
INSERT INTO designation_info VALUES (11,'SDE', 'SDE', 'B.TECH');
INSERT INTO designation_info VALUES (10,'DATA SCIENCE', 'DATA SCIENTIST', 'B.TECH');
SELECT * FROM designation_info;

-- salary table
CREATE TABLE salary_info (
    id INT PRIMARY KEY,
    salary_id INT,
    Gross_Salary INT,
    tax INT,
    payment VARCHAR
);
-- insert some values
INSERT INTO salary_info VALUES (1, 101, 50000, 50, 'done');
INSERT INTO salary_info VALUES (2, 101, 62000, 62, 'done');
INSERT INTO salary_info VALUES (3, 101, 70000, 70, 'done');
INSERT INTO salary_info VALUES (4, 101, 45000, 45, 'pending');
INSERT INTO salary_info VALUES (5, 101, 60000, 60, 'done');
INSERT INTO salary_info VALUES (6, 101, 35000, 35, 'pending');
INSERT INTO salary_info VALUES (7, 101, 67000, 67, 'pending');
INSERT INTO salary_info VALUES (8, 101, 40000, 40, 'done');
INSERT INTO salary_info VALUES (9, 101, 51000, 51, 'pending');
INSERT INTO salary_info VALUES (10, 101, 50000, 50, 'done');
INSERT INTO salary_info VALUES (11, 101, 48000, 48, 'done');
INSERT INTO salary_info VALUES (12, 101, 50000, 50, 'pending');
INSERT INTO salary_info VALUES (13, 101, 58000, 58, 'done');
INSERT INTO salary_info VALUES (14, 101, 65000, 65, 'pending');
INSERT INTO salary_info VALUES (15, 101, 60000, 60, 'done');
SELECT * FROM salary_info;

-- queries

SELECT distinct city FROM emp_info;

SELECT MAX(age), name AS oldest_emp
FROM emp_info; 

SELECT AVG(salary)
FROM emp_info;

SELECT * FROM emp_info
WHERE age BETWEEN 30 AND 40;

SELECT * FROM emp_info
WHERE city='Noida';

SELECT * FROM emp_info
ORDER BY age;

SELECT COUNT(id), name, age
FROM emp_info
GROUP BY age
HAVING COUNT(id) < 5;

SELECT * FROM emp_info
WHERE city IN ('Noida', 'Lucknow', 'Delhi');

SELECT * FROM emp_info
WHERE City='Lucknow' OR City='Delhi';

UPDATE emp_info
SET name = 'Riya', city= 'Lucknow'
WHERE id = 15;

SELECT * FROM emp_info;


-- join

-- SELECT emp_info.id, designation_info.department, salary_info.Gross_Salary
-- FROM ((emp_info
SELECT *
FROM ((emp_info
INNER JOIN designation_info ON emp_info.id = designation_info.id)
INNER JOIN salary_info ON emp_info.id = salary_info.id);

-- query
-- query 1 = no. of emp with pending and done payment
SELECT COUNT(id), payment
FROM salary_info
GROUP BY payment;

-- query 2 = no of emp designation wise
SELECT designation, COUNT(id)
FROM designation_info
GROUP BY designation;

-- query 3 = no. of emp degree wise
SELECT degree, COUNT(id)
FROM designation_info
GROUP BY degree;

-- query 4 = what is the department of Sudhir
SELECT name, department
FROM (emp_info
INNER JOIN designation_info ON emp_info.id = designation_info.id)
WHERE name='Sudhir';

-- query 5 = top 3 high paying emp
SELECT * FROM emp_info
ORDER BY salary DESC LIMIT 3;

-- query 6 = top 3 less paying emp
SELECT * FROM emp_info
ORDER BY salary ASC LIMIT 3;

-- query 7 = city wise no. of emp
SELECT city, COUNT(id)
FROM emp_info
GROUP BY city;

-- query 8 = find the name and designation which name start and end with vowel
SELECT name, age FROM emp_info
WHERE name LIKE 'P%';

-- query 9 = total pay salary
SELECT SUM(Gross_Salary)
FROM salary_info WHERE payment = 'done';

-- query 10 = total pending salary
SELECT SUM(Gross_Salary)
FROM salary_info WHERE payment = 'pending';

-- query 11 = salary OF DATA SCIENTIST
SELECT AVG(salary)
FROM ((emp_info
INNER JOIN designation_info ON emp_info.id = designation_info.id)
INNER JOIN salary_info ON emp_info.id = salary_info.id) WHERE  designation = 'DATA SCIENTIST';

-- query 12 = gender wise no. of emp
SELECT COUNT(id), gender
FROM emp_info
GROUP BY gender;

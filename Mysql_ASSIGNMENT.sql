create database student;
use student;
CREATE TABLE student.books 
(
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
('Where I''m Calling From: Selected Stories', 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from student.books;
show databases;
show tables;
DROP DATABASE mysql;
-- ========================================================================
							-- ASSIGNMENT 
-- =========================================================================
-- Create Database
CREATE DATABASE StudentManagementSystem;

-- Use the newly created database
USE StudentManagementSystem;

-- Create Student table
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,   -- ENUM is a special data type used to define a column that can only have one of a predefined set of values.
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL
);
-- Insert into Student

INSERT INTO Student (FirstName, LastName, DateOfBirth, Gender, Email, Phone) VALUES
('Aryan', 'Siddiquei', '2000-01-15', 'Male', 'aryan.s@gmail.com', '1234567890'),
('John', 'Doe', '1999-05-20', 'Male', 'john.doe@gmail.com', '9876543210'),
('Jane', 'Smith', '2001-03-10', 'Female', 'jane.smith@gmail.com', '5556667777'),
('Emily', 'Davis', '2002-07-25', 'Female', 'emily.davis@gmail.com', '4445556666'),
('Michael', 'Brown', '1998-11-12', 'Male', 'michael.brown@gmail.com', '2223334444');

-- Create Course table
CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseTitle VARCHAR(100) NOT NULL,
    Credits INT NOT NULL
);
-- Insert into Course
INSERT INTO Course (CourseTitle, Credits) VALUES
('Data Structures', 4),
('Database Management', 3),
('Machine Learning', 4),
('Web Development', 3),
('Operating Systems', 4);

-- Create Instructor table
CREATE TABLE Instructor (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);
-- Insert into Instructor
INSERT INTO Instructor (FirstName, LastName, Email) VALUES
('Alice', 'Johnson', 'alice.johnson@gmail.com'),
('Bob', 'Williams', 'bob.williams@gmail.com'),
('Charlie', 'Brown', 'charlie.brown@gmail.com'),
('Diana', 'Taylor', 'diana.taylor@gmail.com'),
('Edward', 'Moore', 'edward.moore@gmail.com');

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    EnrollmentDate DATE NOT NULL,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    InstructorID INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);
-- Insert into Enrollment
INSERT INTO Enrollment (EnrollmentDate, StudentID, CourseID, InstructorID) VALUES
('2024-01-01', 1, 1, 1),
('2024-01-01', 2, 2, 2),
('2024-01-01', 3, 3, 3),
('2024-01-01', 4, 4, 4),
('2024-01-01', 5, 5, 5);

-- Create Score table
CREATE TABLE Score (
    ScoreID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT NOT NULL,
    StudentID INT NOT NULL,
    DateOfExam DATE NOT NULL,
    CreditObtained INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
-- Insert into Score
INSERT INTO Score (CourseID, StudentID, DateOfExam, CreditObtained) VALUES
(1, 1, '2024-02-01', 85),
(2, 2, '2024-02-02', 90),
(3, 3, '2024-02-03', 88),
(4, 4, '2024-02-04', 92),
(5, 5, '2024-02-05', 89);

-- Create Feedback table
CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    Date DATE NOT NULL,
    InstructorName VARCHAR(100) NOT NULL,
    Feedback TEXT NOT NULL,                                        -- text is use to store very large strings. we don't have to define the length of string.
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
-- Insert into Feedback
INSERT INTO Feedback (StudentID, Date, InstructorName, Feedback) VALUES
(1, '2024-02-06', 'Alice Johnson', 'Great course, very detailed.'),
(2, '2024-02-07', 'Bob Williams', 'Instructor explained concepts well.'),
(3, '2024-02-08', 'Charlie Brown', 'Loved the hands-on approach.'),
(4, '2024-02-09', 'Diana Taylor', 'Excellent teaching style.'),
(5, '2024-02-10', 'Edward Moore', 'Very engaging and interactive.');

SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM Instructor;
SELECT * FROM Enrollment;
SELECT * FROM Score;
SELECT * FROM Feedback;

-- TASK 1
UPDATE Student
SET Email = 'jane_Smith@example.com'
WHERE FirstName = 'Jane' AND LastName = 'Smith';

UPDATE Instructor
SET Email = 'rogerwhite@example.com'
WHERE FirstName = 'Roger' AND LastName = 'White';

DELETE FROM Student
WHERE LastName = 'Smith';

SELECT * FROM Student
WHERE FirstName LIKE 'J%';

CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Task 1: Insert Data
INSERT INTO Employee (first_name, last_name, age, email) VALUES
('Aryan', 'Siddiquei', 24, 'aryan.s@example.com'),
('John', 'Doe', 30, 'john.doe@example.com'),
('Jane', 'Smith', 28, 'jane.smith@example.com'),
('Emily', 'Davis', 26, 'emily.davis@example.com'),
('Michael', 'Brown', 35, 'michael.brown@example.com');

-- Task 2: Retrieving Data
SELECT first_name, last_name FROM Employee;

-- Task 3: Filtering Data
SELECT first_name, last_name, age FROM Employee WHERE age > 30;

-- Task 4: Updating Data
UPDATE Employee SET age = age + 1 WHERE age > 25;

-- Create Database
CREATE DATABASE BankAccount;
-- Use the newly created database
USE BankAccount;

CREATE TABLE BankAccount (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_holder_name VARCHAR(100) NOT NULL,
    account_balance DECIMAL(15, 2) NOT NULL
);
-- Task 1: Insert Data
INSERT INTO BankAccount (account_id, account_holder_name, account_balance) VALUES
(101, 'John Doe', 25000.00),
(102, 'Jane Smith', 45000.50),
(103, 'Michael Brown', 15000.75),
(104, 'Emily Davis', 35000.00),
(105, 'David Wilson', 60000.30);

-- Task 2: Retrieving Data
SELECT account_holder_name, account_balance FROM BankAccount;

-- Task 3: Filtering Data
SELECT account_holder_name, account_balance
FROM BankAccount
WHERE account_balance > 30000;

-- Task 4: Updating Data
UPDATE BankAccount
SET account_balance = 28000.00
WHERE account_id = 101;

USE StudentManagementSystem;
select * from employee1;
-- Scenario 1: Retrieve Employees from the "Sales" Department with a Salary Greater Than 50,000
SELECT * FROM employee1 
WHERE department = 'Sales' 
AND salary >= 50000;

-- Scenario 2: Remove Record of a Resigned Employee
DELETE FROM employee1
WHERE emp_id = 1;  -- Replace id with the actual employee_id

-- Scenario 3: Delete Orders Placed Before '2022-01-01' and Still in 'Pending' Status
DELETE FROM orders
WHERE order_date < '2022-01-01'
AND status = 'Pending';

-- Scenario 4: Remove All Products from the "Discontinued" Category
DELETE FROM products
WHERE category = 'Discontinued';

-- Scenario 5: Add 1000 to the Bonus for Employees in the "Sales" Department
UPDATE employee1
SET bonus = bonus + 1000
WHERE department = 'Sales';

-- Lab 1- Database Schema:
-- Task: Let's consider a scenario where you want to retrieve information about student from a database
--  table named student and display the results in ascending order based on their last names.

SELECT * FROM student
ORDER BY LastName ASC;

-- Lab 2- Database Schema:
-- Task: Let's consider a scenario where you want to count the number of students based on their gender from a database table named Student.

SELECT gender, COUNT(*) AS student_count
FROM student GROUP BY gender;

-- Scenario 1:Library Books
-- Given a table called books with columns book_id, title, and author_id, write a query to
-- count the number of books written by each author, ordering the results by the author's name without using a join clause.

use student;
SELECT author_fname, author_lname, COUNT(*) AS book_count
FROM books GROUP BY author_fname, author_lname
ORDER BY author_lname ASC;


USE StudentManagementSystem;

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO product (product_name, category, price)
VALUES 
('Smartphone', 'Electronics', 60000),
('Refrigerator', 'Appliances', 80000),
('Laptop', 'Electronics', 90000),
('Book Shelf', 'Furniture', 5000),
('Smartwatch', 'Electronics', 20000),
('Air Conditioner', 'Appliances', 65000);

SELECT * FROM Employee WHERE department = 'IT' AND salary > 50000;

SELECT * FROM product
WHERE category = 'Electronics' OR price < 70000;


CREATE TABLE Employee1 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO Employee1 (first_name, last_name)
VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Emily', 'Brown'),
('Mark', 'Taylor'),
('Sarah', 'White');


SELECT * FROM Employee1;

ALTER TABLE Employee1
ADD COLUMN salary DECIMAL(10, 2),
ADD COLUMN department VARCHAR(50);

UPDATE Employee1 SET salary = 60000, department = 'IT' WHERE emp_id = 1;
UPDATE Employee1 SET salary = 45000, department = 'HR' WHERE emp_id = 2;
UPDATE Employee1 SET salary = 70000, department = 'IT' WHERE emp_id = 3;
UPDATE Employee1 SET salary = 50000, department = 'Sales' WHERE emp_id = 4;
UPDATE Employee1 SET salary = 55000, department = 'HR' WHERE emp_id = 5;

SELECT department, AVG(salary) AS average_salary                        -- Avg salary
FROM employee1
GROUP BY department;

SELECT department, AVG(age) AS average_age								-- Avg age
FROM employee
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;


select* from student;

-- Task1
SELECT * FROM Student
WHERE DateOfBirth > '2009-06-16';

-- Task2:
SELECT * FROM Student
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%';

-- Task 3 
SELECT * FROM Student                                                   -- SELECT StudentID, FirstName, LastName for specific column
WHERE FirstName != 'Alice' AND Email LIKE '%@example.com';

create database student2;
use student2;

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Age INT
);

INSERT INTO Person (PersonID, FirstName, LastName, Age) VALUES
(1, 'John', 'Doe', 30),
(2, 'Jane', 'Smith', 25),
(3, 'Emily', 'Brown', 28),
(4, 'Michael', 'Johnson', 35),
(5, 'Sarah', 'White', 22);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

INSERT INTO Employee (emp_id, first_name, last_name, age) VALUES
(101, 'Mark', 'Taylor', 32),
(102, 'Alice', 'Williams', 29),
(103, 'Robert', 'Davis', 45),
(104, 'Sophia', 'Jones', 27),
(105, 'David', 'Clark', 38);

SELECT * FROM Employee;
SELECT * FROM Person;
CREATE DATABASE college; -- command for creating database 
CREATE DATABASE IF NOT EXISTS test; -- creates database if not existed it gives warning if database is existed
DROP DATABASE IF EXISTS test; -- used for to delete database
USE college;  -- it is used to select a specific database to work with in your current session.
CREATE TABLE student(
  id INT PRIMARY KEY,  -- primary key means stores unique data and it does not stores null values
  name VARCHAR(50),    -- it is used for to create table in Database          
  age INT NOT NULL
);
INSERT INTO student VALUES(1,"vaibhav",21);  -- it is used insert data into tables
INSERT INTO student VALUES(2, "aman",24);      
SELECT * FROM student;                       -- it returns values stored in student table.                 
SHOW DATABASES;                              -- it returns name of databases.
SHOW TABLES;                                 -- it return name of tables.
-- this is single line comment
/*
THis is a multi-line comment.
It can span multiple lines.
*/
INSERT INTO student 
(id, name, age)
VALUES
(4,"shyam",21),
(5,"arjun",22);

SELECT * FROM student;   -- * means it returns data of all columns from student table
-- Practice que -- creating a database -- i already create this database in mysql command line 
USE xyz;
SELECT * FROM employee;
-- There is only one primary key in whole table
-- foreign key --> it is a column in a table that refers to the primary key of another table
-- there can be multiple fks in single table
-- it can stores duplicate and null values

/*
constraints
SQL constraints are used to specify rules for data in a table
NOT NULL -- columns cannot have a null value -- col1 int NOT NULL
UNIQUE -- all values in column are different -- col2 INT UNIQUE
PRIMARY KEY -- makes column unique and not null but used only for one 
DEFAULT -- sets default value of a column -- col_name INT DEFAULT value 
CHECK -- it can limit the values allowed in columns
*/
USE college;
CREATE TABLE temp1(
  id INT UNIQUE
  -- name char NOT NULL 
);
INSERT INTO temp1 VALUES(101);
INSERT INTO temp1 VALUES(101); -- it gives error because it is unique values
SELECT * FROM temp1;
CREATE TABLE temp(
cust_id int,
foreign key (cust_id) references temp1(id)
);
SELECT * FROM temp;
INSERT INTO temp1 VALUES(102);
CREATE TABLE emp(
salary INT DEFAULT 25000
);
SELECT * FROM emp;
SHOW TABLES;

CREATE TABLE city (
	id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK (age >=18 AND city ="Delhi")
);
INSERT INTO city VALUES(1,"Delhi",18);  -- gives error check constraint is voilated
INSERT INTO city VALUES(1,"Delhi",18);
SELECT * FROM city;

-- creating sample institute table 
CREATE DATABASE institute;
USE institute;
CREATE TABLE student(
	rollno INT PRIMARY key,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);
INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(101, "anil",78,"C","pune"),
(102, "bhumika",93,"A","mumbai"),
(103, "chetan",85,"B","mumbai"),
(104, "dhruv",96,"A","pune"),
(105, "emanuel",12,"F","delhi"),
(106, "farah",82,"B","noida");
SELECT * FROM student;
SELECT name, marks FROM student;  -- it shows only mentioned columns
SELECT DISTINCT city FROM student; -- it returns unique values from that specific column
-- WHERE Clause --> To define some conditions
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "mumbai";


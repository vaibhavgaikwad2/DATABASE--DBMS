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
SELECT * FROM student WHERE marks+10>100;
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
-- BETWEEN, AND, OR, IN, NOT operators are used to define condition with WHERE clause
-- LIMIT Clause -- sets an upper limit on number of rows to be returned
SELECT * FROM student LIMIT 3;
-- ORDER BY clause -- TO sort in ascending(ASC) or descending oder (DESC)
SELECT * FROM student ORDER BY city ASC;

-- Aggregate Functions -- performs a calculation on set of values and returns a single values
-- ex --> COUNT(), MAX(), MIN(), SUM(),
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT COUNT(name) FROM student;

-- GROUP BY clause --> Groups rows that have same values into summary rows
-- it collects data from multiple records and groups the result by one or more column
-- generally we use group by clause with some aggregate function 

SELECT city, COUNT(rollno)
FROM student
GROUP BY city;

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city ASC;


SELECT grade, COUNT(grade)
FROM student 
GROUP BY grade
ORDER BY grade ASC;

-- HAVING clause -- similar to WHERE i.e applies some condition on rows 
-- USed when we want to apply conditions after grouping

SELECT COUNT(name), city
FROM student
GROUP BY city
HAVING max(marks) > 90;
/*
General order to write clauses
SELECT column name
FROM table name
WHERE conditon
GROUP BY col name
HAVING condition
ORDER BY col name ASC;
*/


-- Table Related Queries
-- 1) UPDATE --> To update existing rows
UPDATE student
SET grade = "O" 
WHERE grade = "A";

UPDATE student 
SET marks = marks + 1;

SET SQL_SAFE_UPDATES = 0; -- > it is used to disable safe mode in mysql. safe mode prevents accidentle changes in db. use 1 to enable

-- 2) DELETE --> TO delete existing rows 

DELETE FROM student 
WHERE marks < 33;

-- Revisiting foreign key
CREATE TABLE dept(
	id INT PRIMARY KEY,  -- parent table
    name VARCHAR(50));
    
CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE);

-- Cascading for fk -- change in on db it should reflect in another db
/*
On DELETE cascade--> When we create a fk using this option it deletes the referencing rows in the
child table when the referenced row is deleted the parent table which has a primary key

ON UPDATE cascade--> When we create a fk using UPDATE CASCADE the referencing rows are updated inthe child table when the referenced 
row is is updated in the parent table which has a primary key
*/

INSERT INTO dept
VALUES 
(101,"cs"),
(102,"IT");

SELECT * FROM dept;
 
 INSERT INTO teacher
 VALUES 
 (101, "adam",101),
 (102,"eve",102);
 SELECT * FROM teacher;
  
  
  UPDATE dept 
  SET id =103
  WHERE id =102;


-- 3) ALTER -- to change the schema (design)
/*

1)ADD Column
ALTER TABLE table_name
ADD COLUMN col_name

2)DROP Column
ALTER TABLE table_name 
DROP Column name

3)RENAME Table
ALTER TABLE table_name
RENAME TO new_table_name

4)CHANGE Column
ALTER TABLE table_name 
CHANGE COLUMN old_name new_name new_dtype new_constraints;

5)MODIFY Column(modify dtype/constraints)
ALTER TABLE table_name
MODIFY col_name newdtype new_constraint

6) Truncate -- to delete table data it only deletes table data do not removes whole table like drop
TRUNCATE TABLE table_name;
*/
USE institute;
ALTER TABLE student
ADD COLUMN age INT;

SELECT * FROM student;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE Student
RENAME TO student;


-- Joins in SQL 
-- > join is used to combine rows from twp or more tables based on a related column between them
/*
Types
1) Inner join -- if we want common data from two tables we use innwe join
			 Returns records that have matching values in both tables
             syntax -- > SELECT column(s)
						 FROM tableA
                         INNER JOIN tableB
                         ON tableA.col_name = tableB.col_name;
             
             
2) outer join-->
	(1)Left join --> Returns all records from the left table and matched records from the right table
					 SELECT columns
                     FROM tableA
                     LEFT JOIN tableB
                     ON tableA.col_name = tableB.col_name;
				 
    (2)Right join --> 
    (3)Full join --> Returns all records when there is a match in either left or right table
					 SELECT * FROM table name as a
                     LEFT JOIN table name as b
                     ON a.col_name=b.col_name
                     UNION
                     SELECT * FROM table name as a
                     RIGHT JOIN table name as begi
                     ON a.col_name=b.col_name;
*/

SELECT * FROM student;
SELECT * FROM teacher;
select * from dept;

SELECT *
FROM student as s
INNER JOIN dept as d
ON s.rollno = d.id;

SELECT * 
FROM student

SELECT *
FROM student as s
LEFT JOIN dept as d
ON s.rollno = d.id;

select * from student;

SELECT *
FROM student as s
RIGHT JOIN dept as d
ON s.rollno = d.id;

SELECT * FROM student as s
LEFT JOIN dept as d
ON s.rollno=d.id
UNION
SELECT * FROM student as s
RIGHT JOIN dept as d
ON s.rollno=d.id;

-- LEFT Exclusive Join
SELECT * FROM student AS a
LEFT JOIN dept as d
ON a.rollno = d.id
WHERE d.id IS NULL;


-- same for right exclusive join -- means right col - common data

-- self join -- it is regular join but the table is joined with itself
-- refer pdf

-- UNION --> Used to combine the result set of two or more select statements


-- sql subqueries --> nested query --> query inside query
SELECT name, marks
FROM student
WHERE marks > (SELECT AVG(marks) from student);


-- Mysql views --> a view is virtual table based on the result set of an sql statement

CREATE VIEW view1 as 
select rollno, name from student;

SELECT * FROM view1;






































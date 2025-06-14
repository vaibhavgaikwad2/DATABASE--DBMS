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




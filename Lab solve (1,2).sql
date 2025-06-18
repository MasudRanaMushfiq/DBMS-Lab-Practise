create database dbmslab;
use dbmslab;

-- Example 01 --

CREATE TABLE student (
    roll VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    dept VARCHAR(5),
    year VARCHAR(5),
    semester VARCHAR(10)
); 

INSERT INTO student VALUES 
('06543201', 'Rahim', 'BBA', '2nd', '1st'),
('06543202', 'Karim', 'ICE', '2nd', '1st'),
('06543203', 'Motin', 'CSE', '1st', '2nd'),
('05654456', 'Swadhin', 'CSE', '1st', '2nd'),
('05654457', 'Hena', 'BBA', '4th', '2nd'),
('05654458', 'Sohag', 'CSE', '3rd', '1st');

use dbmslab;
select * from accident;

CREATE TABLE studentInfo (
    roll VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    fatherName VARCHAR(10),
    address VARCHAR(10),
    mobile VARCHAR(11)
);

INSERT INTO studentInfo VALUES 
('06543201', 'Rahim', 'Ataur', 'Rajshahi', '01719201233'),
('06543202', 'Karim', 'Tareq', 'Dhaka', '01719202020'),
('06543203', 'Motin', 'Rahman', 'Khulna', '01719202678'),
('05654456', 'Swadhin', 'Fazlu', 'Rajshahi', '01719204564'),
('05654457', 'Hena', 'Rahman', 'Rajshahi', '01119212020'),
('05654458', 'Sohag', 'Fazlul', 'Natore', '01719202222');

select * from studentinfo;

SELECT name FROM student WHERE semester = '1st';
SELECT name FROM student WHERE year = '2nd';
SELECT name FROM student WHERE dept = 'CSE';
SELECT name FROM student WHERE roll = '06543201';


SELECT name, address, mobile FROM studentInfo WHERE fatherName = 'Rahman';
SELECT name, address, mobile FROM studentInfo WHERE mobile = '01719202020';
SELECT name, address, mobile FROM studentInfo WHERE address = 'Rajshahi';
SELECT name, address, mobile FROM studentInfo WHERE address = 'Rajshahi' AND fatherName = 'Rahman';
SELECT name, address, mobile FROM studentInfo WHERE roll = '05654456';

-- Example 02 --- 

CREATE TABLE employee (
    employee_name VARCHAR(15) primary key,
    street VARCHAR(15),
    city VARCHAR(15)
);

describe employee;

INSERT INTO employee VALUES 
('Arif', '51 upashahar', 'Rajshahi'),
('Sumon', '52 east', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 north', 'Chittagong');

select * from employee;

CREATE TABLE works (
    employee_name VARCHAR(50) PRIMARY KEY,
    company_name VARCHAR(100),
    salary INT
);

DESCRIBE works;

INSERT INTO works VALUES 
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000);

select * from works;

SELECT employee_name FROM employee WHERE city = 'Rajshahi';
SELECT employee_name, street FROM employee WHERE city = 'Rajshahi';

SELECT employee_name FROM works WHERE company_name = 'Sonali';
SELECT employee_name FROM works WHERE company_name = 'Agrani';
SELECT employee_name FROM works WHERE company_name = 'Janata';

SELECT employee_name, salary FROM works WHERE company_name = 'Sonali';
SELECT employee_name, salary FROM works WHERE company_name = 'Agrani';
SELECT employee_name, salary FROM works WHERE company_name = 'Janata';

SELECT employee_name FROM works WHERE salary = 12000;
SELECT employee_name FROM works WHERE salary >= 12000;
SELECT employee_name FROM works WHERE salary < 12000;

SELECT employee_name, company_name FROM works WHERE salary = 12000;
SELECT employee_name, company_name FROM works WHERE salary >= 12000;
SELECT employee_name, company_name FROM works WHERE salary < 12000;

SELECT e.employee_name, e.street, e.city FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';

SELECT e.employee_name, e.street, e.city FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary >= 10000;

SELECT e.employee_name, w.company_name, w.salary FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE e.city = 'Rajshahi';

SELECT e.employee_name, e.street, e.city, w.company_name FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.salary >= 10000;

SELECT e.employee_name, e.street, e.city FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Sonali' AND w.salary > 12000;

SELECT e.employee_name FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name != 'Sonali';

UPDATE employee SET city = 'Natore' WHERE employee_name = 'Arif';

select * from employee;
SELECT * FROM WORKS;
SET SQL_SAFE_UPDATES = 0;

UPDATE works SET salary = salary * 1.10 WHERE company_name = 'Agrani';

DELETE FROM employee WHERE employee_name = 'Sagor';

use sakila;
 describe address;
 select * from address;
 select last_update from address where city_id = 280;

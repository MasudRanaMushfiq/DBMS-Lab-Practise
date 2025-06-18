CREATE DATABASE company;
USE company;

CREATE TABLE employee(
		employee_Name VARCHAR(50) PRIMARY KEY, 
		street VARCHAR(50),
		city VARCHAR(50)
		);

CREATE TABLE Company(
Company_Name VARCHAR(50) PRIMARY KEY, 
City VARCHAR(50)
);

CREATE TABLE Works(
Employee_Name VARCHAR(50), 
Company_Name VARCHAR(50),
Salary INT,
PRIMARY KEY (Employee_Name, Company_Name),
FOREIGN KEY (Employee_Name) REFERENCES Employee(Employee_Name),
FOREIGN KEY (Company_Name) REFERENCES Company(Company_Name)
);

CREATE TABLE Manages(
Employee_Name VARCHAR(50) PRIMARY KEY, 
Manager_Name VARCHAR(50),
FOREIGN KEY (Employee_Name) REFERENCES Employee(Employee_Name),
FOREIGN KEY (Manager_Name) REFERENCES Employee(Employee_Name)
);

INSERT INTO Employee (Employee_name, Street, City) VALUES
('Arif', '51 Upashahar', 'Rajshahi'),
('Sumon', '52 East', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 North', 'Chittagong');

INSERT INTO Company (Company_Name, City) VALUES
('Agrani', 'Rajshahi'),
('Sonali', 'Sylhet'),
('Janata', 'Dhaka');

INSERT INTO Works (Employee_Name, Company_Name, Salary) VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000); 

INSERT INTO Manages (Employee_Name, Manager_Name) VALUES
('Amirul', 'Amirul'),
('Abdul', 'Amirul'),
('Sagor', 'Amirul'),
('Sumon', 'Sumon'),
('Himesh', 'Sumon'),
('Arif', 'Arif'),
('Sajib', 'Arif');  
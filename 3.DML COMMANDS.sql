-- CREATING DATABASE

create database Employees;

use employees;

-- CREATING TABLE MANAGERS
CREATE TABLE Managers (
Manager_ID int primary key,
First_Name varchar (50) not null,
Last_Name varchar (50) not null,
DOB date not null,
Age int check (Age>18 and Age<68),
Last_Update timestamp not null default current_timestamp,
Gender char(1) check (Gender in ('M','F','O')),
Department Varchar (50) not null,
Salary decimal (10,2) not null
);

insert into Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Gender, Department, Salary) 
VALUES
(1, 'john', 'Doe', '1985-04-12', 39, 'M', 'IT', 38000),
(2, 'Michael', 'Khan', '1990-06-15', 34, 'F', 'HR', 46000),
(3, 'Sarah', 'Lee', '1978-04-12', 46, 'M', 'Finance', 25000),
(4, 'Aaliya', 'Davis', '1995-11-08', 32, 'F', 'IT', 29000),
(5, 'William', 'Linda', '1996-02-20', 28, 'F', 'Finance',52000),
(6, 'Sharook', 'smith', '1989-05-10', 35, 'F', 'IT', 35000),
(7, 'Brown', 'Taylor', '1985-04-25', 39, 'M', 'Sales', 47000),
(8, 'Laura', 'john', '1993-02-19', 31, 'M', 'IT', 39000),
(9, 'James', 'Moore', '1988-06-11', 36, 'M', 'Marketing', 45000),
(10, 'Emily', 'Jones', '1983-11-13', 41, 'F', 'HR', 29000);


SELECT * FROM MANAGERS;


-- RETRIVING NAME AND DOB OF MANAGER_ID 1
select First_Name,Last_Name,DOB
from Managers
where Manager_ID = 1;

-- ANNUAL INCOME OF ALL MANAGERS
select Manager_ID,First_Name,Last_Name,(salary * 12) as Annual_Income
from Managers;

-- DISPLAYING RECORDS OF ALL MANAGERS EXCEPT Aaliya
select * from Managers
where First_Name != 'Aaliya';


-- DISPLAYING IT DEPARTMENT MANAGERS WITH SALARY ABOVE 25000 
select * from Managers
where Department= 'IT' and Salary>25000;


-- DISPLAYING LIST OF MANAGERS WITH SALARY 10000 TO 35000
select * from Managers
where Salary between 10000 and	35000;
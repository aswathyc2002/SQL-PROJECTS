-- CREATING DATABASE
create database PERSONSCOUNTRY_SUBQUERIES_VIEWS;
USE PERSONSCOUNTRY_SUBQUERIES_VIEWS;

-- CREATING COUNTRY TABLE
create table Country (
ID int primary key,
Country_name varchar(100),
Population bigint,
Area float
);

-- INSERTING VALUES TO COUNTRY TABLE
insert into Country (ID, Country_name, Population, Area)
values
(1, 'USA', 331002651, 9833517),
(2, 'Canada', 37742154, 9984670),
(3, 'Brazil', 211049527, 8515767),
(4, 'India', 1380004385, 3287263),
(5, 'China', 1393409038, 9596961),
(6, 'Australia', 25499884, 7692024),
(7, 'Germany', 83783942, 357022),
(8, 'Russia', 145934462, 17098242),
(9, 'Japan', 126476461, 377975),
(10, 'Mexico', 128933395, 1964375);

select * from Country;

-- CREATING TABLE PERSONS
create table Persons( 
ID int primary key,
Fname varchar(50),
Lname varchar(50),
population bigint,
Rating decimal(2,1),
Country_Id int,
Country_name varchar(100),
foreign key (Country_Id) references Country(ID)
);

-- INSERTING VALUES TO PERSONS TABLE
insert into Persons(ID, Fname, Lname, Population, Rating, Country_Id, Country_name)
values
(1, 'John', 'Doe', 331002651, 5, 1, 'USA'),
(2, 'Jane', 'Smith', 37742154, 4, 2, 'Canada'),
(3, 'Carlos', 'Garcia', 211049527, 3, 3, 'Brazil'),
(4, 'Ravi', 'Sharma', 1380004385, 5, 4, 'India'),
(5, 'Wei', 'Zhang', 1393409038, 4, 5, 'China'),
(6, 'Emma', 'Johnson', 25499884, 3, 6, 'Australia'),
(7, 'Max', 'Müller', 83783942, 5, 7, 'Germany'),
(8, 'Olga', 'Petrova', 145934462, 2, 8, 'Russia'),
(9, 'Taro', 'Yamamoto', 126476461, 5, 9, 'Japan'),
(10, 'Maria', 'Martinez', 128933395, 4, 10, 'Mexico'),
(11, 'John', 'Dominic', 331222651, 5, 1, 'USA'),
(12, 'chris', 'Smith', 37775154, 4, 1, 'USA'),
(13, 'Thomas', 'Garcia', 211129527, 3, 2, 'Canada'),
(14, 'Mathew', 'Robert', 1381304385, 5, 4, 'India');

select * from Persons;

#1.NUMBER OF PERSONS IN EACH COUNRTY
select Country_name ,count(*) as Number_of_Persons
from persons 
group by Country_name;

#2. NUMBER OF PERSONS IN EACH COUNTRY SORTED FROM HIGH TO LOW
select Country_name ,count(*) as Number_of_Persons
from persons 
group by Country_name 
order by Number_of_Persons desc ;

#3. AVERAGE RATING FOR PERSONS IN RESPECTIVE COUNTRIES IF THE AVERAGE IS GREATER THAN 3.0
select Country_name, avg(Rating)  as Avg_Rating 
from persons 
group by Country_Name
having Avg(rating)>3.0;

#4. COUNTRIES WITH THE SAME RATING AS THE USA 
select  Country_name
from Persons
where Rating in(
select Rating
from Persons
where Country_name = 'USA')
group by Country_name;

 #5. COUNTRIES WHOSE POPULATION IS GREATER THAN THE AVERAGE POPULATION OF ALL NATIONS
 select Country_name,population
 from Country
 where Population>(select avg (population)
 from Country);
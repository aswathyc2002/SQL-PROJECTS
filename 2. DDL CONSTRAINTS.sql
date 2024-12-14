-- CREATING A DATABASE
CREATE DATABASE Sales;

USE Sales;

-- CREATING TABLE
CREATE TABLE Orders (
Order_ID int primary key not null unique,
Customer_name varchar (100) not null,
Product_Category varchar (100) not null,
Ordered_Item varchar (100) not null,
Contact_Number varchar (15) not null
);

# ADDING NEW COLUMN 
alter table Orders
add Order_Quantity int not null;

# RENAME THE TABLE ORDERS
rename table Orders to Sales_Orders_table;

 -- INSERTING DATA INTO SALES_ORDERS_TABLE
 insert into Sales_Orders_table(Order_ID,Customer_name,Product_Category,
 Ordered_item,Contact_Number,Order_Quantity) 
 values
 (101,'John Doe','Electonics','Smart phone','9238500586',2),
 (102,'Jane Smith','Electronics','Camera','9169324687',1),
 (103,'Alice Brown','Furniture','Computer Chair','8853697400',1),
 (104,'Bob Johnson','Clothing','Shoe','9123399440',3),
 (105,'Charlie Davis','Electronics','Smart phone','8459621076',1),
 (106,'David Wilson','Clothing','T-shirt','6459615700',5),
 (107,'Tom Holland','Furniture','Book shelf','9945863215',2),
 (108,'Brie Larson','Electronics','Camera','9563241227',1),
 (109,'Hanna Taylor','Clothing','Track Suit','9887612356',6),
 (110,'Iran Thomas','Electronics','Smart phone','8945621340',1);
 
-- RETRIVING CUSTOMER NAME AND ORDERED ITEM FROM TABLE
select Customer_Name,Ordered_Item from Sales_Orders_Table;

-- UPDATE THE PRODUCT NAME

update Sales_Orders_table
set Ordered_Item = 'Laptop'
Where Order_ID = 105;

select * from Sales_Orders_table;

-- DELETING THE TABLE
drop table Sales_Orders_table;
CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(250),
    Country VARCHAR(250),
);


CREATE TABLE Orders (
	OrderID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
);

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(250),
    Price INT,
);


INSERT INTO Customers (CustomerID, Name, Country)
VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Emily', 'UK'),
(6, 'Frank', 'USA'),
(7, 'Grace', 'UK'),
(8, 'Hannah', 'Canada'),
(9, 'Ivan', 'USA'),
(10, 'Jenny', 'UK');
;

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity)
VALUES
(1, 1, 101, 2),
(2, 2, 102, 1),
(3, 3, 103, 5),
(4, 4, 101, 1),
(5, 2, 101, 1),
(6, 5, 104, 3),
(7, 6, 101, 2),
(8, 7, 102, 1),
(9, 7, 104, 1),
(10, 10, 105, 4);


INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(101, 'Laptop', 800),
(102, 'Phone', 500),
(103, 'TV', 1200),
(104, 'Headphones', 150),
(105, 'Smartwatch', 250);


Select Name, Orders.ProductID, ProductName
from Customers 
Inner Join Orders on 
Orders.CustomerID = Customers.CustomerID
left join Products on
Products.ProductID = Orders.ProductID
where ProductName = 'Laptop'
;

SELECT AVG(Price) as AVG_Price
	FROM Orders
	left join Products
on Products.ProductID = Orders.ProductID
; 


SELECT ProductID, SUM(Quantity)
	as SUM_Quantity
	FROM Orders
	Group by ProductID
;


with product_quanity as(
select productid
	   , sum(quantity) as quantity
from orders
group by ProductID
)
select productname
	   , quantity
from Products as p
join product_quanity as pq 
on pq.ProductID = p.ProductID
order by quantity desc









Select Name, Customers.CustomerID, Orders.OrderID
	from Customers 
	left join Orders
	on Customers.CustomerID = Orders.CustomerID
where Orders.OrderID is Null
;
 
 Select Products.ProductName, Products.ProductID, Orders.OrderID
	from Orders
	left join Products
	on  Orders.ProductID =  Products.ProductID
	where Orders.OrderID is not Null
	Group by ProductName
;


select ProductName
from Products
where ProductID NOT IN (select ProductID from orders)
-- Creating the Customers table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Country VARCHAR(50)
);

-- Populating the Customers table
INSERT INTO Customers (CustomerID, Name, Country) VALUES
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

-- Creating the Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductID INT,
  Quantity INT,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Populating the Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity) VALUES
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

-- Creating the Products table
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price INT
);

-- Populating the Products table
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(101, 'Laptop', 800),
(102, 'Phone', 500),
(103, 'TV', 1200),
(104, 'Headphones', 150),
(105, 'Smartwatch', 250);

select * from products

/*List the names of customers who have ordered a 'Laptop'.*/

select c.name
from Customers as c
inner join orders as o on c.CustomerID = o.CustomerID
inner join products as p on o.ProductID = p.ProductID
where p.ProductName = 'Laptop'


/* What is the average price of the products ordered? */

/* With distinct products */
select AVG(price)as Average_Price,count(ProductID)
from Products
where ProductID in (select  ProductID from orders)

/* Without Distinct produts */
with products_dis as(select distinct productid 				, Pricefrom products)SELECT AVG(products_dis.Price) As AveragePrice ,count(products_dis.ProductID)From Ordersjoin products_dis ON Orders.ProductID=Products_dis.ProductID;

/* List the total quantity of each product ordered.*/

with product_quanity as(
select productid
	   , sum(quantity) as quantity
from orders
group by ProductID
)
select productname
	   , quantity
from Products as p
join product_quanity as pq on pq.ProductID = p.ProductID
order by quantity desc


/*List customers who have NOT made an order.*/
select c.name
from Customers as c
left join orders as o on c.CustomerID = o.CustomerID    
where o.OrderID is null

/* List the products that have never been ordered. */

select ProductName
from Products
where ProductID NOT IN (select ProductID from orders)










--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
SELECT c.CategoryName, p.ProductName, p.UnitPrice
From Products AS p, Categories as c
Where CategoryName = 'seafood'

SELECT c.CategoryName, p.ProductName, p.UnitPrice
From Products AS p join, Categories as c
on p.CategoryID= c.CategoryID
Where CategoryName = 'seafood'

--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
SELECT companyName, OrderId
From Orders, Shippers
WHERE Shippers.ShipperID = Orders.ShipVia

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID=Orders.Shipvia
WHERE OrderID=10275
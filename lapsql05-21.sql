--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
SELECT c.CategoryName, p.ProductName, p.UnitPrice
From Products AS p, Categories as c
Where CategoryName = 'seafood'

Select CategoryName, ProductName,UnitPrice
From Products as P Join Categories as C
On P.CategoryID= c.CategoryID

--จงแสดงข้อมูลหมายเลขใบสั่งซื้อและชื่อบริษัทขนส่งสินค้า
SELECT companyName, OrderId
From Orders, Shippers
WHERE Shippers.ShipperID = Orders.ShipVia

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID = Orders.Shipvia

--จงแสดงข้อมูลหมายเลขใบสั่งซื้อแลับริษัท ขนส่งสินค้าของใบสั่งซื้อหมายเลข 10275
SELECT CompanyName, OrderID
FROM Orders, Shippers
WHERE Shippers.ShipperID = Orders.Shipvia
AND OrderID = 10275

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID=Orders.Shipvia
WHERE OrderID=10275

--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ
SELECT p.ProductID, p.ProductName, s.CompanyName, s.Country
From products p join Suppliers s on p.SupplierID = s.SupplierID
where Country in ('usa','uk')

--ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งชื่อที่เกี่ยวข้อง เรียงตามลำดับของพนักงาน
SELECT e.EmployeeID,FirstName, o.OrderID
from Employees e JOIN Orders o on e.EmployeeID = o.EmployeeID
ORDER BY EmployeeID

--จงแสดงหมายเลขใบสั่งซื้อ, ชื่อบริษัทลูกค้า,สถานที่ส่งของ, และพนักงานผู้ดูแล
SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า, E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O 
join Customers C on O.CustomerID=C.CustomerID
join Employees E on O.EmployeeID=E.EmployeeID

--ต้องการชื่อรหัสขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
SELECT s.CompanyName, count(*) จำนวนorders
FROM Shippers s JOIN Orders o on s.ShipperID = o.ShipVia
GROUP BY s.CompanyName
ORDER BY 2 DESC

--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
SELECT p.ProductID, p.ProductName, sum(Quantity) จำนสนที่ขายได้
from Products p JOIN [Order Details] od on p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName

--ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับรหัสสินค้า
SELECT Distinct p.ProductID, p.ProductName
from Employees e JOIN Orders o on e.EmployeeID = o.EmployeeID
                 JOIN [Order Details] od on o.OrderID = od.OrderID
                 JOIN Products p on p.ProductID = od.ProductID
WHERE e.FirstName = 'Nancy'
ORDER BY ProductID

--ต้องการชื่อบริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
SELECT distinct s.Country
from Customers c join orders o on c.CustomerID = o.CustomerID
                 JOIN [Order Details] od on o.OrderID = od.OrderID
                 JOIN Products p on p.ProductID = od.ProductID
                 JOIN Suppliers s on s.SupplierID = p.SupplierID
WHERE c.CompanyName = 'Around the Horn'

--บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด 
SELECT p.ProductID,p.ProductName,sum (Quantity) จำนวนที่ซื้อ
from Customers c join orders o on c.CustomerID = o.CustomerID
                 JOIN [Order Details] od on o.OrderID = od.OrderID
                 JOIN Products p on p.ProductID = od.ProductID
WHERE c.CompanyName = 'Around the Horn'
GROUP by p.ProductID,p.ProductName

--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
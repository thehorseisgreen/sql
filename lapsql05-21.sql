--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
SELECT c.CategoryName, p.ProductName, p.UnitPrice
From Products AS p, Categories as c
Where CategoryName = 'seafood'

Select CategoryName, ProductName,UnitPrice
From Products as P Join Categories as C
On P.CategoryID= c.CagetgoryID

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
--ต้องการรหัสสิน ชื่อสินค้า เมือง และประเทศของบริษัทผู้จำหน่าย


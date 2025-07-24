--Calculate Column (คอลัมน์ที่มีการคำนวณ)
--มูลค่าสินค้าคงเหลือต่อรางการ
SELECT ProductID, productName,  
         UnitPrice, UnitsInStock,   
         UnitPrice * UnitsInStock AS StockUalue
FROM Products

--ต้องสั่งสินค้าเพิ่มหรือยัง
SELECT productID as รหัส, productName as สินค้า,
       UnitsInStock + UnitsOnOrder as จำนวนคงเหลือทั้งหมด,
       ReorderLevel as จุดสั่งซื้อ
FROM Products
WHERE (UnitsInStock  + UnitsOnOrder) < ReorderLevel

--ภาษีมูลค่าเพิ่ม 7 %
SELECT productID,productName,
       Unitprice,ROUND(UnitPrice * 0.07,2) AS Uat7
FROM Products

--ชื่อนามสกุลพนักงาน
SELECT employeeID,
  TitleOFCourtesy+FirstName+'' +LastName as[Employee Name]
FROM Employees

--ต้องการทราบราคาใรแต่ละรายการขายสินค้า [order details]
SELECT  orderID, productID,UnitPrice, Quantity, Discount,
         (UnitPrice* Quantity) as TotalPrice,
         (UnitPrice* Quantity)-(UnitPrice* Quantity* Discount) as Netprice
FROM [order details]

SELECT  orderID, productID,UnitPrice, Quantity, Discount,
         (UnitPrice* Quantity) as TotalPrice,
         (UnitPrice* Quantity)-(1- Discount) as Netprice
FROM [order details]

--ราคาจริง = ราคาเต็ม - ส่วนลด
--ราคาเต็ม = ราคา * จำนวน
--ส่วนลด = ราคาเต็ม * ลด
--ราคาจริง = (ราคา * จำนวน)-(ราคา * ลด) -(ราคา * จำนวน * ลด)
--ราคาจริง = ราคา * จำนวน * (1-ลด)
SELECT (42.40 * 35)-(42.40 * 35 * 0.15)

--ต้องการทราบอายุ และอายุของพนักงานทุกคน จนถึงปัจจุบัน
SELECT employeeID,FirstName, BirthDate, Datediff(YEAR,BirthDate,getdate())Age,
       HireDate, DATEDIFF(YEAR,HireDate,GETDATE()) YearINoffice
FROM Employees

--Aggregate Function หรือ Group Function (Sum count min max avg ....)
--คำสั่ง count
--แสดงจำนวนชนิดสินค้าที่มีเก็บไว้ต้ำกว่า15 ชิ้น
SELECT COUNT(*) AS จำนวนสินค้า, COUNT(productID), count(ProductName),COUNT(UnitPrice)
FROM Products
WHERE UnitsInStock < 15
--จำนวนลูกค้าที่อยู่ประเทศ usa
SELECT COUNT(*) FROM Customers WHERE Country = 'USA'
--จำนวนพนักงานที่อยู่ใน london
SELECT COUNT(*) FROM Employees WHERE City = 'London'
--จำนวนใบสั่งซื้อที่ออกในปี 1997
SELECT COUNT(*) FROM Orders WHERE YEAR(OrderDate) = 1997
--จำนวนครั้งที่ขายสินค้ารหัส 1
SELECT COUNT(*) FROM [Order Details] WHERE ProductID =1
--Function Sum
--จำนวนสินค้าที่ขายได้ทั้งหมด เฉพาะสินค้ารหัส1
SELECT sum(quantity)
FROM [order Details]
WHERE ProductID = 2
--มูลค่าสินค้าในคลังทั้งหมด
SELECT sum(unitprice * unitsInStock)
FROM Products
--จำนวนสินค้ารหัสประเภท8 ที่สั้งซื้อแล้ว
SELECT SUM(UnitsOnOrder)
FROM Products
WHERE CategoryID = 8
--function max min
--ราคาสินค้าหรัส 1 ที่ขายได้ราคาสูงสุดและต้ำสุด
SELECT MAX(unitprice), MIN(Unitprice)
FROM [Order Details]
WHERE ProductID =72
--function AVE
--ราคาสินค้าเฉลี่ยทั้งหมด ที่เคยขายได้เฉพาะรหัส5
SELECT AVG(Unitprice), MIN(Unitprice), MAX(Unitprice)
FROM [Order Details]
WHERE ProductID = 5

--การจัดกลุ่มข้อมูล โดยใช้ group by
--แสดงชื่อประเทศ และจำนวนลูกค้าที่อยู่ในประเทศ จากตารางลูกค้า
SELECT Country,COUNT(*)as [Num of country]
From Customers
GROUP BY Country

--รหัสประเภทสินค้า ราคาเฉลี่ยของสินค้าประเภทเดียวกัน
SELECT categoryID, AVG(Unitprice),MIN(Unitprice),MAX(Unitprice)
FROM Products
GROUP BY categoryID

--รายการสินค้าในการสั่งซื้อทุกใบ
SELECT orderID, COUNT(*)
FROM [Order Details]
GROUP BY OrderID

--ประเภทปลายทางจำนวนใบสั่งซื้อที่ส่งสินค้าไปยังปลายทาง
SELECT shipCountry, COUNT(*)
FROM Orders
GROUP BY ShipCountry

--เงื่อนไขในการจัดกลุ่ม โดยใช้ HAVTNE
--ต้องการเฉพาะใบสั่งซื้อ ตั้งแต่ 100 ขึ้นไป
SELECT ShipCountry, COUNT(*)as numOforders
FROM Orders
GROUP BY ShipCountry
Having COUNT(*)>=100

--ข้อมูลรหัสใบสั่งซื้อ ยอดเงินรวมในใบสั่งซื้อ แสดงเฉพาะใบสั่งซื้อที่มียอดน้อยกว่า 100
SELECT orderID, SUM(UnitPrice*Quantity*(1-Discount))
from [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice*Quantity*(1-Discount)) < 100

--ประเทศใดที่มีจำนวนใบสั่งสินค้าไปปลายทางต้ำกว่า 20 รายการ ในปี 1997
SELECT shipcountry, COUNT(*) as numOforders
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipCountry
HAVING COUNT(*)<20
ORDER BY COUNT(*) DESC
--ใบสั่งซื้อใดมียอดขายสูงที่สุด แสดงรหัสใบสั่งซื้อและยอดขาย
SELECT top 1 orderID, SUM(UnitPrice*Quantity*(1-Discount)) as total
from [Order Details]
GROUP BY OrderID
ORDER BY total DESC
--ใบสั่งซื้อใดมียอดขายสูงที่สุด 5 อันดับ แสดงรหัสใบสั่งซื้อและยอดขาย
SELECT top 5 orderID, SUM(UnitPrice*Quantity*(1-Discount)) as total
from [Order Details]
GROUP BY OrderID
ORDER BY total ASC
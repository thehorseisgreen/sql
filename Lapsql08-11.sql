--Sub Query
--ต้องการข้อมูลคนที่มีตำแหน่งแนวกัน Nancy
-----1.หาตำแหน่งของ Nancy ก่อน
Select Title From Employees
Where FirstName = 'Nancy'
-----2.หาข้อมูลคนที่มีตำแหน่งเดียวกับข้อ 1
Select * From Employees
Where Title = (Select Title From Employees Where FirstName = 'Nancy')
--ต้องการชื่อนามสุกญพนักงานที่มีอายุมากที่สุด
SELECT Firstname, Lastname FROM Employees 
WHERE BirthDate = (Select min(BirthDate)FROM Employees)
--ต้องการชื่อสินค้าที่มีราคามากกว่าสินค้าชือ Ikure
SELECT ProductName FROM Products
WHERE UnitPrice > (Select UnitPrice from Products WHERE ProductName = 'Ikura')
--ต้องการชื่อบริษัทลูกค้าที่อยู่ในเมืองเดียวกันกับบริษัทชื่อ Around the Horn
SELECT CompanyName FROM Customers
WHERE City = (select City FROM Products WHERE CompanyName = 'Around the Horn' )
--ต้องการชื่อนามสุกญพนักงานที่เข้างานคนล่าสุด
SELECT Firstname LastName FROM Employees
WHERE HireDate = (Select MAX(HireDate) FROM Employees) 
---ข้อมูลใบสั่งชื่อที่ถูกส่งไปประเทศที่ไม่มีผู้ผลิตสินค้าตั้งอยู่
SELECT * FROM Orders
WHERE ShipCountry NOT IN (select distinct country FROM Suppliers)

--การใส่ตัวเลขลำดับ
--ต้องการข้อมูลสินค้าที่มีราคาน้อยกว่า 50%
SELECT ROW_NUMBER() OVER (ORDER BY UnitPrice) AS RowNum, ProductName , UnitPrice
FROM Products
WHERE UnitPrice < 50

--------คำสั่ง Insert เพิ่มข้อมูล
--ตาราง มี pk เป็น AutoIncrement 
INSERT into Shippers
VALUES ('บริษัทขนเยอะจำกัด','081-12345678')

INSERT into Shippers(CompanyName)
values('บริษัทขนมมหาศาลจำกัด')
SELECT * FROM Customers

--ตารางที่มี pk เป็น Char, nChar
INSERT into Customers(CustomerID,CompanyName)
VALUES ('A0001','บริษัทซื้อเยอะจำกัด')

--จงเพิ่มข้อมูลพนักงาน 1 คน (ใส่ข้อมูลเท่าที่มี)
INSERT into Employees(FirstName,LastName)
VALUES ('ใบ','เฟิร์น')
SELECT * FROM Employees

--จงเพิ่มสินค้า ปลาแดกบอง ราคา 1.5$ จำนวน 12
INSERT into Products(ProductName,UnitPrice,UnitsInStock)
VALUES('ปลาแดกบอง',1.5,12)
SELECT * FROM Products

--------คำสั่ง Update ปรับปรุงข้อมูล
--ปรับปรุงเบอร์โทรศัพท์ ของบริษัทขนส่ง รหัส 6
UPDATE Shippers
set Phone = '095-999999'
WHERE ShipperID = 5
SELECT * FROM Shippers
--ปรัลปรุงจำนวนสินค้าคงเหลือสินค้ารหัส 1 เพิ่มจำนวนเข้าไป 100 ชิ้น
UPDATE Products
SET UnitsInStock = UnitsInStock+100
WHERE ProductID = 1

SELECT * FROM Products
--ปรับปรุง เมือง และประเทศลูกค้า รหัส A0001 ให้เป็น อุดรธานี, Thailand
UPDATE Customers
SET City = 'อุดรธานี', Country = 'Thailand'
WHERE CustomerID = 'A0001'

SELECT * FROM Customers

----------คำสั่ง Delete ลบข้อมูล
--ลบบริษัทขนส่งสินค้า รหัส 6
DELETE from Shippers
WHERE ShipperID = 6

SELECT * FROM Orders


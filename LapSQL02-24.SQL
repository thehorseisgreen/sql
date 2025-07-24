--1.ต้องการรหัสพนักงาน คำนำหน้า ชื่อ นามสกุล ของพนักงานที่อยู่ในประเทศ USA
SELECT EmployeeID, Titleofcourtesy,FirstName,LastName 
from Employees 
WHERE country = 'usa'
--2. ต้องการข้อมูลสินค้าที่มีรหัสประเภท 1,2,4,8 และมีราคา ช่วง 100$-200$
SELECT * 
FROM Products
WHERE CategoryID in (1,2,4,8)and Unitprice BETWEEN 100 and 200
--3. ต้องการประเทศ เมือง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร ของลูกค้าทั้งหมด ที่อยู่ในภาค WA และ WY
SELECT country, City, companyName,contactName,phone
FROM customers
WHERE region = 'WA' or Region = 'WY' 
--4. ข้อมูลของสินค้ารหัสประเภทที่ 1 ราคาไม่เกิน 20 หรือสินค้ารหัสประเภทที่ 8 ราคาตั้งแต่ 150 ขึ้นไป
SELECT *
FROM Products
WHERE (CategoryID =1 and Unitprice<=20)
  or  (CategoryID =8 and Unitprice>=150)
--5. ชื่อบริษัทลูกค้า ที่อยู่ใน ประเทศ USA ที่ไม่มีหมายเลข FAX  เรียงตามลำดับชื่อบริษัท 
SELECT CompanyName
FROM customers
WHERE fax is NULL ORDER BY companyName
--6. ต้องการข้อมูลลูกค้าที่ชื่อบริษัททมีคำว่า Com
SELECT *
FROM customers
WHERE companyName LIKE '%com%'

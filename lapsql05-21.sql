SELECT CategoryName, ProductName, UnitPrice
From Products, Categories
Where Products.CategoryId=Categories.CategoryID

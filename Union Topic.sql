---## UNION AND UNION ALL OPERATOR

select * from df1
select * from df2
--- Union All
select * from df1
union all -- add data row wise $ keep duplicate rows.
select * from df2

--- union 
Select * From df1
union   -- add data row wise and remove duplicate rows.
select * from df2

 ---- single column union
 select City from Customers   --91
 union ALL
 select City from Suppliers   --29
 order By City

 select City from Customers   --91
 union 
 select City from Suppliers   --29
 order By City


 --- UNION ALL
 --- Use UNION ALL to also select duplicate values !
 --- NUION ALL WITH WHERE

 select City, Country From Customers
 Where Country='Germany'            ---11 Rows
 Union ALL    --- add row wise & Keep duplicate
 Select City,Country From Suppliers
 Where Country='Germany'            --- 3 Rows
 Order By City

 Select City,Country From Customers
 Where Country='Germany'           ---11 Rows
 UNION      --- add rows wise and remove duplicate
 Select City,Country From Suppliers
 where Country='Germany'           ---3 Rows
 Order By City


 --- Advanced union
select * into abcd
From (
	Select City, Country From Customers
	where Country='Germany' ---11 rows
	Union ALL
	select City,Country from suppliers --- 3 rows
	where Country='Germany') AS tmp

	select * from abcd



---## ANY AND ALL OPERATORS
---ANY
select * from [order details]
where UnitPrice < 250

--ANY = or
Select * From Products
where ProductID = ANY (Select Distinct productID
From [order Details] where UnitPrice > 250)

Select * From Products
where ProductID = ANY (Select Distinct productID
From [order Details] where Quantity > 110)

---ALL = AND

select * from Products
where ProductID = All (Select Distinct ProductID
from [Order Details] where Quantity > 110)
USE [TT219-2]
-- lab 4.1
SELECT city_cust, Max(rating_cust) as maxRating
from Customers
group by city_cust

-- 4.2
SELECT year(date_ord) as year, avg(sum_ord)
FROM Orders
group by year(date_ord)

-- 4.3
select city_cust, lname_cust, rating_cust 
from Customers
where city_cust = 'Yerevan'

-- 4.4
select * 
from Sellars
where lname_sel like 'M%'

--4.5
select name_cust, rating_cust, sum_ord
from Customers
join Orders on Orders.id_cust = Customers.id_cust

--4.6
select Sellars.id_sel, lname_sel, date_ord
from Sellars
join Orders on Orders.id_sel = Sellars.id_sel
where city_sel = 'Yerevan' and YEAR(date_ord) < 2013

--4.7
select city_cust, avg(Credit)[average Credit]
from Customers
group by city_cust
having count(*) > 1

--4.8
SELECT 
    [id_goods],
    [goods_name],
    [Price],
    [quantity],
    [id_cust],
    FORMAT([Price], 'C', 'en-US') AS FormattedPrice 
FROM Goods
WHERE 
    [goods_name] LIKE 'A%'
    AND [quantity] >= 10 

--4.8.2
SELECT 
    [id_goods],
    [goods_name],
    [Price],
    [quantity],
    [id_cust],
    FORMAT([Price], 'C', 'en-US') AS FormattedPrice,
    CASE 
        WHEN [quantity] >= 10 THEN [quantity]
        ELSE 0
    END AS CountQuantity
FROM Goods
WHERE 
    [goods_name] LIKE 'A%' 
    AND [quantity] >= 10 

-- 4.9
select city_sel, power(sum(comis_sel), 2) as [square sel]
from Sellars
group by city_sel

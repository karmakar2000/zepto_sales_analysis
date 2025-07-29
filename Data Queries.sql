use zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name, mrp, discountPercent from zepto_v2
order by discountPercent desc limit 10;

-- Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name, mrp
FROM zepto_v2
WHERE IFNULL(outOfStock, FALSE) = TRUE AND mrp > 300;

-- Q3.Calculate Estimated Revenue for each category

select Category, sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto_v2
group by Category
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name, mrp, discountPercent from zepto_v2
where mrp > 500 and discountPercent < 10 
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select Category, round(avg(discountPercent), 2) as avg_discount 
from zepto_v2
group by Category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto_v2
where weightInGms >= 100
order by price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.

select distinct name, weightInGms, 
case when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
    else 'Bluk'
    end as weight_category
from zepto_v2;

-- Q8.What is the Total Inventory Weight Per Category

select Category, sum(weightInGms * availableQuantity) as total_weight
from zepto_v2
group by Category
order by total_weight;
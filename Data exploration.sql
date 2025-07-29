use zepto;

# Data exploration
# Count of Rows

select count(*) from zepto_v2;

#Sample Data
select * from zepto_v2 limit 10;

#null values

SELECT * FROM zepto_v2 WHERE name IS NULL
OR Category IS NULL OR mrp IS NULL OR discountPercent IS NULL
OR availableQuantity IS NULL OR discountedSellingPrice IS NULL 
OR weightInGms IS NULL OR outOfStock IS NULL OR quantity IS NULL;

# Different Product Category
select distinct Category from zepto_v2 order by Category;

# Products in stock vs out of stock 

SELECT outOfStock, COUNT(*) AS total_products
FROM zepto_v2
GROUP BY outOfStock;

# Product names present_multiple times

select name, count(*) as Number_of_sku from zepto_v2
group by name 
having count(*) > 1
order by count(*) desc;


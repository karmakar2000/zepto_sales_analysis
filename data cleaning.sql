use zepto;

# DATA CLEANING

# Products with price = 0
select * from zepto_v2 where mrp = 0 or discountedSellingPrice = 0;

# Delete those Products with price = 0
delete from zepto_v2 where mrp = 0;

SET SQL_SAFE_UPDATES = 0;

# Convert Paise to rupees
update zepto_v2 set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto_v2;

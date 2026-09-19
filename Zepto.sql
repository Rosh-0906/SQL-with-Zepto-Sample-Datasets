create database zepto;
drop table if exists zepto;
create table zepto_v2(
category varchar(120),
name varchar(150),
mrp numeric(8,2),
discountPercent numeric(8,2),
availableQuantity integer,
discountedSellingPrice integer,
weightInGms numeric(8,2),
outOfStock boolean,
quantity integer
);

-- data exploration
-- count rows
SELECT COUNT(*) FROM zepto.zepto_v2;

-- sample data
SELECT * FROM zepto.zepto_v2 LIMIT 20;

-- null values
SELECT * FROM zepto.zepto_v2 WHERE name IS NULL OR
ï»¿Category IS NULL OR
mrp IS NULL OR
discountPercent IS NULL OR
availableQuantity IS NULL OR
discountedSellingPrice IS NULL OR
weightInGms IS NULL OR
outOfStock IS NULL OR
quantity IS NULL;

-- diiferent categories
SELECT DISTINCT ï»¿Category FROM zepto.zepto_v2 order by ï»¿Category;

-- product in vs out of stock
SELECT outofStock, COUNT(*) FROM zepto.zepto_v2 GROUP BY outofStock;

-- product name present multiple users
SELECT name, COUNT(*) as "Multiple users" FROM zepto.zepto_v2 GROUP BY name;
SELECT name, COUNT(*) as "Multiple users" FROM zepto.zepto_v2 GROUP BY name HAVING COUNT(*)>1 ORDER BY name DESC;
SELECT name, COUNT(*) as "Multiple users" FROM zepto.zepto_v2 GROUP BY name HAVING COUNT(*)>5 ORDER BY name DESC;

-- data cleaning
-- product with price=0
SELECT * FROM zepto.zepto_v2 WHERE mrp=0 OR discountedSellingPrice=0;

-- convert paise to rupees
UPDATE zepto.zepto_v2 SET mrp=mrp/100.0, discountedSellingPrice=discountedSellingPrice/100.0;
SELECT mrp,discountedSellingPrice FROM zepto.zepto_v2;

-- BUSINESS INSIGHTS
-- Found top 10 best-value products based on discount percentage
SELECT DISTINCT name,mrp,discountPercent FROM zepto.zepto_v2 ORDER BY discountPercent DESC LIMIT 10;

-- Identified high-MRP products that are currently out of stock
SELECT DISTINCT name,mrp,outofStock=True FROM zepto.zepto_v2 ORDER BY mrp DESC;

-- Estimated potential revenue for each product category
SELECT ï»¿Category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue FROM zepto.zepto_v2 GROUP BY ï»¿Category ORDER BY total_revenue;

-- Filtered expensive products (MRP > ₹500) with minimal discount
SELECT DISTINCT ï»¿Category,mrp,discountPercent FROM zepto.zepto_v2 WHERE mrp>500 AND discountPercent<10 ORDER BY mrp DESC;

-- Ranked top 5 categories offering highest average discounts
SELECT DISTINCT ï»¿Category,discountedSellingPrice FROM zepto.zepto_v2 ORDER BY discountedSellingPrice DESC LIMIT 5;
SELECT DISTINCT ï»¿Category,discountPercent FROM zepto.zepto_v2 ORDER BY discountPercent DESC LIMIT 5;

-- Calculated price per gram to identify value-for-money products
SELECT DISTINCT ï»¿Category,SUM(mrp / weightInGms) AS price_per_gram FROM zepto.zepto_v2 GROUP BY ï»¿Category ORDER BY price_per_gram;

-- Grouped products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT ï»¿Category,
    CASE 
        WHEN quantity > 1000 THEN 'Bulk'
        WHEN quantity > 500 THEN 'Medium'
        ELSE 'Low'
    END AS quantity_level
FROM zepto.zepto_v2
ORDER BY ï»¿Category ASC;

-- End of Query -- 
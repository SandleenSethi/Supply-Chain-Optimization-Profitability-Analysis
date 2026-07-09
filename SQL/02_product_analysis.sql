/*
========================================================
PROJECT: Supply Chain Performance & Profitability Analysis
BLOCK 2: PRODUCT PERFORMANCE ANALYSIS
AUTHOR: Sandleen
========================================================

PURPOSE:
This block analyzes product and category performance to
identify top revenue drivers, profitable products, and
underperforming items.
========================================================
*/

USE supply_chain_project;

--------------------------------------------------------
-- 1. TOP 10 PRODUCTS BY SALES
--------------------------------------------------------
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


--------------------------------------------------------
-- 2. TOP 10 PRODUCTS BY PROFIT
--------------------------------------------------------
SELECT 
    `Product Name`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;


--------------------------------------------------------
-- 3. TOP CATEGORIES BY SALES
--------------------------------------------------------
SELECT 
    `Category Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Category Name`
ORDER BY total_sales DESC;


--------------------------------------------------------
-- 4. TOP CATEGORIES BY PROFIT
--------------------------------------------------------
SELECT 
    `Category Name`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Category Name`
ORDER BY total_profit DESC;


--------------------------------------------------------
-- 5. LOW PERFORMING PRODUCTS (BY PROFIT)
--------------------------------------------------------
SELECT 
    `Product Name`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;


--------------------------------------------------------
-- 6. PRODUCT SALES VS PROFIT COMPARISON
--------------------------------------------------------
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_sales DESC;
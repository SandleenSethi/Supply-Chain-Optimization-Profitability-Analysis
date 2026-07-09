/*
========================================================
PROJECT: Supply Chain Performance & Profitability Analysis
BLOCK 5: CUSTOMER ANALYSIS
AUTHOR: Sandleen
========================================================

PURPOSE:
This block analyzes customer segments, behavior, and value
to understand who drives revenue and profit.
========================================================
*/

USE supply_chain_project;

--------------------------------------------------------
-- 1. SALES BY CUSTOMER SEGMENT
--------------------------------------------------------
SELECT 
    `Customer Segment`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY total_sales DESC;


--------------------------------------------------------
-- 2. PROFIT BY CUSTOMER SEGMENT
--------------------------------------------------------
SELECT 
    `Customer Segment`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY total_profit DESC;


--------------------------------------------------------
-- 3. NUMBER OF ORDERS BY SEGMENT
--------------------------------------------------------
SELECT 
    `Customer Segment`,
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY total_orders DESC;


--------------------------------------------------------
-- 4. TOP CUSTOMERS BY SALES
--------------------------------------------------------
SELECT 
    `Order Customer Id`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Order Customer Id`
ORDER BY total_sales DESC
LIMIT 10;


--------------------------------------------------------
-- 5. TOP CUSTOMERS BY PROFIT
--------------------------------------------------------
SELECT 
    `Order Customer Id`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Order Customer Id`
ORDER BY total_profit DESC
LIMIT 10;


--------------------------------------------------------
-- 6. CUSTOMER VALUE OVERVIEW
--------------------------------------------------------
SELECT 
    `Customer Segment`,
    ROUND(AVG(Sales), 2) AS avg_sales_per_order,
    ROUND(AVG(`Order Profit Per Order`), 2) AS avg_profit_per_order
FROM supply_chain
GROUP BY `Customer Segment`;
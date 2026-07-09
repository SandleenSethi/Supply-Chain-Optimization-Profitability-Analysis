/*
========================================================
PROJECT: Supply Chain Performance & Profitability Analysis
BLOCK 4: MARKET & REGIONAL PERFORMANCE ANALYSIS
AUTHOR: Sandleen
========================================================

PURPOSE:
This block analyzes geographical and market-level performance
to identify strongest and weakest regions/countries.
========================================================
*/

USE supply_chain_project;

--------------------------------------------------------
-- 1. SALES BY COUNTRY
--------------------------------------------------------
SELECT 
    `Order Country`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Order Country`
ORDER BY total_sales DESC;


--------------------------------------------------------
-- 2. PROFIT BY COUNTRY
--------------------------------------------------------
SELECT 
    `Order Country`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Order Country`
ORDER BY total_profit DESC;


--------------------------------------------------------
-- 3. SALES BY REGION
--------------------------------------------------------
SELECT 
    `Order Region`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Order Region`
ORDER BY total_sales DESC;


--------------------------------------------------------
-- 4. PROFIT BY REGION
--------------------------------------------------------
SELECT 
    `Order Region`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Order Region`
ORDER BY total_profit DESC;


--------------------------------------------------------
-- 5. MARKET PERFORMANCE (SALES + PROFIT)
--------------------------------------------------------
SELECT 
    Market,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY Market
ORDER BY total_sales DESC;


--------------------------------------------------------
-- 6. TOP 10 STATES BY SALES
--------------------------------------------------------
SELECT 
    `Order State`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Order State`
ORDER BY total_sales DESC
LIMIT 10;
/*
========================================================
PROJECT: Supply Chain Performance & Profitability Analysis
BLOCK 1: EXECUTIVE KPI ANALYSIS
AUTHOR: Sandleen
========================================================

PURPOSE:
This file contains key business KPIs used for executive
dashboard reporting in Power BI.

KPIs included:
1. Total Sales
2. Total Profit
3. Total Orders
4. Late Delivery Percentage
5. Profit Margin Percentage
========================================================
*/

-- Use database
USE supply_chain_project;

--------------------------------------------------------
-- 1. TOTAL SALES
--------------------------------------------------------
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain;


--------------------------------------------------------
-- 2. TOTAL PROFIT
--------------------------------------------------------
SELECT 
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain;


--------------------------------------------------------
-- 3. TOTAL ORDERS
--------------------------------------------------------
SELECT 
    COUNT(DISTINCT `Order Id`) AS total_orders
FROM supply_chain;


--------------------------------------------------------
-- 4. LATE DELIVERY PERCENTAGE
--------------------------------------------------------
SELECT 
    ROUND(
        (SUM(Late_delivery_risk) / COUNT(*)) * 100,
        2
    ) AS late_delivery_percentage
FROM supply_chain;


--------------------------------------------------------
-- 5. PROFIT MARGIN PERCENTAGE
--------------------------------------------------------
SELECT 
    ROUND(
        (SUM(`Order Profit Per Order`) / SUM(Sales)) * 100,
        2
    ) AS profit_margin_percentage
FROM supply_chain;
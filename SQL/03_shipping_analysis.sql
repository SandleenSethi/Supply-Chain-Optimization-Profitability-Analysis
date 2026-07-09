/*
========================================================
PROJECT: Supply Chain Performance & Profitability Analysis
BLOCK 3: SHIPPING & DELIVERY PERFORMANCE
AUTHOR: Sandleen
========================================================

PURPOSE:
This block analyzes delivery efficiency, shipping modes,
and late delivery patterns to identify operational issues.
========================================================
*/

USE supply_chain_project;

--------------------------------------------------------
-- 1. LATE DELIVERY RATE BY SHIPPING MODE
--------------------------------------------------------
SELECT 
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    SUM(Late_delivery_risk) AS late_orders,
    ROUND((SUM(Late_delivery_risk) / COUNT(*)) * 100, 2) AS late_delivery_percentage
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY late_delivery_percentage DESC;


--------------------------------------------------------
-- 2. AVERAGE SHIPPING DAYS (REAL vs SCHEDULED)
--------------------------------------------------------
SELECT 
    AVG(`Days for shipping (real)`) AS avg_actual_shipping_days,
    AVG(`Days for shipment (scheduled)`) AS avg_scheduled_shipping_days
FROM supply_chain;


--------------------------------------------------------
-- 3. DELIVERY STATUS DISTRIBUTION
--------------------------------------------------------
SELECT 
    `Delivery Status`,
    COUNT(*) AS total_orders
FROM supply_chain
GROUP BY `Delivery Status`
ORDER BY total_orders DESC;


--------------------------------------------------------
-- 4. LATE DELIVERY BY REGION
--------------------------------------------------------
SELECT 
    `Order Region`,
    COUNT(*) AS total_orders,
    SUM(Late_delivery_risk) AS late_orders,
    ROUND((SUM(Late_delivery_risk) / COUNT(*)) * 100, 2) AS late_delivery_percentage
FROM supply_chain
GROUP BY `Order Region`
ORDER BY late_delivery_percentage DESC;


--------------------------------------------------------
-- 5. SHIPPING PERFORMANCE IMPACT ON SALES
--------------------------------------------------------
SELECT 
    `Shipping Mode`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY total_sales DESC;
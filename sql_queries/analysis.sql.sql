
create database capstone_project;
use capstone_project;
-- Total Sales & Profit by Year
SELECT `Order Year`,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM superstore_cleaned
GROUP BY `Order Year`;

-- Top 10 Best-Selling Products
SELECT `Product Name`,
       SUM(Sales) AS Total_Sales
FROM superstore_cleaned
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 Highest Profit Products
SELECT `Product Name`,
       SUM(Profit) AS Total_Profit
FROM superstore_cleaned
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Loss Making Products
SELECT `Product Name`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY `Product Name`
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC;

-- Sales by Region
SELECT Region,
       ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_cleaned
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Profit vs Discount
SELECT Discount,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_cleaned
GROUP BY Discount
ORDER BY Discount;

-- Repeat Customers
SELECT `Customer ID`,
       `Customer Name`,
       COUNT(`Order ID`) AS Order_Count
FROM superstore_cleaned
GROUP BY `Customer ID`, `Customer Name`
HAVING Order_Count > 1
ORDER BY Order_Count DESC;
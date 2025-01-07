---------------------------------------CASE STUDY FOR EDA ELECTRONIC SALES DATA ANALYSIS-----------------------

                                          -----Sales Performance and Trends-------

----Pulling all the Data FROM THIS DATASET----

SELECT *
FROM [archive (6)]

----What were the total sales (revenue) for each month in 2023?----
-- Calculate total sales (revenue) for each month in 2023
SELECT  
    FORMAT(Purchase_Date, 'yyyy-MM-dd') AS Purchase_Date, -- Extract year, month, and day
    SUM(Total_Price) AS TotalRevenue,                   -- Total revenue for the day
    SUM(Quantity) AS TotalUnitsSold                    -- Total units sold for the day
FROM 
    [archive (6)]                                       -- Replace with your actual table name
WHERE 
    YEAR(Purchase_Date) = 2023                          -- Filter for records from the year 2023
GROUP BY 
    FORMAT(Purchase_Date, 'yyyy-MM-dd')                 -- Group by year, month, and day
ORDER BY 
    FORMAT(Purchase_Date, 'yyyy-MM-dd');                -- Order by year, month, and day

----What were the total sales (revenue) for each month in 2024?----
-- Calculate total sales (revenue) for each month in 2024
SELECT 
    FORMAT(Purchase_Date, 'yyyy-MM-dd') AS Purchase_Date, -- Extract year and month in YYYY-MM format
    SUM(Total_Price) AS TotalRevenue,         -- Total revenue for the month
    SUM(Quantity) AS TotalUnitsSold          -- Total units sold for the month
FROM 
    [archive (6)]                                 -- Replace with your actual table name
WHERE 
    YEAR(Purchase_Date) = 2024               -- Filter for records from the year 2023
GROUP BY 
    FORMAT(Purchase_Date, 'yyyy-MM-dd')          -- Group by year and month
ORDER BY 
    FORMAT(Purchase_Date, 'yyyy-MM-dd');         -- Order by year and month

	------Product Insights---

---Which product generated the most revenue over the year 2023?----
SELECT 
    Product_Type,                          -- Product name or type
    SUM(Total_Price) AS TotalRevenue       -- Total revenue for the product
FROM 
    [archive (6)]                          -- Replace with your actual table name
WHERE 
    YEAR(Purchase_Date) = 2023             -- Filter for records from the year 2023
GROUP BY 
    Product_Type                           -- Group by product type
ORDER BY 
    TotalRevenue DESC;                     -- Sort by revenue in descending order
	
---Which product generated the most revenue over the year 2024?----
SELECT 
    Product_Type,                          -- Product name or type
    SUM(Total_Price) AS TotalRevenue       -- Total revenue for the product
FROM 
    [archive (6)]                          -- Replace with your actual table name
WHERE 
    YEAR(Purchase_Date) = 2024             -- Filter for records from the year 2023
GROUP BY 
    Product_Type                           -- Group by product type
ORDER BY 
    TotalRevenue DESC;                     -- Sort by revenue in descending order

----What are the top-selling products by quantity? Are they also the most profitable?---
SELECT SUM(Quantity) AS Quantity, Product_Type
FROM [archive (6)]
GROUP BY Product_Type
ORDER BY Quantity
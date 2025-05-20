
CREATE TABLE online_sales (
    Product_ID INT,
    Sale_Date DATE,
    Sales_Rep VARCHAR(100),
    Region VARCHAR(100),
    Sales_Amount DECIMAL(10,2),
    Quantity_Sold INT,
    Product_Category VARCHAR(100),
    Unit_Cost DECIMAL(10,2),
    Unit_Price DECIMAL(10,2),
    Customer_Type VARCHAR(100),
    Discount DECIMAL(4,2),
    Payment_Method VARCHAR(100),
    Sales_Channel VARCHAR(100),
    Region_and_Sales_Rep VARCHAR(100)
);

INSERT INTO online_sales VALUES (1052, '2023-02-03', 'Bob', 'North', 5053.97, 18, 'Furniture', 152.75, 267.22, 'Returning', 0.09, 'Cash', 'Online', 'North-Bob');
INSERT INTO online_sales VALUES (1093, '2023-04-21', 'Bob', 'West', 4384.02, 17, 'Furniture', 3816.39, 4209.44, 'Returning', 0.11, 'Cash', 'Retail', 'West-Bob');
INSERT INTO online_sales VALUES (1015, '2023-09-21', 'David', 'South', 4631.23, 30, 'Food', 261.56, 371.4, 'Returning', 0.2, 'Bank Transfer', 'Retail', 'South-David');
INSERT INTO online_sales VALUES (1072, '2023-08-24', 'Bob', 'South', 2167.94, 39, 'Clothing', 4330.03, 4467.75, 'New', 0.02, 'Credit Card', 'Retail', 'South-Bob');
INSERT INTO online_sales VALUES (1061, '2023-03-24', 'Charlie', 'East', 3750.2, 13, 'Electronics', 637.37, 692.71, 'New', 0.08, 'Credit Card', 'Online', 'East-Charlie');
INSERT INTO online_sales VALUES (1021, '2023-02-11', 'Charlie', 'West', 3761.15, 32, 'Food', 900.79, 1106.51, 'New', 0.21, 'Cash', 'Online', 'West-Charlie');
INSERT INTO online_sales VALUES (1083, '2023-04-11', 'Bob', 'West', 618.31, 29, 'Furniture', 2408.81, 2624.09, 'Returning', 0.14, 'Cash', 'Online', 'West-Bob');
INSERT INTO online_sales VALUES (1087, '2023-01-06', 'Eve', 'South', 7698.92, 46, 'Furniture', 3702.51, 3964.65, 'New', 0.12, 'Bank Transfer', 'Online', 'South-Eve');
INSERT INTO online_sales VALUES (1075, '2023-06-29', 'David', 'South', 4223.39, 30, 'Furniture', 738.06, 1095.4499999999998, 'New', 0.05, 'Bank Transfer', 'Online', 'South-David');
INSERT INTO online_sales VALUES (1075, '2023-10-09', 'Charlie', 'West', 8239.58, 18, 'Clothing', 2228.35, 2682.34, 'New', 0.13, 'Bank Transfer', 'Online', 'West-Charlie');


-- 1. Monthly Revenue and Order Volume
SELECT
  EXTRACT(YEAR FROM Sale_Date) AS sale_year,
  EXTRACT(MONTH FROM Sale_Date) AS sale_month,
  SUM(Sales_Amount) AS total_revenue,
  COUNT(*) AS order_volume
FROM
   `sales_data (1)`
GROUP BY
  sale_year, sale_month
ORDER BY
  sale_year, sale_month;

-- 2. Top 3 Months by Revenue
SELECT
  EXTRACT(YEAR FROM Sale_Date) AS sale_year,
  EXTRACT(MONTH FROM Sale_Date) AS sale_month,
  SUM(Sales_Amount) AS total_revenue
FROM  `sales_data (1)`
GROUP BY
  sale_year, sale_month
ORDER BY
  total_revenue DESC
LIMIT 50;

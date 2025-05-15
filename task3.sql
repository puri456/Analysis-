USE task3;

-- Select customer ID, gender, and net amount for male customers, ordered by amount spent
SELECT CID, Gender, `Net Amount`
FROM project1_df
WHERE Gender = 'Male'
ORDER BY `Net Amount` DESC
LIMIT 1000;


-- Group by Age Group and get average Net Amount
SELECT `Age Group`, AVG(`Net Amount`) AS avg_spending
FROM project1_df
GROUP BY `Age Group`;



CREATE TABLE discount_campaigns (
  `Discount Name` VARCHAR(50),
  Campaign_Type VARCHAR(50)
);

-- Insert example values
INSERT INTO discount_campaigns VALUES 
('FESTIVE50', 'Festival'),
('WELCOME5', 'Welcome'),
('SEASONALOFFER21', 'Seasonal');

-- INNER JOIN
SELECT df.CID, df.`Discount Name`, dc.Campaign_Type
FROM project1_df df
INNER JOIN discount_campaigns dc
  ON df.`Discount Name` = dc.`Discount Name`;

-- LEFT JOIN
SELECT df.CID, df.`Discount Name`, dc.Campaign_Type
FROM project1_df df
LEFT JOIN discount_campaigns dc
  ON df.`Discount Name` = dc.`Discount Name`;
  
  -- SubQueries
SELECT CID, `Net Amount`
FROM project1_df
WHERE `Net Amount` > (
  SELECT AVG(`Net Amount`) FROM project1_df
);

-- Total Discount Amount by Location
SELECT Location, SUM(`Discount Amount (INR)`) AS total_discount
FROM project1_df
GROUP BY Location;

-- Average Gross Amount by Product Category
SELECT `Product Category`, AVG(`Gross Amount`) AS avg_gross
FROM project1_df
GROUP BY `Product Category`;

-- Index on Gender to speed up filtering
CREATE INDEX idx_gender ON project1_df (Gender(10));

-- Index on Discount Name for faster joins
CREATE INDEX idx_discount_name ON project1_df (`Discount Name`(20));

-- High-value customers view
CREATE VIEW High_Value_Customers AS
SELECT CID, SUM(`Net Amount`) AS total_spent
FROM project1_df
GROUP BY CID
HAVING total_spent > 5000;






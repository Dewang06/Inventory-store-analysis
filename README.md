
# :zap: Inventory Store Analysis using MySQL

The aim of this project is to create an inventory system and insert data into it and write about 15-20 queries to find meaningful insights about the products in the inventory and about its suppliers, purchases made and orders received from the customers.

## 🔧 Tools and Technologies Used

:dolphin: **MySQL:** MySQL is an open-source relational database management system (RDBMS) that is widely used for managing and organizing structured data. 

:page_facing_up: **Microsoft Word:** Microsoft Word is a word processing application developed by Microsoft.

## 🚀 Project Workflow

1. Creating table in Mysql

2. Inserting data into the tables

3. Form questions based on the tables and the relationships between them

4. Writing queries to gain meaningful insights
## Screenshots

![dfd_diagram](https://github.com/Dewang06/Inventory-store-analysis/assets/91787570/997eab33-dd17-42f7-ad4b-6df19d00706c)


## :bomb: Top Questions and insights

- Q11 Show highest selling product in each month in the year 2022. Name, month, no.

SELECT p.`ProductLabel`, `NumberShipped` AS `MaxNumberShipped`, date_format(o.`OrderDate`, '%b') AS `date(2022)`  
 FROM `orders` o JOIN `products` p  
ON o.`ProductId` = p.`id`
WHERE YEAR(`OrderDate`) = 2022 AND  
`NumberShipped` IN (SELECT MAX(`NumberShipped`) FROM `ORDERS` 
					WHERE YEAR(`orderdate`) = 2022 
					GROUP BY MONTH(`OrderDate`));  

***** INSIGHTS *****  
By knowing the most sold product in each month we can focus on improving marketing for products of same type for that particular month.

- Q9 Show all the LG, Nokia and Asus products purchased and their quantity.
SELECT pd.`ProductLabel`, p.`NumberReceived`,  
CASE  
WHEN `NumberReceived` >= 100 THEN 'High'  
WHEN `NumberReceived` >= 50 THEN 'Good'  
WHEN `NumberReceived` > 0 THEN 'Low'  
END AS `purchaseRating`  
FROM `products` pd JOIN `purchases` p  
ON pd.`id` = p.`ProductId`  
WHERE `ProductLabel` REGEXP '^lg|^nokia|^asus'  
ORDER BY `ProductLabel`;  

***** INSIGHTS *****
Hence purchases made for both these products is good based on purchase rating.

- Q18 No of products supplied for all quarters of 2022 by suppliers.
SELECT SUM(`NumberReceived`) AS `TotalPurchases`, CONCAT("Q", QUARTER(`PurchaseDate`), " ", YEAR(`PurchaseDate`)) AS `quarter`   
FROM `purchases`  
WHERE YEAR(`PurchaseDate`) = 2022  
GROUP BY QUARTER(`PurchaseDate`), `quarter`;  

***** INSIGHTS *****
It shows the trends of each quarter in 2022 where purchase size was increased or decreased.

- Q5 Show all products purchaced in 2022 and 2023 from earliest to latest. Show products and number received, date.
SELECT pd.`ProductLabel`, p.`NumberReceived`, date_format(`PurchaseDate`, '%D %b %Y') AS DATE  
FROM `products` pd JOIN `purchases` p  
ON pd.`Id` = p.`ProductId`  
WHERE YEAR(`PurchaseDate`) IN (2022, 2023)  
ORDER BY YEAR(`PurchaseDate`), MONTH(`PurchaseDate`);  

***** INSIGHTS *****
We can see that the products purchased is showing a declining trend from 2022 to 2023.

- Q4 Fetch all orders placed in Q2 of 2021 ordered by months. Show product label, date.
SELECT p.`ProductLabel`, date_format(o.`OrderDate`, '%D %b, %Y') AS `Q2_Dates`  
FROM `orders` o JOIN `products` p  
ON o.`ProductId` = p.`id`  
WHERE QUARTER(`OrderDate`) = 2 AND YEAR(`OrderDate`) = 2021  
ORDER BY MONTH(`OrderDate`);  

***** INSIGHTS *****
We got all products sold in quarter 2 i.e. Apr-June of 2021 as it was lockdown we got to know what products interested customers the most.





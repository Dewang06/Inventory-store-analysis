create database if not exists inventory_db;
use inventory_db;



-- ************************************* CREATE TABLE SECTION *************************************
-- Supplier table
create table if not exists suppliers (
	id int not null primary key,
    supplier varchar(100) not null
);


-- Products table
create table if not exists products (
	id int not null primary key,
    ProductName varchar(100) not null,
    PartNumber varchar(100) not null,
    ProductLabel varchar(100) not null,
    StartingInventory int not null default 1,
    InventoryReceived int default 0,
    InventoryShipped int default 0,
    InventoryOnHand int default 0,
    MinimumRequired int default 1,
    check(MinimumRequired <= StartingInventory + InventoryReceived),
    check(InventoryOnHand = StartingInventory + InventoryReceived - InventoryShipped)
);


-- Orders table
create table if not exists orders (
	id int not null primary key,
    Title varchar(100) not null,
    First varchar(100) not null,
    Middle varchar(100),
    Last varchar(100) not null,
    ProductId int not null,
    NumberShipped int not null,
    OrderDate date not null,
    foreign key (ProductId) references products (id)
);


-- Purchases
create table if not exists purchases (
	id int not null primary key,
    SupplierId int not null,
    ProductId int not null,
    NumberReceived int not null,
    PurchaseDate date not null,
    foreign key (SupplierId) references suppliers (id),
    foreign key (ProductId) references products (id)
);



-- ************************************* INSERT TABLE SECTION *************************************
-- Suppliers - Total 5 records
INSERT INTO suppliers (id, supplier)
VALUES
    (1, 'PhoneTech'),
    (2, 'MobileMasters'),
    (3, 'GadgetCo'),
    (4, 'TechWidgets'),
    (5, 'SmartDevices');


-- Products - Total 75 records
INSERT INTO products (id, ProductName, PartNumber, ProductLabel, StartingInventory, InventoryReceived, InventoryShipped, InventoryOnHand, MinimumRequired)
VALUES
    (1, 'Dell Server', 'XP 2000', 'Dell Server- XP 2000', 10, 2, 1, 11, 5),
    (2, 'HP Laptop', 'Win10', 'HP Laptop- Win10', 8, 4, 2, 10, 3),
    (3, 'Samsung TV', '4K42', 'Samsung TV- 4K42', 15, 5, 3, 17, 7),
    (4, 'Canon Camera', 'EOS1K', 'Canon Camera- EOS1K', 7, 3, 1, 9, 4),
    (5, 'Sony Headphones', 'MDR75', 'Sony Headphones- MDR75', 20, 6, 4, 22, 8),
    (6, 'LG Monitor', 'HD22', 'LG Monitor- HD22', 11, 2, 1, 12, 5),
    (7, 'Asus Laptop', 'W10P', 'Asus Laptop- W10P', 18, 3, 2, 19, 6),
    (8, 'Nikon Camera', 'DSLR1', 'Nikon Camera- DSLR1', 12, 4, 3, 13, 7),
    (9, 'Apple iPhone', 'XSMax', 'Apple iPhone- XSMax', 25, 6, 3, 28, 10),
    (10, 'Toshiba Laptop', 'Win8', 'Toshiba Laptop- Win8', 14, 3, 2, 15, 6),
    (11, 'Acer Monitor', 'LED24', 'Acer Monitor- LED24', 9, 2, 1, 10, 5),
    (12, 'Nokia Phone', 'Lumia9', 'Nokia Phone- Lumia9', 6, 2, 1, 7, 3),
    (13, 'Lenovo Laptop', 'Win7', 'Lenovo Laptop- Win7', 16, 5, 3, 18, 8),
    (14, 'Sony TV', 'HD50', 'Sony TV- HD50', 13, 3, 1, 15, 6),
    (15, 'Google Pixel', '4XL', 'Google Pixel- 4XL', 11, 2, 1, 12, 5),
    (16, 'Xiaomi Phone', 'Mi11', 'Xiaomi Phone- Mi11', 19, 4, 2, 21, 7),
    (17, 'Dell Laptop', 'Win11', 'Dell Laptop- Win11', 8, 2, 1, 9, 5),
    (18, 'Canon Printer', 'PixMA1', 'Canon Printer- PixMA1', 22, 5, 3, 24, 8),
    (19, 'Samsung Tablet', 'TabA', 'Samsung Tablet- TabA', 10, 2, 1, 11, 6),
    (20, 'LG Refrigerator', 'Fridge1', 'LG Refrigerator- Fridge1', 16, 4, 2, 18, 7),
    (21, 'Microsoft Surface', 'Surface2020', 'Microsoft Surface- Surface2020', 10, 2, 1, 11, 5),
    (22, 'Lenovo ThinkPad', 'ThinkPadX1', 'Lenovo ThinkPad- ThinkPadX1', 8, 4, 2, 10, 3),
    (23, 'LG OLED TV', 'OLED55', 'LG OLED TV- OLED55', 15, 5, 3, 17, 7),
    (24, 'Sony Camera', 'Alpha500', 'Sony Camera- Alpha500', 7, 3, 1, 9, 4),
    (25, 'HP Printer', 'LaserJetPro', 'HP Printer- LaserJetPro', 20, 6, 4, 22, 8),
    (26, 'Acer Chromebook', 'ChromebookC7', 'Acer Chromebook- ChromebookC7', 11, 2, 1, 12, 5),
    (27, 'Samsung Galaxy', 'GalaxyS21', 'Samsung Galaxy- GalaxyS21', 18, 3, 2, 19, 6),
    (28, 'Asus Router', 'RouterAC1900', 'Asus Router- RouterAC1900', 12, 4, 3, 13, 7),
    (29, 'LG Washing Machine', 'WasherX3', 'LG Washing Machine- WasherX3', 25, 6, 3, 28, 10),
    (30, 'Dell Desktop', 'Inspiron5000', 'Dell Desktop- Inspiron5000', 14, 3, 2, 15, 6),
    (31, 'Canon Scanner', 'ScanM200', 'Canon Scanner- ScanM200', 9, 2, 1, 10, 5),
    (32, 'Nokia Smartphone', 'Lumia2020', 'Nokia Smartphone- Lumia2020', 6, 2, 1, 7, 3),
    (33, 'Sony Smart TV', 'SmartTV55', 'Sony Smart TV- SmartTV55', 16, 5, 3, 18, 8),
    (34, 'Google Home', 'HomeMini', 'Google Home- HomeMini', 13, 3, 1, 15, 6),
    (35, 'Samsung Refrigerator', 'Fridge2022', 'Samsung Refrigerator- Fridge2022', 11, 2, 1, 12, 5),
    (36, 'HP Monitor', 'Monitor27', 'HP Monitor- Monitor27', 19, 4, 2, 21, 7),
    (37, 'Dell Keyboard', 'KeyboardPro', 'Dell Keyboard- KeyboardPro', 8, 2, 1, 9, 5),
    (38, 'Acer Tablet', 'TabletA10', 'Acer Tablet- TabletA10', 22, 5, 3, 24, 8),
    (39, 'Sony Projector', 'Projector1080', 'Sony Projector- Projector1080', 10, 2, 1, 11, 6),
    (40, 'LG Microwave', 'Microwave900', 'LG Microwave- Microwave900', 16, 4, 2, 18, 7),
    (41, 'Dell Laptop', 'LaptopX1', 'Dell Laptop- LaptopX1', 14, 3, 2, 15, 6),
    (42, 'HP Printer', 'PrintJet500', 'HP Printer- PrintJet500', 12, 4, 3, 13, 7),
    (43, 'Samsung Galaxy', 'GalaxyS22', 'Samsung Galaxy- GalaxyS22', 17, 5, 3, 19, 8),
    (44, 'Asus Router', 'RouterAC2100', 'Asus Router- RouterAC2100', 9, 2, 1, 10, 5),
    (45, 'LG Microwave', 'Microwave950', 'LG Microwave- Microwave950', 20, 6, 4, 22, 8),
    (46, 'Sony Headphones', 'Headset200', 'Sony Headphones- Headset200', 13, 2, 1, 14, 6),
    (47, 'Acer Monitor', 'Monitor24', 'Acer Monitor- Monitor24', 8, 3, 2, 9, 4),
    (48, 'Canon Camera', 'CameraX3', 'Canon Camera- CameraX3', 18, 4, 3, 19, 7),
    (49, 'Lenovo Laptop', 'LaptopY1', 'Lenovo Laptop- LaptopY1', 11, 2, 1, 12, 5),
    (50, 'Nokia Phone', 'PhoneZ9', 'Nokia Phone- PhoneZ9', 19, 5, 4, 20, 7),
    (51, 'Sony TV', 'TV2000', 'Sony TV- TV2000', 10, 3, 2, 11, 6),
    (52, 'HP Laptop', 'Laptop2023', 'HP Laptop- Laptop2023', 16, 4, 2, 18, 7),
    (53, 'Acer Chromebook', 'ChromebookC9', 'Acer Chromebook- ChromebookC9', 14, 3, 2, 15, 6),
    (54, 'Samsung Tablet', 'TabletTabX', 'Samsung Tablet- TabletTabX', 21, 6, 3, 24, 9),
    (55, 'Microsoft Surface', 'Surface2025', 'Microsoft Surface- Surface2025', 12, 4, 3, 13, 7),
    (56, 'Dell Desktop', 'DesktopD1', 'Dell Desktop- DesktopD1', 9, 3, 2, 10, 5),
    (57, 'Google Pixel', 'Pixel5', 'Google Pixel- Pixel5', 20, 6, 4, 22, 8),
    (58, 'Sony Smart TV', 'SmartTV65', 'Sony Smart TV- SmartTV65', 16, 3, 2, 17, 7),
    (59, 'LG Refrigerator', 'Fridge2025', 'LG Refrigerator- Fridge2025', 14, 4, 3, 15, 6),
    (60, 'Nikon Camera', 'CameraD5500', 'Nikon Camera- CameraD5500', 18, 5, 4, 19, 7),
    (61, 'Toshiba Laptop', 'LaptopT1', 'Toshiba Laptop- LaptopT1', 11, 3, 2, 12, 6),
    (62, 'Sony Camera', 'CameraS4', 'Sony Camera- CameraS4', 14, 4, 3, 15, 7),
    (63, 'Asus Laptop', 'LaptopA3', 'Asus Laptop- LaptopA3', 16, 5, 3, 18, 8),
    (64, 'Nokia Phone', 'PhoneN10', 'Nokia Phone- PhoneN10', 9, 2, 1, 10, 5),
    (65, 'Canon Printer', 'PrinterC1', 'Canon Printer- PrinterC1', 21, 6, 4, 23, 7),
    (66, 'Samsung Tablet', 'TabletS7', 'Samsung Tablet- TabletS7', 13, 3, 2, 14, 6),
    (67, 'Microsoft Surface', 'SurfaceS3', 'Microsoft Surface- SurfaceS3', 19, 4, 3, 20, 7),
    (68, 'Dell Desktop', 'DesktopD3', 'Dell Desktop- DesktopD3', 10, 2, 1, 11, 6),
    (69, 'Google Pixel', 'Pixel4A', 'Google Pixel- Pixel4A', 20, 5, 3, 22, 8),
    (70, 'Sony Smart TV', 'SmartTV55', 'Sony Smart TV- SmartTV55', 15, 3, 2, 16, 7),
    (71, 'LG Refrigerator', 'FridgeL9', 'LG Refrigerator- FridgeL9', 12, 4, 3, 13, 6),
    (72, 'Nikon Camera', 'CameraN9', 'Nikon Camera- CameraN9', 18, 5, 4, 19, 7),
    (73, 'LG Microwave', 'MicrowaveM7', 'LG Microwave- MicrowaveM7', 14, 3, 2, 15, 6),
    (74, 'HP Monitor', 'MonitorH2', 'HP Monitor- MonitorH2', 16, 4, 3, 17, 8),
    (75, 'Dell Keyboard', 'KeyboardD7', 'Dell Keyboard- KeyboardD7', 9, 2, 1, 10, 5);


-- Orders - Total 80 records
INSERT INTO orders (id, Title, First, Middle, Last, ProductId, NumberShipped, OrderDate)
VALUES
    (1, 'Mr.', 'Aarav', 'Kumar', 'Singh', 3, 85, '2021-08-12'),
    (2, 'Ms.', 'Aditi', 'Neha', 'Sharma', 19, 42, '2020-11-24'),
    (3, 'Mr.', 'Vikram', 'S.', 'Yadav', 28, 36, '2023-04-03'),
    (4, 'Mrs.', 'Ananya', 'Rani', 'Mishra', 39, 75, '2022-06-19'),
    (5, 'Dr.', 'Rahul', 'Gupta', 'Chopra', 52, 51, '2021-03-15'),
    (6, 'Mr.', 'Ravi', 'Kumar', 'Verma', 5, 63, '2022-07-05'),
    (7, 'Ms.', 'Pooja', 'Anjali', 'Gandhi', 10, 78, '2021-04-14'),
    (8, 'Mr.', 'Vishal', 'R.', 'Mehra', 25, 45, '2023-02-18'),
    (9, 'Mrs.', 'Priya', 'Sunita', 'Patel', 18, 60, '2020-11-29'),
    (10, 'Dr.', 'Sanjay', 'Rajesh', 'Kapoor', 6, 32, '2022-08-21'),
    (11, 'Ms.', 'Meera', 'Preeti', 'Shukla', 3, 95, '2020-10-16'),
    (12, 'Mr.', 'Rajat', 'Mohan', 'Singh', 42, 21, '2021-07-03'),
    (13, 'Mrs.', 'Neha', 'Ankita', 'Yadav', 15, 77, '2022-03-11'),
    (14, 'Mr.', 'Amit', 'Sunil', 'Sharma', 12, 88, '2023-05-27'),
    (15, 'Dr.', 'Sunita', 'Manju', 'Gupta', 29, 40, '2021-09-28'),
    (16, 'Ms.', 'Sapna', 'Neeru', 'Kumar', 52, 68, '2020-12-09'),
    (17, 'Mr.', 'Manish', 'Vishwas', 'Chopra', 7, 54, '2022-01-17'),
    (18, 'Mrs.', 'Ritu', 'Priyanka', 'Mishra', 16, 87, '2023-03-30'),
    (19, 'Mr.', 'Vivek', 'Akash', 'Pandey', 38, 35, '2021-12-06'),
    (20, 'Ms.', 'Sneha', 'Suman', 'Verma', 22, 50, '2020-08-14'),
    (21, 'Mr.', 'Alok', 'Manish', 'Sharma', 47, 70, '2023-04-20'),
    (22, 'Mrs.', 'Poonam', 'Arti', 'Srivastava', 19, 39, '2022-02-03'),
    (23, 'Mr.', 'Dinesh', 'Kishore', 'Agarwal', 33, 56, '2020-10-11'),
    (24, 'Ms.', 'Rashmi', 'Nisha', 'Verma', 44, 49, '2021-06-28'),
    (25, 'Dr.', 'Sudhir', 'Rajesh', 'Gupta', 23, 73, '2023-01-15'),
    (26, 'Mr.', 'Alok', 'Suresh', 'Kumar', 2, 85, '2022-07-10'),
    (27, 'Ms.', 'Neha', 'Rani', 'Sharma', 7, 49, '2021-04-25'),
    (28, 'Mr.', 'Rajesh', 'Mohan', 'Verma', 15, 38, '2020-11-14'),
    (29, 'Mrs.', 'Pooja', 'Kumari', 'Singh', 30, 72, '2023-03-19'),
    (30, 'Dr.', 'Priyanka', 'Amit', 'Gupta', 17, 62, '2022-08-05'),
    (31, 'Mr.', 'Manish', 'Arun', 'Kapoor', 28, 95, '2021-09-12'),
    (32, 'Ms.', 'Anjali', 'Meera', 'Yadav', 11, 54, '2022-05-21'),
    (33, 'Mr.', 'Sudhir', 'Deepak', 'Shukla', 4, 77, '2020-10-16'),
    (34, 'Mrs.', 'Aarti', 'Preeti', 'Sharma', 36, 82, '2023-04-03'),
    (35, 'Dr.', 'Vivek', 'Suman', 'Kumar', 24, 45, '2021-11-18'),
    (36, 'Ms.', 'Neeru', 'Manju', 'Singh', 6, 32, '2022-01-10'),
    (37, 'Mr.', 'Rahul', 'Ramesh', 'Chopra', 3, 68, '2021-05-17'),
    (38, 'Mrs.', 'Arti', 'Akanksha', 'Mishra', 19, 43, '2023-02-28'),
    (39, 'Mr.', 'Vikas', 'Kishore', 'Yadav', 10, 58, '2020-12-15'),
    (40, 'Ms.', 'Nisha', 'Arti', 'Sharma', 21, 37, '2022-07-01'),
    (41, 'Mr.', 'Ravi', 'Sandeep', 'Kapoor', 48, 91, '2023-03-10'),
    (42, 'Mrs.', 'Poonam', 'Renu', 'Mishra', 33, 74, '2021-10-19'),
    (43, 'Mr.', 'Amit', 'Akash', 'Gandhi', 5, 64, '2020-08-12'),
    (44, 'Dr.', 'Sunita', 'Sunil', 'Verma', 13, 53, '2022-04-05'),
    (45, 'Ms.', 'Rashmi', 'Neha', 'Agarwal', 23, 46, '2021-06-28'),
    (46, 'Mr.', 'Rajesh', 'Kumar', 'Gupta', 41, 77, '2022-03-20'),
    (47, 'Ms.', 'Neha', 'Verma', 'Yadav', 9, 48, '2020-09-12'),
    (48, 'Mr.', 'Suresh', 'Amit', 'Sharma', 31, 55, '2023-01-05'),
    (49, 'Mrs.', 'Preeti', 'Nisha', 'Mishra', 21, 63, '2021-07-10'),
    (50, 'Dr.', 'Amit', 'Manish', 'Verma', 16, 37, '2022-05-25'),
    (51, 'Mr.', 'Rahul', 'Deepak', 'Shukla', 6, 91, '2021-11-14'),
    (52, 'Ms.', 'Anjali', 'Suman', 'Kumar', 27, 42, '2023-03-19'),
    (53, 'Mr.', 'Sanjay', 'Akash', 'Chopra', 12, 65, '2020-08-15'),
    (54, 'Mrs.', 'Aarti', 'Arti', 'Singh', 38, 88, '2022-04-10'),
    (55, 'Dr.', 'Manish', 'Ravi', 'Sharma', 49, 75, '2021-09-02'),
    (56, 'Ms.', 'Sapna', 'Rani', 'Yadav', 44, 56, '2022-01-25'),
    (57, 'Mr.', 'Vikas', 'Alok', 'Mishra', 22, 32, '2023-02-03'),
    (58, 'Mrs.', 'Sunita', 'Ritu', 'Gandhi', 35, 84, '2020-12-29'),
    (59, 'Mr.', 'Alok', 'Sudhir', 'Kapoor', 23, 71, '2021-06-18'),
    (60, 'Ms.', 'Neeru', 'Sandeep', 'Verma', 10, 98, '2022-03-12'),
    (61, 'Mr.', 'Vivek', 'Ramesh', 'Agarwal', 47, 63, '2020-11-19'),
    (62, 'Mrs.', 'Poonam', 'Akanksha', 'Gupta', 9, 55, '2023-04-01'),
    (63, 'Mr.', 'Dinesh', 'Kishore', 'Sharma', 30, 46, '2021-10-06'),
    (64, 'Ms.', 'Rashmi', 'Suman', 'Mishra', 33, 81, '2022-07-05'),
    (65, 'Dr.', 'Sudhir', 'Arti', 'Kumar', 21, 39, '2021-04-14'),
    (66, 'Mr.', 'Rajesh', 'Kumar', 'Gupta', 38, 250, '2022-11-15'),
    (67, 'Ms.', 'Neha', 'Arti', 'Yadav', 5, 120, '2021-10-02'),
    (68, 'Mr.', 'Suresh', 'Amit', 'Sharma', 13, 180, '2023-03-20'),
    (69, 'Mrs.', 'Preeti', 'Nisha', 'Mishra', 26, 150, '2020-12-05'),
    (70, 'Dr.', 'Amit', 'Manish', 'Verma', 44, 190, '2022-09-15'),
    (71, 'Mr.', 'Rahul', 'Deepak', 'Shukla', 7, 280, '2021-05-30'),
    (72, 'Ms.', 'Anjali', 'Suman', 'Kumar', 15, 220, '2022-01-25'),
    (73, 'Mr.', 'Sanjay', 'Akash', 'Chopra', 33, 160, '2023-04-03'),
    (74, 'Mrs.', 'Aarti', 'Rani', 'Singh', 10, 130, '2021-07-14'),
    (75, 'Dr.', 'Manish', 'Ravi', 'Sharma', 25, 270, '2022-03-05'),
    (76, 'Ms.', 'Sapna', 'Ritu', 'Yadav', 42, 200, '2021-09-18'),
    (77, 'Mr.', 'Vikas', 'Sudhir', 'Gandhi', 18, 240, '2022-05-21'),
    (78, 'Mrs.', 'Sunita', 'Akanksha', 'Kapoor', 29, 280, '2020-11-14'),
    (79, 'Mr.', 'Alok', 'Kishore', 'Mishra', 6, 150, '2023-02-02'),
    (80, 'Ms.', 'Neeru', 'Sandeep', 'Agarwal', 52, 210, '2022-12-10');


-- Purchases - Total 20 records
INSERT INTO purchases (id, SupplierId, ProductId, NumberReceived, PurchaseDate)
VALUES
    (1, 1001, 3, 25, '2023-10-15'),
    (2, 1002, 18, 42, '2022-10-16'),
    (3, 1003, 33, 30, '2023-10-17'),
    (4, 1004, 47, 15, '2021-10-18'),
    (5, 1005, 62, 20, '2020-10-19'),
    (6, 1001, 6, 150, '2022-05-15'),
    (7, 1002, 20, 120, '2021-09-16'),
    (8, 1003, 35, 180, '2020-12-17'),
    (9, 1004, 49, 110, '2023-02-18'),
    (10, 1005, 64, 200, '2022-07-19'),
    (11, 1001, 12, 70, '2022-08-12'),
    (12, 1002, 25, 130, '2021-04-14'),
    (13, 1003, 38, 190, '2023-03-10'),
    (14, 1004, 51, 80, '2020-10-10'),
    (15, 1005, 63, 220, '2021-12-20'),
    (16, 1001, 7, 250, '2022-01-15'),
    (17, 1002, 19, 110, '2021-10-28'),
    (18, 1003, 32, 180, '2020-11-15'),
    (19, 1004, 45, 150, '2023-02-25'),
    (20, 1005, 59, 120, '2022-07-08');



-- ************************************* MAIN QUERY SECTION *************************************

-- Q1 Select products which are not ordered at all in ascending order of id. Show product Label, product id.
SELECT `ProductLabel`, `id`
FROM `products`
WHERE `id` NOT IN (SELECT `ProductId` FROM `orders`)
ORDER BY `id`;
-- ***** INSIGHTS *****
-- Here we get to know about the products which are not being order hence we can conclude that 
-- these products are loss making so they can be removed from the inventory or reduce their quantities or can be marketed better.


-- Q2 Fetch top 5 most sold products in 2023. Show first name, last name, numbershipped, orderdate, productLabel.
SELECT o.`First`, o.`Last`, o.`NumberShipped`, o.`OrderDate`, `ProductLabel`
FROM `orders` o JOIN `products` p
ON 	o.`ProductId` = p.`id`
WHERE YEAR(o.`OrderDate`) = 2023
ORDER BY `NumberShipped` DESC
LIMIT 5;
-- ***** INSIGHTS *****
-- These are our top 5 valuable customers in the year 2023 along with the products they ordered.
-- We can provide them some concession for the same products which will improve the product popularity as well as customer satisfaction.
 

-- Q3 Fetch top supplier of products. Show supplier and total number received.
SELECT s.`id`, s.`supplier`, sum(p.`NumberReceived`) AS `totalQuantitySupplied`
FROM `suppliers` s JOIN `purchases` p
ON s.`id` = p.`SupplierId`
GROUP BY s.`supplier`, s.`id`
ORDER BY `totalQuantitySupplied` DESC
LIMIT 1;
-- ***** INSIGHTS *****
-- We get our top supplier. This shows they are the most important business partner.


-- Q4 Fetch all orders placed in Q2 of 2021 ordered by months. Show product label, date.
SELECT p.`ProductLabel`, date_format(o.`OrderDate`, '%D %b, %Y') AS `Q2_Dates`
FROM `orders` o JOIN `products` p
ON o.`ProductId` = p.`id`
WHERE QUARTER(`OrderDate`) = 2 AND YEAR(`OrderDate`) = 2021
ORDER BY MONTH(`OrderDate`);
-- ***** INSIGHTS *****
-- We got all products sold in quarter 2 i.e. Apr-June of 2021 as it was lockdown we got to know what products interested customers the most.


-- Q5 Show all products purchaced in 2022 and 2023 from earliest to latest. Show products and number received, date.
SELECT pd.`ProductLabel`, p.`NumberReceived`, date_format(`PurchaseDate`, '%D %b %Y') AS DATE
FROM `products` pd JOIN `purchases` p
ON pd.`Id` = p.`ProductId`
WHERE YEAR(`PurchaseDate`) IN (2022, 2023)
ORDER BY YEAR(`PurchaseDate`), MONTH(`PurchaseDate`);
-- ***** INSIGHTS *****
-- We can see that the products purchased is showing a declining trend from 2022 to 2023.


-- Q6 Show Average no of products supplied by each supplier in descending order. Show supplier and no received.
SELECT s.`supplier`, ROUND(AVG(p.`NumberReceived`), 2) AS `totalQuantityPurchases`
FROM `suppliers` s JOIN `purchases` p
ON s.`id` = p.`SupplierId`
GROUP BY s.`supplier`
ORDER BY `totalQuantityPurchases` DESC, s.`supplier`;
-- ***** INSIGHTS *****
-- We can see that the average products supplied which shows importance of each supplier .


-- Q7 Show Orders in FY2022-23 as top product as Best, Good, Low. Show product name, no shipped, top product.
SELECT p.`ProductLabel`, o.`NumberShipped`,
CASE
WHEN `NumberShipped` >= 100 THEN 'Best'
WHEN `NumberShipped` >= 50 THEN 'Good'
WHEN `NumberShipped` > 0 THEN 'Least'
END AS `productRating`
FROM `orders` o JOIN `products` p
ON o.`ProductId` = p.`id`
WHERE `OrderDate` BETWEEN '2022-04-01' AND '2023-03-31'
ORDER BY `NumberShipped` DESC;
-- ***** INSIGHTS *****
-- We can see the products sold in FY2022-23 and based on product rating the sales are overall balanced.


-- Q8 Show 5 least purchaced in FY2022-23 as top purchases as Best, Good, Low. . Show product name, date, no of products received.
SELECT pd.`ProductLabel`, p.`PurchaseDate`, p.`NumberReceived`,
CASE
WHEN `NumberReceived` >= 100 THEN 'High'
WHEN `NumberReceived` >= 50 THEN 'Good'
WHEN `NumberReceived` > 0 THEN 'Low'
END AS `purchaseRating`
FROM `products` pd JOIN `purchases` p
ON pd.`id` = p.`ProductId`
WHERE p.`PurchaseDate` BETWEEN '2022-04-01' AND '2023-03-31'
ORDER BY `NumberReceived`
LIMIT 5;
-- ***** INSIGHTS *****
-- We can see the least purchased in FY2022-23 as we can see from the purchase rating the purchasing power is strong.


-- Q9 Show all the LG, Nokia and Asus products purchased and their quantity.
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
-- ***** INSIGHTS *****
-- Hence purchases made for both these products is good based on purchase rating.


-- Q10 Show total sales made in the year 2020 and 2021 for each product type.
SELECT P.`ProductName`, sum(O.`NumberShipped`) as `totalShipped`
FROM `orders` o JOIN `products` p
ON o.`ProductId` = p.`id`
WHERE YEAR(O.`OrderDate`) IN (2020, 2021)
GROUP BY `ProductName`
ORDER BY `totalShipped` DESC;
-- ***** INSIGHTS *****
-- Sales made for each product shows important types.


-- Q11 Show highest selling product in each month in the year 2022. Name, month, no.
SELECT p.`ProductLabel`, `NumberShipped` AS `MaxNumberShipped`, date_format(o.`OrderDate`, '%b') AS `date(2022)`
FROM `orders` o JOIN `products` p
ON o.`ProductId` = p.`id`
WHERE YEAR(`OrderDate`) = 2022 AND 
`NumberShipped` IN (SELECT MAX(`NumberShipped`) FROM `ORDERS` 
					WHERE YEAR(`orderdate`) = 2022 
					GROUP BY MONTH(`OrderDate`))
ORDER BY MONTH(`OrderDate`);
-- ***** INSIGHTS *****
-- By knowing the most sold product in each month we can focus on improving marketing for products of same type for that particular month.


-- Q12 Show all products and total no of orders shipped, most sold order and order count for each product type ordered by product name.
SELECT p.`ProductName`, SUM(`NumberShipped`) AS `TotalShippment`, max(`NumberShipped`) AS `MaxPerOrder`, count(`NumberShipped`) AS `OrdersPlaced`
FROM `products` p LEFT JOIN `orders` o
ON o.`ProductId` = p.`id`
GROUP BY p.`ProductName`
ORDER BY P.`ProductName`;
-- ***** INSIGHTS *****
-- Shows sales details for each products as well as those products which were not sold at all so their supply can be considered in the future to prevent losses.


-- Q13 Show product's current inventory which is highest order placed at a time.
SELECT `InventoryOnHand`, id,ProductLabel  FROM `products`
where `id` in (SELECT `ProductId` FROM `orders` where
		`NumberShipped` = (SELECT MAX(`NumberShipped`) FROM `orders`));
-- ***** INSIGHTS *****
-- We get to know the current stock of products ordered in bulk hence it lets us decide to stockpile those products.


-- Q14 Show all laptops and their stocks in the products table and their sales made.
SELECT p.`ProductLabel`, p.`InventoryOnHand`, SUM(o.`NumberShipped`) AS `TotalSales`
FROM `products` p JOIN `orders` o
ON o.`ProductId` = p.`id`
WHERE p.`ProductLabel` LIKE '%laptop%'
GROUP BY p.`ProductLabel`, p.`InventoryOnHand`
ORDER BY `TotalSales` DESC;
-- ***** INSIGHTS *****
-- Sales and current stock of all laptops are shown which gives which laptop is popular.


-- Q15 Product with inventory on hand more than 20 and not ordered at all.
SELECT `InventoryOnHand`, `ProductLabel`
FROM `products` 
WHERE `id` NOT IN (SELECT `ProductId` FROM `orders`) AND
`InventoryOnHand` > 20;
-- ***** INSIGHTS *****
-- Here unordered products with inventory in bulk can either be sold for a discount to reduce losses.


-- Q16 Show names of the people concatenated with initial of Middle name who placed orders in 2021 order from higher no. shipped.
SELECT CONCAT(`First`, " ", LEFT(`Middle`, 1), ". ", `Last`) AS `Name`,
SUM(`NumberShipped`) AS `OrderSize`
FROM `orders` WHERE YEAR(`OrderDate`) = 2021
GROUP BY `Name`
ORDER BY `OrderSize` DESC;
-- ***** INSIGHTS *****
-- Full names of customers who ordered in 2021 showing important customers based on order size.


-- Q17 Show all cameras and TVs starting inventory of products where inventory on hand more than 15.
SELECT `ProductLabel`, `InventoryOnHand` FROM `products` 
WHERE `ProductLabel` REGEXP 'camera|tv' AND
	  `InventoryOnHand` > 15;
-- ***** INSIGHTS *****
-- Current inventories of cameras and TVs which has good stock quantity.


-- Q18 No of products supplied for all quarters of 2022 by suppliers.
SELECT SUM(`NumberReceived`) AS `TotalPurchases`, CONCAT("Q", QUARTER(`PurchaseDate`), " ", YEAR(`PurchaseDate`)) AS `quarter` 
FROM `purchases`
WHERE YEAR(`PurchaseDate`) = 2022
GROUP BY QUARTER(`PurchaseDate`), `quarter`;
-- ***** INSIGHTS *****
-- It shows the trends of each quarter in 2022 where purchase size was increased or decreased.








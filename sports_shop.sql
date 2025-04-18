
CREATE DATABASE SportsShopDB4;
USE SportsShopDB4;

/* 1. ProductCategory Table */
CREATE TABLE dbo.ProductCategory (
    CategoryID VARCHAR(50) PRIMARY KEY,          -- Changed to VARCHAR
    CategoryName VARCHAR(100) NOT NULL UNIQUE,
    CategoryDescription TEXT
);

INSERT INTO "ProductCategory" ("CategoryID", "CategoryName") VALUES
('Cat1', 'Basketball Equipment'),
('Cat2', 'Baseball Equipment'),
('Cat3', 'Swimming Gear'),
('Cat4', 'Football Gear'),
('Cat5', 'Cycling Accessories'),
('Cat6', 'Fitness Accessories'),
('Cat7', 'Fitness Equipment'),
('Cat8', 'Golf Equipment'),
('Cat9', 'Outdoor Gear'),
('Cat10', 'Racket Sports'),
('Cat11', 'Recovery Tools'),
('Cat12', 'Running'),
('Cat13', 'Skateboarding'),
('Cat14', 'Strength Training'),
('Cat15', 'Training Equipment'),
('Cat16', 'Weightlifting'),
('Cat17', 'Yoga');

select * from SportsShopDB4.dbo.ProductCategory;

/* 2. Product Table */
CREATE TABLE dbo.Product (
    ProductID VARCHAR(50) PRIMARY KEY,           -- Changed to VARCHAR
    ProductName VARCHAR(100) NOT NULL,
    ProductDescription TEXT,
    CategoryID VARCHAR(50),                      -- Adjusted to match CategoryID type
    UnitPrice DECIMAL(10,2) CHECK (UnitPrice >= 0), -- Em CHECK 
    FOREIGN KEY (CategoryID) REFERENCES dbo.ProductCategory(CategoryID) ON DELETE SET NULL
);

INSERT INTO "Product" ("ProductID", "ProductName", "ProductDescription", "UnitPrice", "CategoryID") VALUES
('Prod9', 'Baseball Glove', 'Premium leather baseball glove designed for comfort and quick ball retrieval.', '69.99', 'Cat2'), -- Baseball Equipment
('Prod19', 'Mountain Bike', 'Rugged mountain bike built for off-road exploration and extreme trails.', '499.99', 'Cat9'), -- Outdoor Gear
('Prod10', 'Gym Bag', 'Large capacity gym bag with multiple compartments for storing all gym essentials.', '34.99', 'Cat6'), -- Fitness Accessories
('Prod22', 'Sports Watch', 'Dedicated sports watch with GPS tracking and fitness monitoring features.', '199.99', 'Cat7'), -- Fitness Equipment
('Prod14', 'Kettlebell Set', 'Versatile kettlebell set for full-body workouts, suitable for all fitness levels.', '89.99', 'Cat14'), -- Strength Training
('Prod23', 'Skateboard', 'Durable skateboard suitable for tricks and cruising, perfect for all skill levels.', '89.99', 'Cat13'), -- Skateboarding
('Prod2', 'Basketball', 'Durable basketball made of high-quality rubber, perfect for both indoor and outdoor play.', '29.99', 'Cat2'), -- Baseball Equipment
('Prod21', 'Jump Rope', 'Adjustable jump rope for cardio workouts and enhancing coordination skills.', '9.99', 'Cat14'), -- Strength Training
('Prod1', 'Running Shoes', 'Lightweight running shoes designed for maximum comfort and breathability, ideal for runners.', '79.99', 'Cat12'), -- Running
('Prod7', 'Hiking Boots', 'Sturdy and waterproof hiking boots designed for tough trails.', '99.99', 'Cat9'), -- Outdoor Gear
('Prod29', 'Portable Grill', 'Compact and portable grill perfect for tailgating and outdoor sports events.', '99.99', 'Cat9'), -- Outdoor Gear
('Prod15', 'Ice Skates', 'Professional ice skates built for speed and comfort on the ice rink.', '129.99', 'Cat16'), -- Weightlifting
('Prod27', 'Climbing Gear Set', 'Complete climbing gear set including harness, carabiners, and ropes for safety.', '249.99', 'Cat9'), -- Outdoor Gear
('Prod8', 'Swimming Goggles', 'Anti-fog swimming goggles that provide a clear view underwater while swimming.', '15.99', 'Cat3'), -- Bodyweight Training
('Prod25', 'Football', 'Durable football made for both practice and game play, suitable for all surfaces.', '34.99', 'Cat2'), -- Baseball Equipment
('Prod17', 'Fitness Tracker', 'Smart fitness tracker to monitor heart rate, steps, and calories burned.', '59.99', 'Cat7'), -- Fitness Equipment
('Prod16', 'Foam Roller', 'High-density foam roller for muscle recovery and relief of soreness.', '24.99', 'Cat11'), -- Recovery Tools
('Prod3', 'Yoga Mat', 'Non-slip yoga mat providing comfort and stability during yoga and fitness workouts.', '19.99', 'Cat17'), -- Yoga
('Prod18', 'Resistance Bands', 'Durable resistance bands designed for strength training and rehabilitation.', '24.99', 'Cat14'), -- Strength Training
('Prod28', 'Squash Racket', 'Lightweight squash racket optimized for speed and control on the court.', '119.99', 'Cat10'), -- Racket Sports
('Prod12', 'Lacrosse Stick', 'Lightweight lacrosse stick made for precision and control during the game.', '99.99', 'Cat15'), -- Training Equipment
('Prod30', 'Baseball Bat', 'High-quality baseball bat with a balanced feel for improving hitting skills.', '79.99', 'Cat2'), -- Baseball Equipment
('Prod5', 'Tennis Racket', 'Lightweight and balanced tennis racket suitable for players of all levels to improve their game.', '119.99', 'Cat10'), -- Racket Sports
('Prod6', 'Cycling Helmet', 'Aerodynamic cycling helmet with adjustable fit for safety while biking.', '49.99', 'Cat5'), -- Cycling Accessories
('Prod20', 'Inline Skates', 'Smooth rolling inline skates designed for outdoor skating and fitness purposes.', '79.99', 'Cat13'), -- Skateboarding
('Prod13', 'Golf Balls', 'High-performance golf balls designed for distance and accuracy on the course.', '29.99', 'Cat8'), -- Golf Equipment
('Prod26', 'Water Bottle', 'Eco-friendly water bottle that keeps drinks cold during workouts.', '12.99', 'Cat6'), -- Fitness Accessories
('Prod11', 'Boxing Gloves', 'Durable and padded boxing gloves ideal for training and sparring.', '59.99', 'Cat6'), -- Fitness Accessories
('Prod24', 'Surfboard', 'Lightweight surfboard designed for smooth rides and sharp turns on the waves.', '349.99', 'Cat9'), -- Outdoor Gear
('Prod4', 'Soccer Cleats', 'Professional soccer cleats designed for enhanced traction on the field.', '89.99', 'Cat9'); -- Outdoor Gear

select * from SportsShopDB4.dbo.Product;

/* 3. Customer Table with Computed Column */
CREATE TABLE dbo.Customer (
    CustomerID VARCHAR(50) PRIMARY KEY,          -- Changed to VARCHAR
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FullName AS (FirstName + ' ' + LastName) PERSISTED,  -- Computed Column
    StreetAddress VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    ZipCode VARCHAR(20),
    Email VARCHAR (256) NOT NULL,  
    Phone VARCHAR (128) NOT NULL,  
);

INSERT INTO "Customer" ("CustomerID", "FirstName", "LastName", "StreetAddress", "City", "State", "Country", "ZipCode", "Email", "Phone") VALUES
('CUST1', 'Aura', 'Kahan', '13266 Tatman Terrace', 'Houston', 'Texas', 'United States', '77271', 'aura.kahan@hotmail.com', '(713) 939-6815'),
('CUST2', 'Marysa', 'Pendrigh', '4577 Alysha Avenue', 'Tallahassee', 'Florida', 'United States', '32314', 'marysa.pendrigh@yahoo.com.br', '(850) 005-7944'),
('CUST3', 'Benny', 'Seers', '10224 Carley Loop', 'Akron', 'Ohio', 'United States', '44393', 'benny.seers@yahoo.co.in', '(234) 658-0588'),
('CUST4', 'Nikolos', 'Sey', '14111 Parlange Terrace', 'Portsmouth', 'Virginia', 'United States', '23705', 'nikolos.sey@yahoo.com', '(757) 381-4062'),
('CUST5', 'Julissa', 'Culleton', '365 Day Lily Run', 'Tuscaloosa', 'Alabama', 'United States', '35405', 'julissa.culleton@hotmail.fr', '(205) 094-0598'),
('CUST6', 'Mitchael', 'Pinchon', '6562 Gentle Terrace', 'Louisville', 'Kentucky', 'United States', '40287', 'mitchael.pinchon@yahoo.com', '(502) 256-8153'),
('CUST7', 'Aura', 'Swayne', '11917 Sassparilla Way', 'Memphis', 'Tennessee', 'United States', '38119', 'aura.swayne@live.com', '(901) 573-3616'),
('CUST8', 'Ina', 'Ecob', '87 Maywood Way', 'Birmingham', 'Alabama', 'United States', '35210', 'ina.ecob@hotmail.com', '(205) 388-2691'),
('CUST9', 'Marlowe', 'Izakson', '2445 Knowlton Avenue', 'Aurora', 'Colorado', 'United States', '80015', 'marlowe.izakson@yahoo.com', '(303) 863-1044'),
('CUST10', 'Rollo', 'Banford', '11330 Leeds Place', 'Philadelphia', 'Pennsylvania', 'United States', '19160', 'rollo.banford@yahoo.com', '(215) 941-4368'),
('CUST11', 'Osbourn', 'Kahan', '6456 Marbella Lane', 'Lexington', 'Kentucky', 'United States', '40591', 'osbourn.kahan@yahoo.com', '(859) 875-1193'),
('CUST12', 'Susanetta', 'Duignan', '883 Erika Place', 'Burbank', 'California', 'United States', '91520', 'susanetta.duignan@gmail.com', '(323) 283-6668'),
('CUST13', 'Cob', 'Gartrell', '9890 Ely Circle', 'New York City', 'New York', 'United States', '10150', 'cob.gartrell@yahoo.com', '(212) 932-8892'),
('CUST14', 'Adrienne', 'Breston', '10568 Leggett Lane', 'Dayton', 'Ohio', 'United States', '45432', 'adrienne.breston@hotmail.co.uk', '(937) 978-8839'),
('CUST15', 'Clark', 'Favey', '1232 Avila Place', 'Los Angeles', 'California', 'United States', '90015', 'clark.favey@hotmail.com', '(562) 453-2436'),
('CUST16', 'Winnie', 'Villaron', '6094 Bainan Place', 'Indianapolis', 'Indiana', 'United States', '46278', 'winnie.villaron@yahoo.co.id', '(317) 343-6495'),
('CUST17', 'Wallie', 'Blandamore', '5722 Johnson Court', 'Peoria', 'Illinois', 'United States', '61605', 'wallie.blandamore@yahoo.com', '(309) 962-3154'),
('CUST18', 'Jerrine', 'Adanet', '3674 Trabucco Terrace', 'Riverside', 'California', 'United States', '92513', 'jerrine.adanet@yahoo.com', '(951) 260-0372'),
('CUST19', 'Kip', 'How', '1641 Lintz Lane', 'Chico', 'California', 'United States', '95973', 'kip.how@hotmail.com', '(530) 236-3666'),
('CUST20', 'Ulla', 'Birdall', '898 Saluda Street', 'North Hollywood', 'California', 'United States', '91606', 'ulla.birdall@yahoo.com', '(818) 090-6046'),
('CUST21', 'Essa', 'Jepp', '1416 Creekside Drive', 'Boise', 'Idaho', 'United States', '83722', 'essa.jepp@hotmail.com', '(208) 837-3035'),
('CUST22', 'Hilary', 'Worsnap', '5441 Silverstreet Way', 'Moreno Valley', 'California', 'United States', '92555', 'hilary.worsnap@hotmail.co.uk', '(951) 971-7613'),
('CUST23', 'Jordana', 'Dobbing', '1390 Ridgeville Road', 'Austin', 'Texas', 'United States', '78726', 'jordana.dobbing@hotmail.it', '(512) 410-7137'),
('CUST24', 'Renee', 'Dunkersley', '12231 Trinity Place', 'Jacksonville', 'Florida', 'United States', '32209', 'renee.dunkersley@hotmail.com', '(904) 566-0721'),
('CUST25', 'Catarina', 'Devigne', '3844 Formosa Terrace', 'Austin', 'Texas', 'United States', '78726', 'catarina.devigne@hotmail.com', '(512) 299-7254'),
('CUST26', 'Pauline', 'Wike', '12234 Robin Court', 'Waterbury', 'Connecticut', 'United States', '06726', 'pauline.wike@gmail.com', '(203) 793-6569'),
('CUST27', 'Ingra', 'Mears', '2956 Brianna Lane', 'Boise', 'Idaho', 'United States', '83711', 'ingra.mears@bol.com.br', '(208) 705-4929'),
('CUST28', 'Marten', 'Ellacombe', '5426 Mccullough Lane', 'Raleigh', 'North Carolina', 'United States', '27610', 'marten.ellacombe@gmail.com', '(919) 909-2709'),
('CUST29', 'Phyllis', 'Dradey', '8606 Picasso Place', 'Trenton', 'New Jersey', 'United States', '08619', 'phyllis.dradey@gmail.com', '(609) 806-0943'),
('CUST30', 'Odille', 'Goad', '9005 Hayward Path', 'Mobile', 'Alabama', 'United States', '36622', 'odille.goad@live.it', '(251) 970-7122');
select * from SportsShopDB4.dbo.Customer;



/* 4. Cart Table */
CREATE TABLE dbo.Cart (
    CartID VARCHAR(50) PRIMARY KEY,              -- Changed to VARCHAR
    CustomerID VARCHAR(50) NOT NULL,             -- Adjusted to match CustomerID type
    Status VARCHAR(50) ,
    CreatedTime DATETIME ,
    UpdateTime DATETIME ,
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID) ON DELETE CASCADE
);


INSERT INTO "Cart" ("CartID", "CustomerID", "Status", "CreatedTime", "UpdateTime") VALUES
('Cart001', 'CUST1', 'Completed', '2024-03-07 08:02:48', '2024-03-11 01:38:36'),
('Cart002', 'CUST26', 'Processed', '2024-03-07 08:11:51', '2024-03-16 02:33:00'),
('Cart003', 'CUST21', 'Returned', '2024-03-07 08:19:18', '2024-03-07 16:51:21'),
('Cart004', 'CUST25', 'Canceled', '2024-03-07 08:26:25', '2024-03-14 10:23:13'),
('Cart005', 'CUST2', 'Failed', '2024-03-07 08:34:02', '2024-03-09 23:42:44'),
('Cart006', 'CUST11', 'Shipped', '2024-03-07 08:40:47', '2024-03-07 09:36:40'),
('Cart007', 'CUST28', 'Returned', '2024-03-07 08:46:14', '2024-03-12 16:51:57'),
('Cart008', 'CUST9', 'Failed', '2024-03-07 08:48:57', '2024-03-16 08:37:50'),
('Cart009', 'CUST10', 'Shipped', '2024-03-07 08:52:35', '2024-03-17 03:14:36'),
('Cart010', 'CUST14', 'Shipped', '2024-03-07 09:00:42', '2024-03-15 19:14:11'),
('Cart011', 'CUST24', 'Processed', '2024-03-07 09:02:42', '2024-03-12 13:00:11'),
('Cart012', 'CUST8', 'Completed', '2024-03-07 09:10:09', '2024-03-13 14:13:40'),
('Cart013', 'CUST6', 'Failed', '2024-03-07 09:15:20', '2024-03-15 10:10:01'),
('Cart014', 'CUST17', 'Delivered', '2024-03-07 09:23:29', '2024-03-12 00:36:59'),
('Cart015', 'CUST12', 'Canceled', '2024-03-07 09:31:57', '2024-03-12 16:07:49'),
('Cart016', 'CUST22', 'Failed', '2024-03-07 09:41:30', '2024-03-08 07:56:40'),
('Cart017', 'CUST15', 'Delivered', '2024-03-07 09:46:02', '2024-03-16 06:59:49'),
('Cart018', 'CUST19', 'In Progress', '2024-03-07 09:54:09', '2024-03-13 04:05:30'),
('Cart019', 'CUST4', 'Completed', '2024-03-07 09:59:51', '2024-03-15 07:12:20'),
('Cart020', 'CUST3', 'Processed', '2024-03-07 10:08:01', '2024-03-13 10:16:51');

select * from SportsShopDB4.dbo.Cart;


/* 5. Shipment Table */
CREATE TABLE dbo.Shipment (
    ShipmentID VARCHAR(50) PRIMARY KEY,          -- Changed to VARCHAR
    ShipmentDate DATETIME 
);

INSERT INTO "Shipment" ("ShipmentID", "ShipmentDate") VALUES
('S001', '2024-05-27 19:57:03'),
('S002', '2024-03-26 23:03:13'),
('S003', '2024-03-09 17:20:59'),
('S004', '2024-08-13 23:11:07'),
('S005', '2024-06-15 09:57:28'),
('S006', '2024-12-16 20:45:23'),
('S007', '2024-05-08 17:47:50'),
('S008', '2024-10-05 18:54:02'),
('S009', '2024-10-05 10:12:09'),
('S010', '2024-07-19 05:16:06'),
('S011', '2024-06-20 23:44:32'),
('S012', '2024-05-19 15:49:16'),
('S013', '2025-02-10 12:51:12'),
('S014', '2025-02-14 23:16:58'),
('S015', '2024-05-09 09:46:21'),
('S016', '2024-12-05 20:16:33'),
('S017', '2024-04-03 00:22:03'),
('S018', '2024-07-24 19:14:43'),
('S019', '2024-10-22 12:15:24'),
('S020', '2025-01-18 12:20:28'),
('S021', '2024-04-30 03:02:02'),
('S022', '2024-09-02 05:09:27'),
('S023', '2024-08-09 00:59:00'),
('S024', '2024-04-22 22:56:44'),
('S025', '2025-02-13 03:55:19'),
('S026', '2025-01-07 09:46:02'),
('S027', '2024-11-30 00:26:45'),
('S028', '2025-01-01 07:54:53'),
('S029', '2024-11-25 04:41:29'),
('S030', '2024-08-17 11:27:29'),
('S031', '2024-03-11 18:55:26'),
('S032', '2024-05-15 14:35:01'),
('S033', '2024-05-27 14:09:51'),
('S034', '2024-10-20 01:22:36'),
('S035', '2024-05-28 03:30:59'),
('S036', '2024-06-07 12:22:20'),
('S037', '2024-06-23 19:49:09'),
('S038', '2024-11-29 02:31:01'),
('S039', '2025-02-18 13:15:10'),
('S040', '2024-07-06 07:18:31'),
('S041', '2024-07-31 02:21:09'),
('S042', '2024-06-11 16:15:27'),
('S043', '2024-10-08 19:01:22'),
('S044', '2024-03-10 23:23:22'),
('S045', '2024-05-16 06:13:51'),
('S046', '2025-02-20 08:47:44'),
('S047', '2025-02-28 08:07:54'),
('S048', '2024-03-27 16:06:08'),
('S049', '2024-04-24 07:49:47'),
('S050', '2024-05-07 06:34:41');


select * from SportsShopDB4.dbo.Shipment;


/* 6. Order Table */
CREATE TABLE dbo.[Order] (
    OrderID VARCHAR(50) PRIMARY KEY,             -- Changed to VARCHAR
    CustomerID VARCHAR(50) NOT NULL,             -- Adjusted to match CustomerID type
    OrderDate DATETIME,
    Status VARCHAR(50) ,
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID) ON DELETE CASCADE,
);

INSERT INTO dbo.[Order] ("OrderID", "CustomerID", "OrderDate", "Status") VALUES
('ORD1', 'CUST19', '2024-08-03 22:03:45', 'Cancelled'),
('ORD2', 'CUST26', '2024-09-02 22:13:35', 'Pending'),
('ORD3', 'CUST2', '2025-02-23 20:47:04', 'Delivered'),
('ORD4', 'CUST7', '2024-12-11 15:19:52', 'Cancelled'),
('ORD5', 'CUST18', '2025-01-17 20:46:56', 'Processing'),
('ORD6', 'CUST3', '2024-09-27 20:31:59', 'Delivered'),
('ORD7', 'CUST16', '2024-07-08 00:51:28', 'Returned'),
('ORD8', 'CUST15', '2024-09-04 15:59:12', 'On Hold'),
('ORD9', 'CUST23', '2025-03-06 15:19:33', 'Shipped'),
('ORD10', 'CUST8', '2024-03-17 13:27:35', 'Pending'),
('ORD11', 'CUST25', '2024-06-09 01:40:21', 'Processing'),
('ORD12', 'CUST6', '2025-01-28 17:14:06', 'Shipped'),
('ORD13', 'CUST29', '2024-07-15 16:13:34', 'Completed'),
('ORD14', 'CUST11',  '2024-12-02 21:31:12', 'Delivered'),
('ORD15', 'CUST9', '2024-10-30 10:27:29', 'Delivered'),
('ORD16', 'CUST24', '2024-05-09 09:28:17', 'Completed'),
('ORD17', 'CUST12', '2024-07-02 02:02:47', 'On Hold'),
('ORD18', 'CUST14', '2025-02-06 07:09:07', 'Cancelled'),
('ORD19', 'CUST1', '2024-04-28 01:22:16', 'Processing'),
('ORD20', 'CUST20', '2024-06-08 23:27:50', 'Processing'),
('ORD21', 'CUST4', '2024-08-19 15:03:19', 'On Hold'),
('ORD22', 'CUST5', '2025-01-12 02:20:18', 'Delivered'),
('ORD23', 'CUST22', '2024-12-20 09:29:46', 'Delivered'),
('ORD24', 'CUST10', '2024-11-04 14:31:21', 'Delivered'),
('ORD25', 'CUST13', '2024-08-23 08:15:22', 'Processing'),
('ORD26', 'CUST21', '2024-09-04 02:53:44', 'Returned'),
('ORD27', 'CUST17', '2025-02-24 18:03:27', 'Returned'),
('ORD28', 'CUST28', '2024-09-20 22:57:28', 'Pending'),
('ORD29', 'CUST27', '2024-07-29 14:38:00', 'Cancelled'),
('ORD30', 'CUST30', '2024-12-25 13:42:47', 'Completed');
select * from SportsShopDB4.dbo.[Order];

/* 7. Warehouse Table */
CREATE TABLE dbo.Warehouse (
    WarehouseID VARCHAR(50) PRIMARY KEY,         -- Changed to VARCHAR
    WarehouseAddress VARCHAR(255) NOT NULL
);
INSERT INTO "Warehouse" ("WarehouseID", "WarehouseAddress") VALUES
('1', '2672 Cayce Place, Denver, Colorado, United States, 80291'),
('2', '454 Torri Terrace, North Little Rock, Arkansas, United States, 72199'),
('3', '9200 Patrick Place, Las Vegas, Nevada, United States, 89125'),
('4', '3409 Lauren Lane, Washington, District of Columbia, United States, 20566'),
('5', '13480 Watch Hill Street, San Angelo, Texas, United States, 76905'),
('6', '7017 Marsh Court, Newton, Massachusetts, United States, 02458'),
('7', '2513 Guerard Avenue, Mansfield, Ohio, United States, 44905'),
('8', '1705 Denaud Place, Saint Louis, Missouri, United States, 63131'),
('9', '10625 Fortnier Street, Houston, Texas, United States, 77025'),
('10', '8101 Napa Lane, Brooklyn, New York, United States, 11205');

select * from SportsShopDB4.dbo.Warehouse;



/* 8. CartItem Table */
CREATE TABLE dbo.CartItem (
    CartID VARCHAR(50) NOT NULL,                 -- Adjusted to match CartID type
    ProductID VARCHAR(50) NOT NULL,              -- Adjusted to match ProductID type
    PRIMARY KEY (CartID, ProductID),
    FOREIGN KEY (CartID) REFERENCES dbo.Cart(CartID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID) ON DELETE CASCADE
);
INSERT INTO "CartItem" ("CartID", "ProductID") VALUES
('Cart008', 'Prod6'),
('Cart010', 'Prod22'),
('Cart018', 'Prod11'),
('Cart001', 'Prod1'),
('Cart016', 'Prod12'),
('Cart003', 'Prod20'),
('Cart017', 'Prod2'),
('Cart005', 'Prod7'),
('Cart020', 'Prod13'),
('Cart006', 'Prod4'),
('Cart004', 'Prod17'),
('Cart015', 'Prod5'),
('Cart019', 'Prod28'),
('Cart011', 'Prod30'),
('Cart002', 'Prod9'),
('Cart014', 'Prod26'),
('Cart013', 'Prod14'),
('Cart009', 'Prod8'),
('Cart007', 'Prod27'),
('Cart012', 'Prod19'),
('Cart006', 'Prod18'),
('Cart013', 'Prod16'),
('Cart002', 'Prod10'),
('Cart012', 'Prod3'),
('Cart005', 'Prod29'),
('Cart007', 'Prod21'),
('Cart001', 'Prod15'),
('Cart010', 'Prod24'),
('Cart017', 'Prod25'),
('Cart003', 'Prod23'),
('Cart019', 'Prod22'),
('Cart016', 'Prod7'),
('Cart015', 'Prod6'),
('Cart014', 'Prod12'),
('Cart011', 'Prod10'),
('Cart004', 'Prod4'),
('Cart018', 'Prod3'),
('Cart009', 'Prod28'),
('Cart020', 'Prod25'),
('Cart008', 'Prod9'),
('Cart014', 'Prod29'),
('Cart017', 'Prod20'),
('Cart001', 'Prod14'),
('Cart011', 'Prod13'),
('Cart013', 'Prod18'),
('Cart009', 'Prod21'),
('Cart008', 'Prod17'),
('Cart010', 'Prod27'),
('Cart019', 'Prod15'),
('Cart007', 'Prod11'),
('Cart018', 'Prod16'),
('Cart016', 'Prod19'),
('Cart020', 'Prod24'),
('Cart003', 'Prod30'),
('Cart012', 'Prod23'),
('Cart005', 'Prod1'),
('Cart006', 'Prod2'),
('Cart004', 'Prod5'),
('Cart002', 'Prod26'),
('Cart015', 'Prod8'),
('Cart012', 'Prod7'),
('Cart017', 'Prod11'),
('Cart006', 'Prod17'),
('Cart002', 'Prod16'),
('Cart019', 'Prod25'),
('Cart016', 'Prod22'),
('Cart011', 'Prod9'),
('Cart020', 'Prod23'),
('Cart010', 'Prod14'),
('Cart009', 'Prod18'),
('Cart008', 'Prod8'),
('Cart004', 'Prod1'),
('Cart015', 'Prod12'),
('Cart018', 'Prod26'),
('Cart014', 'Prod4'),
('Cart005', 'Prod5'),
('Cart007', 'Prod13'),
('Cart013', 'Prod28'),
('Cart003', 'Prod10'),
('Cart014', 'Prod6'),
('Cart011', 'Prod19'),
('Cart004', 'Prod3'),
('Cart018', 'Prod29'),
('Cart009', 'Prod24'),
('Cart020', 'Prod30'),
('Cart008', 'Prod2'),
('Cart006', 'Prod21'),
('Cart013', 'Prod27'),
('Cart002', 'Prod20'),
('Cart012', 'Prod17'),
('Cart005', 'Prod12'),
('Cart007', 'Prod2'),
('Cart001', 'Prod21'),
('Cart010', 'Prod25'),
('Cart017', 'Prod23'),
('Cart003', 'Prod5'),
('Cart019', 'Prod26'),
('Cart016', 'Prod6'),
('Cart015', 'Prod19');

select * from SportsShopDB4.dbo.CartItem;



/* 9. OrderItem Table */
CREATE TABLE dbo.OrderItem (
    OrderID VARCHAR(50) NOT NULL,                -- Adjusted to match OrderID type
    ProductID VARCHAR(50) NOT NULL,              -- Adjusted to match ProductID type
    Quantity INT CHECK (Quantity > 0),           -- CHECK
    ShipmentID VARCHAR(50),                      -- Adjusted to match ShipmentID type
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES dbo.[Order](OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (ShipmentID) REFERENCES dbo.Shipment(ShipmentID) ON DELETE SET NULL
);

INSERT INTO "OrderItem" ("OrderID", "ProductID", "Quantity", "ShipmentID") VALUES
('ORD9', 'Prod21', '11', 'S046'),
('ORD7', 'Prod5', '6', 'S016'),
('ORD17', 'Prod27', '83', 'S039'),
('ORD29', 'Prod12', '80', 'S033'),
('ORD24', 'Prod9', '60', 'S025'),
('ORD12', 'Prod15', '81', 'S048'),
('ORD4', 'Prod23', '58', 'S007'),
('ORD25', 'Prod7', '68', 'S019'),
('ORD14', 'Prod13', '98', 'S042'),
('ORD28', 'Prod24', '48', 'S032'),
('ORD26', 'Prod3', '48', 'S044'),
('ORD11', 'Prod28', '11', 'S049'),
('ORD27', 'Prod22', '81', 'S003'),
('ORD19', 'Prod10', '49', 'S001'),
('ORD13', 'Prod18', '90', 'S036'),
('ORD3', 'Prod1', '35', 'S011'),
('ORD16', 'Prod29', '1', 'S013'),
('ORD22', 'Prod4', '46', 'S024'),
('ORD20', 'Prod16', '31', 'S022'),
('ORD10', 'Prod2', '5', 'S010'),
('ORD23', 'Prod17', '95', 'S047'),
('ORD21', 'Prod26', '48', 'S005'),
('ORD8', 'Prod6', '98', 'S041'),
('ORD6', 'Prod20', '87', 'S043'),
('ORD1', 'Prod11', '49', 'S008'),
('ORD30', 'Prod25', '45', 'S023'),
('ORD15', 'Prod8', '37', 'S002'),
('ORD2', 'Prod30', '38', 'S035'),
('ORD18', 'Prod19', '3', 'S038'),
('ORD5', 'Prod14', '12', 'S030'),
('ORD6', 'Prod21', '25', 'S027'),
('ORD12', 'Prod1', '51', 'S037'),
('ORD10', 'Prod22', '4', 'S034'),
('ORD4', 'Prod2', '64', 'S015'),
('ORD3', 'Prod11', '9', 'S029'),
('ORD25', 'Prod10', '47', 'S009'),
('ORD9', 'Prod8', '4', 'S028'),
('ORD29', 'Prod9', '74', 'S017'),
('ORD20', 'Prod18', '93', 'S014'),
('ORD14', 'Prod12', '18', 'S012'),
('ORD13', 'Prod4', '22', 'S020'),
('ORD18', 'Prod30', '70', 'S031'),
('ORD21', 'Prod23', '89', 'S050'),
('ORD17', 'Prod17', '33', 'S045'),
('ORD27', 'Prod15', '34', 'S004'),
('ORD11', 'Prod6', '97', 'S040'),
('ORD16', 'Prod25', '27', 'S006'),
('ORD19', 'Prod19', '60', 'S043'),
('ORD24', 'Prod7', '94', 'S011'),
('ORD23', 'Prod3', '79', 'S016'),
('ORD1', 'Prod5', '38', 'S012'),
('ORD2', 'Prod28', '95', 'S023'),
('ORD5', 'Prod16', '1', 'S030'),
('ORD26', 'Prod29', '25', 'S036'),
('ORD8', 'Prod20', '41', 'S045'),
('ORD22', 'Prod26', '12', 'S033'),
('ORD8', 'Prod17', '50', 'S025'),
('ORD30', 'Prod1', '23', 'S015'),
('ORD19', 'Prod27', '72', 'S032'),
('ORD14', 'Prod22', '25', 'S040'),
('ORD21', 'Prod19', '89', 'S038'),
('ORD5', 'Prod7', '96', 'S001'),
('ORD12', 'Prod16', '72', 'S046'),
('ORD9', 'Prod20', '58', 'S014'),
('ORD15', 'Prod4', '54', 'S021'),
('ORD23', 'Prod28', '16', 'S048'),
('ORD13', 'Prod8', '15', 'S028'),
('ORD24', 'Prod15', '57', 'S024'),
('ORD28', 'Prod9', '88', 'S018'),
('ORD10', 'Prod30', '77', 'S031'),
('ORD18', 'Prod3', '48', 'S029'),
('ORD1', 'Prod12', '47', 'S010'),
('ORD29', 'Prod2', '29', 'S009'),
('ORD4', 'Prod24', '11', 'S039'),
('ORD16', 'Prod5', '92', 'S047'),
('ORD2', 'Prod25', '29', 'S042'),
('ORD17', 'Prod29', '65', 'S005'),
('ORD26', 'Prod10', '68', 'S044'),
('ORD6', 'Prod23', '26', 'S019'),
('ORD20', 'Prod14', '16', 'S008'),
('ORD11', 'Prod13', '71', 'S050'),
('ORD25', 'Prod6', '99', 'S003'),
('ORD19', 'Prod2', '89', 'S013'),
('ORD18', 'Prod5', '87', 'S037'),
('ORD1', 'Prod26', '86', 'S034'),
('ORD2', 'Prod22', '9', 'S026'),
('ORD4', 'Prod7', '72', 'S020'),
('ORD5', 'Prod12', '55', 'S049'),
('ORD16', 'Prod10', '92', 'S007'),
('ORD30', 'Prod4', '56', 'S006');


select * from SportsShopDB4.dbo.OrderItem;



/* 10. WarehouseInventory Table */
CREATE TABLE dbo.WarehouseInventory (
    WarehouseID VARCHAR(50) NOT NULL,            -- Adjusted to match WarehouseID type
    ProductID VARCHAR(50) NOT NULL,               -- Adjusted to match ProductID type
    ProductQuantity INT CHECK (ProductQuantity >= 0), -- Emily CHECK
    PRIMARY KEY (WarehouseID, ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouse(WarehouseID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID) ON DELETE CASCADE
);

INSERT INTO "WarehouseInventory" ("WarehouseID", "ProductID", "ProductQuantity") VALUES
('10', 'Prod28', '777'),
('6', 'Prod15', '665'),
('4', 'Prod29', '134'),
('3', 'Prod19', '641'),
('5', 'Prod2', '143'),
('8', 'Prod14', '587'),
('7', 'Prod11', '218'),
('2', 'Prod5', '790'),
('9', 'Prod12', '706'),
('1', 'Prod10', '563');

select * from SportsShopDB4.dbo.WarehouseInventory;



/* 11. CustomerTransaction Table */
CREATE TABLE dbo.CustomerTransaction (
    TransactionID VARCHAR(50) PRIMARY KEY,        -- Changed to VARCHAR
    CustomerID VARCHAR(50) NOT NULL,              -- Adjusted to match CustomerID type
    OrderID VARCHAR(50),                          -- Adjusted to match OrderID type
    TransactionDate DATETIME ,
    TransactionMethod VARCHAR(50) CHECK (TransactionMethod IN 
('Credit Card', 'PayPal', 'Gift Card', 'Bank Transfer', 'Mobile Payment', 'Debit Card', 'Cryptocurrency', 'Prepaid Card', 'Cheque', 'Cash')) NOT NULL,
    Amount DECIMAL(10,2) CHECK (Amount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (OrderID) REFERENCES dbo.[Order](OrderID) ON DELETE NO ACTION 
);

INSERT INTO "CustomerTransaction" ("TransactionID", "CustomerID", "OrderID", "TransactionDate", "TransactionMethod", "Amount") VALUES
('TXN001', 'CUST27', 'ORD13', '2024-10-20 19:49:01', 'Mobile Payment', '385.05'),
('TXN002', 'CUST10', 'ORD21', '2024-11-22 13:13:20', 'Debit Card', '507.16'),
('TXN003', 'CUST11', 'ORD17', '2024-10-11 01:23:36', 'Credit Card', '378.58'),
('TXN004', 'CUST16', 'ORD28', '2024-07-18 22:24:14', 'Debit Card', '495.19'),
('TXN005', 'CUST29', 'ORD27', '2024-11-24 18:47:26', 'Cryptocurrency', '521.52'),
('TXN006', 'CUST23', 'ORD30', '2024-04-13 20:41:55', 'Prepaid Card', '405.05'),
('TXN007', 'CUST24', 'ORD19', '2024-05-05 13:14:48', 'Cryptocurrency', '597.86'),
('TXN008', 'CUST6', 'ORD26', '2024-05-04 20:16:05', 'Cryptocurrency', '554.52'),
('TXN009', 'CUST28', 'ORD2', '2024-07-11 22:56:45', 'PayPal', '520.78'),
('TXN010', 'CUST30', 'ORD7', '2024-10-15 01:07:25', 'Mobile Payment', '610.99'),
('TXN011', 'CUST12', 'ORD18', '2024-03-23 02:52:42', 'Cryptocurrency', '399.96'),
('TXN012', 'CUST22', 'ORD3', '2025-01-05 04:17:34', 'Gift Card', '577.20'),
('TXN013', 'CUST2', 'ORD16', '2024-05-06 05:17:17', 'Prepaid Card', '473.23'),
('TXN014', 'CUST7', 'ORD15', '2024-11-16 00:53:47', 'Cheque', '575.84'),
('TXN015', 'CUST4', 'ORD23', '2025-01-20 03:08:13', 'Mobile Payment', '379.55'),
('TXN016', 'CUST21', 'ORD8', '2024-06-07 10:50:11', 'Cheque', '578.54'),
('TXN017', 'CUST5', 'ORD25', '2024-04-21 01:13:31', 'Debit Card', '393.66'),
('TXN018', 'CUST25', 'ORD6', '2024-11-29 03:51:26', 'Debit Card', '410.27'),
('TXN019', 'CUST19', 'ORD29', '2024-04-21 16:39:01', 'Cheque', '531.99'),
('TXN020', 'CUST13', 'ORD11', '2025-02-26 18:26:03', 'Gift Card', '429.87'),
('TXN021', 'CUST17', 'ORD9', '2024-11-14 15:23:17', 'Cheque', '516.26'),
('TXN022', 'CUST9', 'ORD24', '2024-11-25 04:13:14', 'Gift Card', '404.46'),
('TXN023', 'CUST14', 'ORD12', '2025-02-22 04:06:39', 'Debit Card', '430.12'),
('TXN024', 'CUST1', 'ORD14', '2024-08-20 21:00:08', 'Cryptocurrency', '621.39'),
('TXN025', 'CUST26', 'ORD1', '2024-08-05 12:14:32', 'Cheque', '506.47'),
('TXN026', 'CUST3', 'ORD20', '2024-06-16 20:15:56', 'Debit Card', '487.99'),
('TXN027', 'CUST20', 'ORD4', '2024-11-21 13:51:47', 'Prepaid Card', '512.19'),
('TXN028', 'CUST8', 'ORD5', '2024-12-01 04:47:01', 'Cheque', '428.73'),
('TXN029', 'CUST15', 'ORD22', '2024-04-05 20:30:28', 'Credit Card', '556.89'),
('TXN030', 'CUST18', 'ORD10', '2024-09-06 12:23:45', 'PayPal', '505.24'),
('TXN031', 'CUST22', 'ORD12', '2024-05-02 00:10:00', 'Cryptocurrency', '522.74'),
('TXN032', 'CUST14', 'ORD22', '2024-11-01 06:25:34', 'PayPal', '379.60'),
('TXN033', 'CUST5', 'ORD15', '2025-02-13 12:05:21', 'Mobile Payment', '575.29'),
('TXN034', 'CUST15', 'ORD19', '2025-02-26 21:13:47', 'Cryptocurrency', '548.82'),
('TXN035', 'CUST7', 'ORD4', '2024-04-20 09:39:25', 'PayPal', '488.02'),
('TXN036', 'CUST8', 'ORD3', '2024-04-05 16:00:58', 'Mobile Payment', '514.25'),
('TXN037', 'CUST16', 'ORD27', '2024-06-02 10:52:04', 'Prepaid Card', '416.43'),
('TXN038', 'CUST9', 'ORD20', '2025-01-21 03:30:11', 'PayPal', '484.86'),
('TXN039', 'CUST26', 'ORD13', '2025-02-27 09:24:49', 'Credit Card', '448.04'),
('TXN040', 'CUST23', 'ORD5', '2024-10-02 14:09:46', 'Cash', '517.45'),
('TXN041', 'CUST13', 'ORD29', '2025-01-04 20:13:11', 'Debit Card', '466.63'),
('TXN042', 'CUST18', 'ORD18', '2024-07-17 18:20:54', 'Cryptocurrency', '461.96'),
('TXN043', 'CUST24', 'ORD30', '2024-12-07 21:25:53', 'Debit Card', '441.26'),
('TXN044', 'CUST1', 'ORD7', '2024-10-27 04:26:07', 'Mobile Payment', '486.00'),
('TXN045', 'CUST28', 'ORD16', '2024-10-29 04:45:05', 'Debit Card', '495.06'),
('TXN046', 'CUST27', 'ORD23', '2024-06-25 15:52:59', 'Mobile Payment', '567.71'),
('TXN047', 'CUST12', 'ORD1', '2024-10-12 11:10:04', 'PayPal', '522.52'),
('TXN048', 'CUST29', 'ORD26', '2024-05-26 18:53:49', 'Credit Card', '622.51'),
('TXN049', 'CUST2', 'ORD21', '2024-09-05 03:54:23', 'PayPal', '564.21'),
('TXN050', 'CUST4', 'ORD25', '2024-12-28 10:40:33', 'Bank Transfer', '542.05'),
('TXN051', 'CUST6', 'ORD2', '2024-03-22 12:07:36', 'Cryptocurrency', '617.56'),
('TXN052', 'CUST25', 'ORD11', '2024-07-03 09:02:26', 'Cash', '510.42'),
('TXN053', 'CUST10', 'ORD28', '2024-04-15 08:07:38', 'Debit Card', '480.39'),
('TXN054', 'CUST11', 'ORD9', '2024-11-27 03:57:50', 'PayPal', '542.70'),
('TXN055', 'CUST30', 'ORD10', '2024-05-27 00:55:01', 'Mobile Payment', '506.45'),
('TXN056', 'CUST17', 'ORD14', '2024-03-13 02:59:19', 'Mobile Payment', '453.07'),
('TXN057', 'CUST19', 'ORD24', '2025-01-04 22:24:27', 'Cryptocurrency', '478.28'),
('TXN058', 'CUST3', 'ORD8', '2024-09-27 19:33:55', 'Cryptocurrency', '402.89'),
('TXN059', 'CUST20', 'ORD6', '2024-10-13 13:00:40', 'Credit Card', '382.17'),
('TXN060', 'CUST21', 'ORD17', '2024-08-19 10:42:05', 'Bank Transfer', '511.27'),
('TXN061', 'CUST16', 'ORD12', '2024-05-06 22:56:51', 'Prepaid Card', '489.27'),
('TXN062', 'CUST27', 'ORD26', '2024-12-27 00:18:22', 'PayPal', '451.01'),
('TXN063', 'CUST20', 'ORD4', '2024-06-06 20:10:33', 'Cash', '525.10'),
('TXN064', 'CUST19', 'ORD5', '2024-12-23 18:12:25', 'Credit Card', '423.80'),
('TXN065', 'CUST10', 'ORD15', '2024-12-16 16:42:05', 'Cryptocurrency', '413.04'),
('TXN066', 'CUST23', 'ORD13', '2024-03-31 12:14:11', 'Cheque', '516.73'),
('TXN067', 'CUST4', 'ORD28', '2024-12-23 05:56:31', 'PayPal', '495.35'),
('TXN068', 'CUST8', 'ORD10', '2024-07-12 11:13:39', 'Cheque', '424.19'),
('TXN069', 'CUST28', 'ORD6', '2024-10-03 02:28:45', 'Cash', '581.71'),
('TXN070', 'CUST9', 'ORD19', '2025-01-26 10:35:49', 'Cash', '377.12'),
('TXN071', 'CUST21', 'ORD3', '2025-01-03 10:42:29', 'Debit Card', '535.12'),
('TXN072', 'CUST30', 'ORD29', '2024-11-14 07:20:45', 'Debit Card', '375.68'),
('TXN073', 'CUST2', 'ORD24', '2024-04-01 14:26:43', 'Cheque', '576.18'),
('TXN074', 'CUST3', 'ORD30', '2025-03-03 07:50:57', 'Bank Transfer', '480.15'),
('TXN075', 'CUST15', 'ORD2', '2024-11-17 21:01:32', 'Mobile Payment', '518.34'),
('TXN076', 'CUST24', 'ORD21', '2024-09-16 20:10:09', 'Bank Transfer', '607.64'),
('TXN077', 'CUST22', 'ORD27', '2024-03-24 13:34:15', 'Cryptocurrency', '549.63'),
('TXN078', 'CUST18', 'ORD20', '2024-03-27 03:03:36', 'Prepaid Card', '612.54'),
('TXN079', 'CUST25', 'ORD7', '2024-12-03 10:42:44', 'Mobile Payment', '588.93'),
('TXN080', 'CUST7', 'ORD11', '2024-06-17 23:34:11', 'Mobile Payment', '453.77'),
('TXN081', 'CUST5', 'ORD17', '2024-03-16 12:16:04', 'PayPal', '524.65'),
('TXN082', 'CUST29', 'ORD16', '2024-07-14 15:33:08', 'Cryptocurrency', '375.98'),
('TXN083', 'CUST13', 'ORD25', '2024-12-24 01:37:22', 'PayPal', '437.36'),
('TXN084', 'CUST17', 'ORD22', '2024-08-30 05:54:15', 'PayPal', '386.06'),
('TXN085', 'CUST12', 'ORD9', '2024-10-22 08:14:27', 'Prepaid Card', '529.08'),
('TXN086', 'CUST26', 'ORD23', '2024-04-22 18:38:02', 'Gift Card', '491.96'),
('TXN087', 'CUST14', 'ORD14', '2025-02-19 05:37:22', 'Cash', '405.13'),
('TXN088', 'CUST11', 'ORD18', '2024-10-11 09:10:47', 'Debit Card', '509.39'),
('TXN089', 'CUST6', 'ORD8', '2024-05-11 00:52:25', 'Gift Card', '587.16'),
('TXN090', 'CUST1', 'ORD1', '2024-11-20 08:29:54', 'Gift Card', '522.92'),
('TXN091', 'CUST28', 'ORD19', '2024-12-25 18:46:34', 'Bank Transfer', '620.75'),
('TXN092', 'CUST29', 'ORD14', '2024-04-16 13:47:33', 'Debit Card', '474.30'),
('TXN093', 'CUST7', 'ORD21', '2024-12-28 16:20:36', 'Bank Transfer', '542.90'),
('TXN094', 'CUST21', 'ORD5', '2024-08-08 04:22:08', 'Gift Card', '396.89'),
('TXN095', 'CUST1', 'ORD27', '2024-07-01 00:09:01', 'Bank Transfer', '472.28'),
('TXN096', 'CUST25', 'ORD12', '2024-04-28 16:46:06', 'Mobile Payment', '417.37'),
('TXN097', 'CUST15', 'ORD9', '2024-07-15 09:54:14', 'Cryptocurrency', '519.52'),
('TXN098', 'CUST19', 'ORD15', '2024-07-28 18:28:14', 'Cash', '536.47'),
('TXN099', 'CUST10', 'ORD23', '2025-01-26 01:47:54', 'Debit Card', '504.03'),
('TXN100', 'CUST2', 'ORD7', '2024-10-19 04:25:03', 'Cheque', '623.20');


select * from SportsShopDB4.dbo.CustomerTransaction;

/* 12. Reviews Table */
CREATE TABLE dbo.Reviews (
    ReviewID VARCHAR(50) PRIMARY KEY,             -- Changed to VARCHAR
    CustomerID VARCHAR(50) NOT NULL,              -- Adjusted to match CustomerID type
    ProductID VARCHAR(50) NOT NULL,               -- Adjusted to match ProductID type
    Rating INT CHECK (Rating BETWEEN 1 AND 5),    -- Emily CHECK
    ReviewText TEXT,
    ReviewDate DATETIME ,
    FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES dbo.Product(ProductID) ON DELETE CASCADE
);

INSERT INTO "Reviews" ("ReviewID", "CustomerID", "ProductID", "Rating", "ReviewText", "ReviewDate") VALUES
('R1', 'CUST5', 'Prod4', '3', 'Sensu careat, dolor in longinquitate levis, in gravitate brevis soleat esse, ut ad Orestem pervenias profectus a Theseo. At vero Epicurus una in domo, et ea quidem angusta, quam magnos quantaque amoris conspiratione.', '2024-09-23 05:31:24'),
('R2', 'CUST22', 'Prod27', '4', 'Fruuntur, futura modo expectant, quae quia certa esse non possunt, victi et debilitati obiecta specie voluptatis tradunt se libidinibus constringendos nec quid eventurum sit provident ob eamque debilitatem animi multi parentes, multi amicos, non nulli patriam, plerique autem se ipsos.', '2024-08-11 18:03:32'),
('R3', 'CUST10', 'Prod23', '4', 'In nemore . . .'' nihilo minus legimus quam hoc idem Graecum, quae autem de bene beateque vivendum. Sed existimo te, sicut nostrum Triarium, minus ab eo nos abducat? Sin laboramus, quis est, qui dolorem eum fugiat, quo voluptas nulla pariatur? At.', '2024-09-11 15:12:04'),
('R4', 'CUST13', 'Prod28', '2', 'Esse a nostris de amicitia disputatum. Alii cum eas voluptates, quae ad quietem et ad corpus nihil referatur, ista sua sponte et per se ipsam causam non fuisse. -- Torquem detraxit hosti. -- Et quidem se texit, ne interiret.', '2024-12-19 14:00:47'),
('R5', 'CUST21', 'Prod5', '1', 'Vivamus animumque et corpus, quantum efficere possimus, molestia liberemus. Ut enim virtutes, de quibus neque depravate iudicant neque corrupte, nonne ei maximam gratiam habere debemus, qui hac exaudita quasi voce naturae sic eam firme graviterque comprehenderit, ut omnes bene sanos in viam placatae, tranquillae, quietae, beatae vitae disciplinam.', '2025-02-09 05:15:39'),
('R6', 'CUST17', 'Prod19', '4', 'Quae non modo singulos homines, sed universas familias evertunt, totam etiam labefactant saepe rem publicam. Ex cupiditatibus odia, discidia, discordiae, seditiones, bella nascuntur, nec eae se foris solum.', '2025-01-31 17:26:32'),
('R7', 'CUST28', 'Prod11', '1', 'Nostrum Triarium, minus ab eo et gravissimas res consilio ipsius et ratione administrari neque maiorem voluptatem ex infinito tempore aetatis percipi posse, quam ex hoc facillime perspici potest: Constituamus aliquem magnis, multis, perpetuis fruentem et animo et corpore voluptatibus nullo dolore nec impediente nec inpendente, quem tandem hoc.', '2024-06-24 18:30:47'),
('R8', 'CUST27', 'Prod30', '3', 'Consilio, tuum iudicium ut cognoscerem, quoniam mihi ea facultas, ut id apte fieri possit, ut ab ipsis, qui eam disciplinam.', '2024-12-12 11:06:51'),
('R9', 'CUST30', 'Prod10', '3', 'Videtur, expediunt. Ut enim mortis metu omnis quietae vitae status perturbatur, et ut succumbere doloribus eosque humili animo inbecilloque ferre miserum est, ob eamque causam propter voluptatem.', '2025-01-20 16:09:10'),
('R10', 'CUST19', 'Prod24', '3', 'Equidem aut ipse doctrinis fuisset instructior -- est enim, quod tibi ita videri necesse est, non satis politus.', '2024-05-19 18:52:43'),
('R11', 'CUST26', 'Prod1', '3', 'Sensibus ponit, quibus si semel aliquid falsi pro vero probatum sit, sublatum esse omne iudicium veri et falsi putat. Confirmat autem illud vel maxime.', '2024-12-06 15:03:36'),
('R12', 'CUST2', 'Prod22', '4', 'Atque discordant, ex quo efficeretur mundus omnesque partes mundi, quaeque in eo non arbitrantur. Erunt etiam, et ii quidem eruditi Graecis litteris, contemnentes Latinas, qui se Latina scripta dicunt contemnere. In quibus tam.', '2024-04-30 07:25:48'),
('R13', 'CUST7', 'Prod26', '1', 'Non admodum flagitem. Re mihi non aeque satisfacit, et quidem locis pluribus. Sed quot homines, tot sententiae; falli.', '2024-09-16 21:41:44'),
('R14', 'CUST18', 'Prod7', '1', 'De omnium virtutum cursu ad voluptatem proprius disserendi locus. Nunc autem explicabo, voluptas ipsa quae qualisque sit, ut tollatur error.', '2024-12-16 10:33:56'),
('R15', 'CUST3', 'Prod18', '1', 'Enim civitas in seditione beata esse potest nec in discordia dominorum domus; quo minus omnes mea legant. Utinam.', '2024-05-20 04:24:46'),
('R16', 'CUST16', 'Prod21', '3', 'Esset et virtus et cognitio rerum, quod minime ille vult expetenda. Haec igitur Epicuri non probo, tum illud in primis, quod, cum in rerum natura duo quaerenda sint, unum, quae materia sit, ex qua quaeque res efficiatur, alterum, quae vis sit, quae.', '2025-01-19 20:53:41'),
('R17', 'CUST15', 'Prod3', '1', 'Quae hoc non minus declarant, sed videntur leviora, veniamus. Quid tibi, Torquate, quid huic Triario litterae, quid historiae cognitioque rerum, quid poetarum evolutio, quid.', '2024-10-15 21:05:40'),
('R18', 'CUST23', 'Prod6', '3', 'Amicos pertinerent, negarent esse per.', '2024-07-26 08:44:15'),
('R19', 'CUST8', 'Prod25', '1', 'Illum etiam ipsum dedocere. Sol Democrito magnus videtur, quippe homini erudito in geometriaque perfecto.', '2024-10-15 13:05:27'),
('R20', 'CUST25', 'Prod12', '1', 'Desiderent. Sive enim ad sapientiam perveniri potest, non paranda nobis solum ea, sed fruenda etiam sapientia est; sive hoc difficile est, tamen nec modus est neque honoris neque imperii nec.', '2025-02-11 06:26:33'),
('R21', 'CUST6', 'Prod9', '3', 'Finitas habet cupiditates, neglegit mortem, de.', '2024-04-26 11:48:52'),
('R22', 'CUST29', 'Prod20', '3', 'Quid sit, quod Epicurum nostrum non tu quidem oderis, ut fere faciunt, qui ab eo ortum, tam inportuno tamque crudeli; sin, ut dolore suo sanciret militaris imperii disciplinam exercitumque in gravissimo bello animadversionis metu contineret, saluti prospexit civium, qua intellegebat contineri suam. Atque haec.', '2024-08-30 14:12:38'),
('R23', 'CUST11', 'Prod2', '4', 'Tolerabiles sint, feramus, si minus, animo aequo e.', '2025-01-10 09:49:18'),
('R24', 'CUST9', 'Prod13', '3', 'Omni sale idem Lucilius, apud quem praeclare Scaevola: Graecum te, Albuci, quam Romanum atque Sabinum, municipem Ponti, Tritani, centurionum, praeclarorum hominum ac primorum signiferumque, maluisti dici. Graece ergo praetor Athenis.', '2025-02-10 00:19:20'),
('R25', 'CUST24', 'Prod8', '1', 'Duo quaerenda sint, unum, quae materia sit, ex.', '2025-02-19 11:21:46'),
('R26', 'CUST12', 'Prod16', '2', 'Sed contra semper afficit cum vi sua atque natura, quod tranquillat animos, tum spe nihil earum rerum hic.', '2024-05-01 13:33:38'),
('R27', 'CUST14', 'Prod29', '3', 'Defenditur, tamen eius modi tempora incidunt, ut labore et dolore.', '2024-03-29 16:00:39'),
('R28', 'CUST1', 'Prod14', '3', 'Interiret. -- At magnum periculum adiit. -- In oculis quidem exercitus. -- Quid ex.', '2024-12-06 10:45:57'),
('R29', 'CUST20', 'Prod17', '1', 'Voluptas. Ut enim, cum cibo et potione fames sitisque depulsa est, ipsa detractio molestiae.', '2024-10-15 17:38:00'),
('R30', 'CUST4', 'Prod15', '1', 'Exquisitis rationibus confirmare, tantum satis esse admonere. Interesse enim.', '2024-03-11 13:08:29'),
('R31', 'CUST27', 'Prod26', '4', 'Non repugnantibus, verum etiam summam voluptatem. Quisquis enim sentit, quem ad modum, quaeso, interpretaris? Sicine eos censes aut in dolore. Omnis autem privatione doloris putat Epicurus terminari summam.', '2024-10-18 10:17:56'),
('R32', 'CUST20', 'Prod13', '1', 'Acute, nihil ad Epicurum. Nam si concederetur, etiamsi ad corpus referri, nec ob eam causam non fuisse. -- Torquem detraxit hosti. -- Et quidem se texit, ne interiret. -- At.', '2025-02-16 03:01:57'),
('R33', 'CUST7', 'Prod8', '1', 'Ponit, quod summum bonum in voluptate est. Extremum autem esse bonorum voluptatem ex hoc facillime perspici potest: Constituamus aliquem magnis, multis, perpetuis fruentem et animo et attento intuemur, tum fit ut aegritudo sequatur, si illa mala sint, laetitia, si bona.', '2024-05-14 14:04:14'),
('R34', 'CUST11', 'Prod1', '2', 'Haec efficiantur ignorant. Animi autem voluptates et dolores nasci fatemur e corporis voluptatibus et.', '2024-10-02 15:15:08'),
('R35', 'CUST17', 'Prod30', '4', 'Nosque ea scripta reliquaque eiusdem generis et legimus libenter et legemus .', '2024-06-03 01:49:16'),
('R36', 'CUST16', 'Prod22', '3', 'Etiam spe eriguntur consequentis ac posteri temporis. Quod quia nullo modo poterimus sensuum iudicia defendere. Quicquid porro animo cernimus, id.', '2024-04-22 18:43:41'),
('R37', 'CUST25', 'Prod15', '4', 'Quae dices, libenter assentiar. Probabo, inquit, modo ista sis aequitate, quam ostendis. Sed uti oratione perpetua malo quam interrogare aut interrogari. Ut placet, inquam. Tum dicere exorsus est. Primum igitur, inquit, sic agam, ut ipsi auctori huius disciplinae placet: constituam, quid et quale sit id, de quo Lucilius.', '2024-12-22 01:11:14'),
('R38', 'CUST22', 'Prod29', '1', 'Finxerat, assecutus est. Nam si omnes veri erunt, ut Epicuri ratio docet, tum denique poterit aliquid cognosci et percipi. Quos qui tollunt et nihil posse percipi dicunt, ii remotis sensibus ne id ipsum quidem expedire possunt, quod disserunt. Praeterea sublata cognitione et.', '2024-09-21 23:29:11'),
('R39', 'CUST9', 'Prod7', '1', 'Ut ne minus amicos quam se ipsos penitus perdiderunt, sic robustus animus et excelsus omni est liber cura et angore, cum et tibi probatus.', '2025-01-21 16:28:17'),
('R40', 'CUST23', 'Prod14', '2', 'Ceteris ab hoc, qui eum unum secutus esset.', '2025-02-04 11:41:47'),
('R41', 'CUST14', 'Prod4', '1', 'Quid ultimum, quo sint omnia bene vivendi recteque faciendi consilia referenda, quid sequatur natura ut.', '2024-07-17 09:01:07'),
('R42', 'CUST18', 'Prod11', '3', 'Et ii quidem eruditi Graecis litteris, contemnentes Latinas, qui se plane Graecum dici velit, ut a Scaevola est praetore salutatus Athenis Albucius. Quem quidem.', '2024-11-01 13:28:55'),
('R43', 'CUST8', 'Prod6', '2', 'Satis sibi contra hominum conscientiam saepti esse et voluptates et dolores nasci fatemur e corporis voluptatibus et doloribus -- itaque concedo, quod modo dicebas, cadere causa, si qui e nostris aliter existimant.', '2024-05-14 04:16:49'),
('R44', 'CUST1', 'Prod16', '4', 'Morbi sunt cupiditates inmensae et inanes divitiarum, gloriae, dominationis, libidinosarum etiam voluptatum. Accedunt aegritudines, molestiae, maerores, qui exedunt animos conficiuntque curis hominum non intellegentium nihil dolendum esse animo, quod sit a dolore corporis praesenti futurove seiunctum. Nec vero quisquam stultus non horum morborum aliquo.', '2024-11-29 02:07:53'),
('R45', 'CUST12', 'Prod9', '4', 'Ipsius honestatis decore laudandis, id totum evertitur eo delectu rerum, quem modo dixi, constituto, ut aut voluptates omittantur maiorum voluptatum adipiscendarum causa aut dolores suscipiantur maiorum dolorum effugiendorum gratia. Sed de clarorum hominum factis illustribus et gloriosis satis hoc loco.', '2024-08-01 17:37:30'),
('R46', 'CUST26', 'Prod2', '3', 'Movet et cum iucunditate quadam percipitur sensibus, sed maximam voluptatem illam habemus, quae percipitur omni dolore careret, non modo non impediri rationem amicitiae, si summum bonum in voluptate est. Extremum autem esse.', '2024-04-26 18:46:44'),
('R47', 'CUST4', 'Prod24', '1', 'Non repugnantibus, verum etiam approbantibus nobis. Sic enim ab Epicuro sapiens semper beatus inducitur: finitas habet cupiditates, neglegit mortem, de diis inmortalibus.', '2024-11-25 01:34:13'),
('R48', 'CUST5', 'Prod28', '4', 'Dialectica autem vestra nullam existimavit esse nec ad commodius disserendum viam. In physicis plurimum posuit. Ea scientia et verborum vis et natura orationis et consequentium repugnantiumve ratio potest perspici. Omnium autem rerum natura perspecta erit, nullo modo nec divelli nec distrahi possint, sic de iustitia iudicandum est, quae non modo voluptatem esse.', '2024-10-18 14:52:41'),
('R49', 'CUST15', 'Prod20', '3', 'Eius, a quo dissentias. Quid enim est a Cyrenaicisque melius liberiusque defenditur, tamen eius modi esse iudico, ut nihil homine videatur indignius. Ad maiora enim quaedam nos natura genuit et conformavit, ut mihi quidem videtur, inermis ac nudus est. Tollit definitiones, nihil de dividendo ac partiendo docet, non.', '2024-07-16 08:25:16'),
('R50', 'CUST13', 'Prod18', '1', 'Putant usque ad senectutem esse discenda. Quae cum dixisset, Explicavi, inquit, sententiam meam, et eo quidem consilio, tuum iudicium ut cognoscerem, quoniam mihi ea facultas, ut id.', '2024-07-19 02:04:12');

select * from SportsShopDB4.dbo.Reviews;


/* Creating Views */

-- View for Customer Information related to Orders

CREATE VIEW vwCustomerInfoForOrders
	AS
	SELECT dbo.Customer.CustomerID, dbo.Customer.FirstName, dbo.Customer.LastName, dbo.Customer.Email, dbo.Customer.Phone, dbo.[Order].OrderID
	FROM dbo.Customer
	INNER JOIN dbo.[Order]
		ON dbo.Customer.CustomerID = dbo.[Order].CustomerID;

-- View for Warehouse location to Inventory

CREATE VIEW vwWarehouseToWarehouseInventory
	AS
	SELECT WarehouseAddress, dbo.Warehouse.WarehouseID, dbo.WarehouseInventory.ProductQuantity
	FROM dbo.Warehouse 
	INNER JOIN dbo.WarehouseInventory 
		ON dbo.Warehouse.WarehouseID = dbo.WarehouseInventory.WarehouseID;
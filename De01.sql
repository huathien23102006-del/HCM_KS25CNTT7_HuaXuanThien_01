create database SalesManagement_db;
use SalesManagement_db;

CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Manufacturer VARCHAR(100),
    Price DECIMAL(12,2) CHECK (Price >= 0),
    StockQty INT CHECK (StockQty >= 0)
);

CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE `Order` (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(12,2),
    CustomerID VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Order_Detail (
    OrderID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT CHECK (Quantity > 0),
    PriceAtPurchase DECIMAL(12,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

ALTER TABLE `Order`
ADD Note TEXT;

ALTER TABLE Product
CHANGE Manufacturer NhaSanXuat VARCHAR(100);

DROP TABLE Order_Detail;
DROP TABLE `Order`;

-- Phần 3

INSERT INTO Product VALUES
('P001','MacBook Air M2','Apple',25000000,10),
('P002','iPhone 15','Apple',20000000,20),
('P003','Dell XPS 13','Dell',22000000,15),
('P004','Asus ROG','Asus',30000000,5),
('P005','HP Pavilion','HP',15000000,12);

INSERT INTO Customer VALUES
('C001','Nguyen Van A','a@gmail.com','0123456789','HCM'),
('C002','Tran Thi B','b@gmail.com',NULL,'HN'),
('C003','Le Van C','c@gmail.com','0987654321','DN'),
('C004','Pham Thi D','d@gmail.com','0111222333','HCM'),
('C005','Hoang Van E','e@gmail.com',NULL,'HN');

INSERT INTO `Order` VALUES
('DH001','2026-04-01',50000000,'C001',NULL),
('DH002','2026-04-02',20000000,'C002',NULL),
('DH003','2026-04-03',30000000,'C003',NULL),
('DH004','2026-04-04',15000000,'C004',NULL),
('DH005','2026-04-05',22000000,'C005',NULL);

INSERT INTO Order_Detail VALUES
('DH001','P001',1,25000000),
('DH001','P002',1,20000000),
('DH002','P002',1,20000000),
('DH003','P004',1,30000000),
('DH004','P005',1,15000000);

UPDATE Product
SET Price = Price * 1.1
WHERE NhaSanXuat = 'Apple';

DELETE FROM Customer
WHERE Phone IS NULL;

-- Phần 4

SELECT *
FROM Product 
WHERE Price BETWEEN 10000000 AND 20000000;

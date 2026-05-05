
CREATE DATABASE LittleLemonDB;
USE LittleLemonDB;

-- 2. Customers T
CREATE TABLE Customers (
    CustomerID VARCHAR(50) NOT NULL PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    City VARCHAR(100),
    Country VARCHAR(100)
);

-- 3. Menu 
CREATE TABLE Menu (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255),
    CuisineName VARCHAR(100),
    StarterName VARCHAR(100)
);

-- 4. Orders T
CREATE TABLE Orders (
    OrderID VARCHAR(50) NOT NULL PRIMARY KEY,
    OrderDate DATE,
    Quantity INT,
    TotalCost DECIMAL(10, 2),
    CustomerID VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Customers
INSERT INTO Customers (CustomerID, FullName, City, Country)
VALUES 
('72-055-7985', 'Laney Fadden', 'Daruoyan', 'China'),
('65-353-0657', 'Giacopo Bramich', 'Ongjin', 'North Korea'),
('90-876-6799', 'Lia Bonar', 'Quince Mil', 'Peru'),
('73-873-4827', 'Merrill Baudon', 'Susaki', 'Japan');

-- Insert Orders
INSERT INTO Orders (OrderID, OrderDate, Quantity, TotalCost, CustomerID)
VALUES 
('54-366-6861', '2020-06-15', 2, 125.00, '72-055-7985'),
('63-761-3686', '2020-08-25', 1, 235.00, '65-353-0657'),
('65-351-6434', '2021-08-17', 3, 75.00, '90-876-6799');

SELECT * FROM Customers;
SELECT * FROM Orders;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order"
    FROM Orders;
END //

DELIMITER ;


DROP TABLE IF EXISTS Bookings;

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    CustomerID VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
VALUES 
('2022-10-10', 5, '72-055-7985'),
('2022-11-12', 3, '65-353-0657'),
('2022-10-11', 2, '90-876-6799');


DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS "Max Quantity in Order" FROM Orders;
END //

DELIMITER ;

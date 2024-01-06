SHOW DATABASES;
USE littlelemondb;
DROP VIEW IF EXISTS OrderStats;
CREATE VIEW OrderStats AS SELECT OrderID, Quantity, TotalCost FROM Orders WHERE Quantity >= 2;
SELECT * FROM OrderStats;

SELECT Customer.CustomerID, Customer.CustomerName, Orders.OrderID,
Orders.TotalCost, MenuItem.MenuItem, MenuItem.Cuisine, MenuItem.ItemType 
FROM Customer JOIN Orders JOIN MenuItem JOIN OrderItems
ON (Customer.CustomerID = Orders.CustomerID 
AND Orders.OrderID = OrderItems.OrderID
AND OrderItems.MenuItemID = MenuItem.MenuItemID)
WHERE Orders.TotalCost > 150
ORDER BY Orders.TotalCost ASC;

SELECT MenuItem FROM MenuItem JOIN OrderItems ON MenuItem.MenuItemID = OrderItems.MenuItemID WHERE OrderID = ANY 
(SELECT OrderID FROM Orders WHERE Quantity >= 2);

CREATE PROCEDURE GetMaxQuantity() SELECT MAX(Quantity) FROM Orders;
CALL GetMaxQuantity();

PREPARE GetOrderDetails FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';
SET @id = 1;
EXECUTE GetOrderDetails USING @id;

INSERT INTO Orders
VALUES
(11, '2024-01-04', 6, 90, 8),
(12, '2024-01-04', 8, 400, 6);

DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(ID INT) 
BEGIN
DELETE FROM Orders WHERE OrderID = ID;
SELECT CONCAT('Order ', ID, ' is cancelled') AS 'Confirmation';
END //
DELIMITER ;

CALL CancelOrder(12);

SELECT * FROM Orders;

INSERT INTO Bookings
VALUES
(9, '2022-10-10', 5, 1, 2),
(10, '2022-11-12', 3, 3, 1),
(11, '2022-10-11', 2, 2, 3),
(12, '2022-10-13', 2, 1, 5);

DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(IN dt DATE, IN tble INT)
BEGIN
IF dt = (SELECT Date FROM Bookings WHERE Date = dt AND TableNumber = tble) THEN SELECT CONCAT('Table #', tble, ' is booked for ', dt) AS 'Booking Status';
END IF;
END //
DELIMITER ;

CALL CheckBooking('2022-10-10', 5);


DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(dt DATE, tble INT)
BEGIN
DECLARE id INT;
START TRANSACTION;
SELECT (MAX(BookingID) + 1) FROM Bookings INTO id;

IF dt = (SELECT Date FROM Bookings WHERE Date = dt AND TableNumber = tble) 
THEN SELECT CONCAT('Table #', tble, ' is already booked for ', dt, ' - booking cancelled!') AS 'Booking Status';
ROLLBACK;
ELSE 
INSERT INTO Bookings
VALUES 
(id, dt, tble, 1, 1);
SELECT CONCAT('Table #', tble, ' was booked for ', dt) AS 'Booking Status';

END IF;
END //

DELIMITER ;

CALL AddValidBooking('2024-12-04', 2);


DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE AddBooking(id INT, dt DATE, tble INT, c_id INT, s_id INT)
BEGIN

INSERT INTO Bookings
VALUES 
(id, dt, tble, c_id, s_id);
SELECT CONCAT('New Booking # ', id , ' was addded') AS 'Confirmation';
END //

DELIMITER ;

CALL AddBooking(9, '2022-10-10', 3, 4, 2);


DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //
CREATE PROCEDURE UpdateBooking(id INT, dt DATE)
BEGIN
UPDATE Bookings SET Date = dt WHERE BookingID = id; 
SELECT CONCAT('Booking # ', id , ' was updated') AS 'Confirmation';
END //
DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');


DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //
CREATE PROCEDURE CancelBooking(id INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = id; 
SELECT CONCAT('Booking #', id , ' cancelled') AS 'Confirmation';
END //
DELIMITER ;

CALL CancelBooking(9);



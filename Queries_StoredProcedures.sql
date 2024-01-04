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

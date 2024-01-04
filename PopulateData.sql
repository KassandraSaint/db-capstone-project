INSERT INTO Customer
VALUES 
(1, 'Vanessa McCarthy', 757536378, 'vm@mangatagallo.com'), 
(2, 'Marcos Romero', 757536379, 'mr@mangatagallo.com'), 
(3, 'Hiroki Yamane', 757536376, 'hy@mangatagallo.com'), 
(4, 'Anna Iversen', 757536375, 'ai@mangatagallo.com'), 
(5, 'Diana Pinto', 757536374, 'dp@mangatagallo.com'),
(6, 'Matthew Anders', 5614836453, 'goodmat@gmail.com'),
(7, 'Kassandra Saint', 5613604241, 'kassandrastripper@gmail.com'),
(8, 'Dmytro Salko', 5614609421, 'dm.salko@gmail.com');

INSERT INTO orders 
VALUES 
(1, '2022-10-15', 1, 100, 1), 
(2, '2022-10-16', 2, 150, 2), 
(3, '2022-10-17', 1, 200, 3), 
(4, '2022-10-17', 1, 150, 4), 
(5, '2022-10-18', 3, 230, 5),
(6, '2023-01-15', 2, 180, 6), 
(7, '2023-01-16', 3, 310, 7), 
(8, '2023-02-17', 1, 90, 8), 
(9, '2023-02-17', 2, 120, 2), 
(10, '2023-02-18', 4, 212, 7);

INSERT INTO DeliveryStats
VALUES 
(1, '2022-10-17', 'Done', 1), 
(2, '2022-10-20', 'Done', 2), 
(3, '2022-10-22', 'Done', 3), 
(4, '2022-10-25', 'Done', 4), 
(5, '2022-10-27', 'Done', 5),
(6, '2022-11-30', 'In Progress', 6),
(7, '2023-01-15', 'In Cue', 7),
(8, '2023-12-24', 'In Progress', 8),
(9, '2023-12-24', 'Done', 9),
(10, '2023-12-24', 'In Cue', 10);

INSERT INTO Staff
VALUES
(1, 'Waiter', 42000),
(2, 'Assistant', 32000),
(3, 'Cook', 50100),
(4, 'Waiter', 36000),
(5, 'Manager', 73000);

INSERT INTO Bookings
VALUES
(1, '2023-12-04', 2, 7, 1),
(2, '2023-12-04', 1, 8, 2),
(3, '2023-12-04', 3, 5, 1),
(4, '2023-12-05', 4, 1, 3),
(5, '2023-12-05', 1, 2, 2),
(6, '2023-12-06', 1, 4, 4),
(7, '2023-12-06', 2, 3, 1),
(8, '2023-12-06', 4, 6, 2);

INSERT INTO Menu
VALUES
(1, 'Breakfast'),
(2, 'Lunch'),
(3, 'Dinner');

INSERT INTO MenuItem
VALUES
(1, 'Olives', 'Italian','Starters', 3),
(2, 'Flatbread', 'Italian', 'Starters', 2),
(3, 'Minestrone', 'Italian', 'Starters', 2),
(4, 'Tomato bread', 'American', 'Starters', 1),
(5, 'Falafel', 'Turkish', 'Starters', 3),
(6, 'Hummus', 'Kosher', 'Starters', 1),
(7, 'Greek salad', 'Greek', 'Main Courses', 2),
(8, 'Bean soup', 'Mexican', 'Main Courses', 2),
(9, 'Pizza', 'Italian', 'Main Courses', 3),
(10, 'Greek yoghurt', 'Greek','Desserts', 1),
(11, 'Ice cream', 'Turkish', 'Desserts', 2),
(12, 'Cheesecake', 'Italian', 'Desserts', 3),
(13, 'Athens White wine', 'Greek', 'Drinks', 3),
(14, 'Corfu Red Wine', 'French', 'Drinks', 3),
(15, 'Turkish Coffee', 'Italian', 'Drinks', 1),
(16, 'Turkish Delight', 'Turkish', 'Drinks', 1),
(17, 'Kabasa', 'Turkish', 'Main Courses', 2),
(18, 'Borscht', 'Ukrainian', 'Main Course', 2);


INSERT INTO OrderItems
VALUES
(1, 18, 10),
(2, 15, 10),
(3, 4, 10),
(4, 17, 1),
(5, 14, 1),
(6, 13, 2),
(7, 1, 3),
(8, 11, 3),
(9, 4, 3),
(10, 10, 4),
(11, 8, 5),
(12, 9, 5),
(13, 16, 6),
(14, 12, 6),
(15, 4, 6),
(16, 7, 7),
(17, 6, 8),
(18, 3, 8),
(19, 2, 9),
(20, 15, 9),
(21, 14, 9);
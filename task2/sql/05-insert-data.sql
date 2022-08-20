-- Populate customer table
INSERT INTO 
    customer(customer_id, customer_name, customer_phone) 
VALUES
    (1,'Alex',12345678),
    (2,'Bella',44448888),
    (3,'Charles',87654321),
    (4,'David',11223344);

-- Populate salesperson table
INSERT INTO 
    salesperson(salesperson_id, salesperson_name, salesperson_phone) 
VALUES
    (11,'Xander',13572468),
    (12,'Yosef',43218765),
    (13,'Zach',21436587);

-- Populate manufacturer table
INSERT INTO 
    manufacturer(manufacturer_id, manufacturer_name)
VALUES
    (21,'Hoondai'),
    (22,'Tezzlah');

-- Populate car table
INSERT INTO 
    car(car_id, manufacturer_id, serial_number, weight_kg, price_sgd)
VALUES
    (100,21,18756,1054.25,85300.50),
    (101,22,22786,1213.50,96200.00),
    (102,21,38166,1326.50,81200.00),
    (103,21,41253,2137.25,79900.00),
    (104,21,52557,1142.25,111500.00),
    (105,22,63759,1151.50,71300.00),
    (106,21,74179,1564.25,77300.00),
    (107,21,85251,1275.25,88500.50),
    (108,21,96352,2384.25,99100.00),
    (109,22,91735,1698.50,124400.50);

-- Populate transaction table
INSERT INTO 
    transaction(transaction_id, customer_id, salesperson_id, car_id, timestamp)
VALUES
    (1001,1,11,100,'2021-01-01 09:10:25'),
    (1002,1,12,101,'2021-01-01 19:00:12'),
    (1003,2,13,102,'2021-01-12 11:15:23'),
    (1004,1,11,103,'2021-01-20 13:23:28'),
    (1005,1,11,104,'2021-02-04 17:55:31'),
    (1006,2,12,105,'2021-02-07 11:49:55'),
    (1007,3,12,106,'2021-03-11 15:41:17'),
    (1008,2,12,107,'2021-03-17 16:37:33');

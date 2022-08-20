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
    (22,'Tezzlah'),
    (23,'Zyuzyuki'),
    (24,'Fjord');

-- Populate car table
INSERT INTO 
    car(car_id, manufacturer_id, serial_number, weight_kg, price_sgd)
VALUES
    (100,21,18756,1054.25,853000.50),
    (101,22,22786,1213.50,962000.00),
    (102,21,38166,1326.50,812000.00),
    (103,23,41253,2137.25,799000.00),
    (104,23,52557,1142.25,1115000.00),
    (105,22,63759,1151.50,713000.00),
    (106,21,74179,1564.25,773000.00),
    (107,21,85251,1275.25,885000.50),
    (108,24,96352,2384.25,991000.00),
    (109,22,91735,1698.50,1244000.50);

-- Populate transaction table
INSERT INTO 
    transaction(transaction_id, customer_id, salesperson_id, car_id, timestamp)
VALUES
    (1001,1,11,100,'2022-08-01 09:10:25+00'),
    (1002,1,12,101,'2022-08-01 19:00:12+00'),
    (1003,2,13,102,'2022-08-02 11:15:23+00'),
    (1004,1,11,103,'2022-08-04 13:23:28+00'),
    (1005,1,11,104,'2022-08-11 17:55:31+00'),
    (1006,2,12,105,'2022-08-17 11:49:55+00'),
    (1007,3,12,106,'2022-08-19 15:41:17+00'),
    (1008,2,12,107,'2022-08-26 16:37:33+00');

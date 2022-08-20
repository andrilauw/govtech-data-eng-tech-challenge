CREATE TABLE IF NOT EXISTS car (
    car_id int PRIMARY KEY,
    manufacturer_id int NOT NULL,
    serial_number int NOT NULL,
    weight_kg numeric(10,2),
    price_sgd numeric(15,2),
    CONSTRAINT fk1_manufacturer
      FOREIGN KEY(manufacturer_id) 
        REFERENCES manufacturer(manufacturer_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
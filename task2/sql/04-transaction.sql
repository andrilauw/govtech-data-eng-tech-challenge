CREATE TABLE IF NOT EXISTS transaction (
    transaction_id int PRIMARY KEY,
    customer_id int NOT NULL,
    salesperson_id int NOT NULL,
    car_id int NOT NULL,
    CONSTRAINT fk1_customer
      FOREIGN KEY(customer_id) 
        REFERENCES customer(customer_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk2_salesperson
      FOREIGN KEY(salesperson_id) 
        REFERENCES salesperson(salesperson_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk3_car
      FOREIGN KEY(car_id) 
        REFERENCES car(car_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
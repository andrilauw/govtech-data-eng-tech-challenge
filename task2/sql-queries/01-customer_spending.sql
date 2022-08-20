-- I want to know the list of our customers and their spending.

WITH spending_per_customer AS (
    SELECT
        trx.customer_id
        , SUM(car.price_sgd) AS total_price
    FROM 
        transaction trx
    INNER JOIN
        car
    ON
        trx.car_id = car.car_id
    GROUP BY
        trx.customer_id
)

SELECT
    cst.customer_id
    , cst.customer_name
    , spc.total_price
FROM
    customer cst
LEFT OUTER JOIN
    spending_per_customer spc
ON
    cst.customer_id = spc.customer_id
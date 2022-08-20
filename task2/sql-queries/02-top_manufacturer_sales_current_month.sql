-- I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.


SELECT
    car.manufacturer_id
    , COUNT(trx.transaction_id) AS total_sales
FROM 
    transaction trx
INNER JOIN
    car
ON
    trx.car_id = car.car_id
WHERE
    date_part('month', trx.timestamp) = date_part('month', (SELECT current_timestamp))
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    3

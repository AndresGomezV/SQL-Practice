SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

CREATE TRIGGER customer_updated
BEFORE UPDATE ON customers
FOR EACH ROW
EXECUTE PROCEDURE log_customers_change();

UPDATE customers
SET first_name = 'Andrew'
WHERE customer_id = 1;

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

UPDATE customers
SET years_old = '25'
WHERE last_name = 'Hall';

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

CREATE TRIGGER customer_insert
AFTER INSERT ON customers
FOR EACH STATEMENT
EXECUTE PROCEDURE log_customers_change();

INSERT INTO customers (first_name, last_name)
VALUES ('An', 'Cort'),
       ('And', 'Gom'),
       ('San', 'Gom');

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

CREATE TRIGGER customer_min_age
BEFORE UPDATE ON customers
FOR EACH ROW
WHEN (NEW.years_old < 13)
EXECUTE PROCEDURE override_with_min_age();

UPDATE customers
SET years_old = 26
WHERE customer_id = 1;

UPDATE customers
SET years_old = 12
WHERE customer_id = 3;

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

UPDATE customers
SET last_name = 'haha'
WHERE customer_id = 1;

UPDATE customers
SET last_name = 'hehe'
WHERE customer_id = 3;

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

UPDATE customers
SET years_old = 12,
    first_name = 'HOLA'
WHERE customer_id = 2;

SELECT * 
FROM customers
ORDER BY customer_id;

SELECT *
FROM customers_log;

DROP TRIGGER customer_min_age ON customers;

SELECT * FROM information_schema.triggers;














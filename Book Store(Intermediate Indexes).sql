SELECT *
FROM customers
LIMIT 10;

SELECT *
FROM orders
LIMIT 10;

SELECT *
FROM books
LIMIT 10;

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_Indexes
WHERE tablename = 'orders';

SELECT *
FROM pg_Indexes
WHERE tablename = 'books';

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE quantity > 18;

CREATE INDEX orders_quantity_over_18_idx ON orders (quantity)
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

ALTER TABLE customers
ADD CONSTRAINT customers_pkey
  PRIMARY KEY (customer_id);

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

CLUSTER customers USING customers_pkey;

SELECT *
FROM customers
LIMIT 10;

CREATE INDEX customer_id_book_id_idx ON orders (customer_id, book_id);

DROP INDEX customer_id_book_id_idx;

CREATE INDEX customer_id_book_id_quantity_idx ON orders (customer_id, book_id, quantity);

DROP INDEX IF EXISTS books_author_idx;

DROP INDEX IF EXISTS books_title_idx;

CREATE INDEX books_author_title_idx ON books (author, title);

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE (quantity * price_base) > 100;

CREATE INDEX total_price_idx on orders ((quantity * price_base)); -- índice en la expresión calculada (quantity * price_base) para optimizar esta consulta

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE (quantity * price_base) > 100;

CREATE INDEX customers_last_name_first_name_email_address ON customers (last_name, first_name, email_address);

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname; --SINTAX DE UN SOLO STATEMENT.
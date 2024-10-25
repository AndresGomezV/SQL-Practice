SELECT *
FROM books
LIMIT 10;

SELECT *
FROM customers
LIMIT 10;

SELECT *
FROM orders
LIMIT 10;

CREATE INDEX customer_id_idx ON orders (customer_id);

SELECT *
FROM pg_Indexes
WHERE tablename = 'books';

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_Indexes
WHERE tablename = 'orders';

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty (pg_total_relation_size('books'));

CREATE INDEX translating_books_idx ON books (original_language, title, sales_in_millions);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty (pg_total_relation_size('books'));

DROP INDEX translating_books_idx;
DROP INDEX customer_id_idx;


SELECT NOW();

\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;
--EXPLAIN ANALYZE doesn’t work on the COPY call, so we are using a timestamp before and after we load the information into the database. Make a note of the time difference between the two timestamps as they will get erased in the next task.

SELECT NOW();

CREATE INDEX customer_id_idx ON orders (customer_id);

CREATE INDEX translating_books_idx ON books (original_language, title, sales_in_millions);

EXPLAIN ANALYZE SELECT email_address, first_name
FROM customers;

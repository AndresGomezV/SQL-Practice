CREATE TABLE customers (
    customer_id integer PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email_address varchar(50) UNIQUE,
    phone_number varchar(50),
    shipping_address varchar(50)
);

CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    customer_id integer REFERENCES customers(customer_id),
    date date,
    status varchar(50),
    shipping_address varchar(50),
);

CREATE TABLE payments (
    payment_id integer PRIMARY KEY,
    order_id integer REFERENCES orders(order_id),
    method varchar(50),
    amount money,
    date date,
    status varchar(50)
);

CREATE TABLE products (
    product_id integer PRIMARY KEY,
    name varchar(50),
    price money,
    description varchar(100),
    availability boolean,
    category varchar(50)
);

CREATE TABLE order_items (
    order_item_id integer PRIMARY KEY,
    order_id integer REFERENCES orders(order_id),
    product_id integer REFERENCES products(product_id),
    quantity integer,
    price money
);
--Para representar una relación de muchos a muchos (Many to Many) entre las tablas Orders y Products, crear una tabla intermedia (a menudo llamada tabla de asociación o tabla de enlace) que contenga las claves primarias de ambas tablas. Permitirá que una orden contenga múltiples productos y que un producto pueda aparecer en múltiples órdenes.

CREATE TABLE order_products (
    order_id integer REFERENCES orders(order_id),
    product_id integer REFERENCES products(product_id),
    quantity integer,
    PRIMARY KEY (order_id, product_id)
);

INSERT INTO customers (customer_id, first_name, last_name, email_address, phone_number, shipping_address)
VALUES (1, 'Andrew', 'G.', 'andrewg@gmail.com', 3245768250, 'Cl 1E # 21-89');

INSERT INTO products (product_id, name, price, description, availability, category)
VALUES (1, 'Mouse', 50, 'Bluetooth Mouse', TRUE, 'Technology');

INSERT INTO orders (order_id, customer_id, date, status, shipping_address, payment_id)
VALUES (1, 1, '2024-10-23', 'Pending', 'Cl 1E # 21-89', 1);

INSERT INTO payments (payment_id, order_id, method, amount, date, status)
VALUES (1, 1, 'Credit Card', 50, '2024-10-23', 'Complete')

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price)
VALUES (1, 1, 1, 1, 50);

INSERT INTO orders (order_id, customer_id, date, status, shipping_address)
VALUES (2, 1, '2024-10-23', 'Pending', 'Cl 1E # 21-89');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price)
VALUES (2, 2, 1, 1, 50);

INSERT INTO products (product_id, name, price, description, availability, category)
VALUES (2, 'Keyboard', 80, 'Bluetooth Keyboard', TRUE, 'Technology');

INSERT INTO order_products (order_id, product_id, quantity)
VALUES (1, 1, 2), -- 2 unidades del Producto A
       (1, 2, 1); -- 1 unidad del Producto B
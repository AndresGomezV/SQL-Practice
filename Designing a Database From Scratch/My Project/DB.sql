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
    payment_id integer REFERENCES payments(payment_id)
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


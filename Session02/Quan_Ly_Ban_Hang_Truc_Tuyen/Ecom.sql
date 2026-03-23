CREATE DATABASE EcommerceDB;

CREATE SCHEMA shop;

CREATE TABLE users
(
    user_id  SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email    VARCHAR(100),
    password VARCHAR(100),
    role     VARCHAR(20)
);

CREATE TABLE categories
(
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE products
(
    product_id   SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price        NUMERIC(10, 2),
    stock        INTEGER,
    category_id  INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE orders
(
    order_id   SERIAL PRIMARY KEY,
    user_id    INTEGER,
    order_date DATE,
    status     VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE orderdetails
(
    order_detail_id SERIAL PRIMARY KEY,
    order_id        INTEGER,
    product_id      INTEGER,
    quantity        INTEGER,
    price_each      NUMERIC(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE payments
(
    payment_id   SERIAL PRIMARY KEY,
    order_id     INTEGER,
    amount       NUMERIC(10, 2),
    payment_date DATE,
    method       VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
CREATE DATABASE SaleDB;

CREATE SCHEMA sales;

SET search_path TO sales;

CREATE TABLE sales.Customers
(
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(100) NOT NULL UNIQUE,
    phone       VARCHAR(20)
);

CREATE TABLE sales.Products
(
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(100)   NOT NULL,
    price          NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT            NOT NULL CHECK (stock_quantity >= 0)
);

CREATE TABLE sales.Orders
(
    order_id    SERIAL PRIMARY KEY,
    customer_id INT  NOT NULL,
    order_date  DATE NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
            REFERENCES Customers (customer_id)
);

CREATE TABLE sales.OrderItems
(
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL CHECK (quantity >= 1),
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id)
            REFERENCES Orders (order_id),
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id)
            REFERENCES Products (product_id)
);
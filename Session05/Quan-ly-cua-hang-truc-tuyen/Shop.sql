create schema Shop;

CREATE TABLE shop.customers
(
    customer_id   SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city          VARCHAR(50)
);

CREATE TABLE shop.orders
(
    order_id     SERIAL PRIMARY KEY,
    customer_id  INT REFERENCES shop.customers (customer_id),
    order_date   DATE,
    total_amount NUMERIC(10, 2)
);

CREATE TABLE shop.order_items
(
    item_id      SERIAL PRIMARY KEY,
    order_id     INT REFERENCES shop.orders (order_id),
    product_name VARCHAR(100),
    quantity     INT,
    price        NUMERIC(10, 2)
);

INSERT INTO shop.customers (customer_name, city)
VALUES ('Nguyễn Văn A', 'Hà Nội'),
       ('Trần Thị B', 'Đà Nẵng'),
       ('Lê Văn C', 'Hồ Chí Minh'),
       ('Phạm Thị D', 'Hà Nội');

INSERT INTO shop.orders (customer_id, order_date, total_amount)
VALUES (1, '2024-12-20', 3000),
       (2, '2025-01-05', 1500),
       (1, '2025-02-10', 2500),
       (3, '2025-02-15', 4000),
       (4, '2025-03-01', 800);

INSERT INTO shop.order_items (order_id, product_name, quantity, price)
VALUES (1, 'Laptop', 2, 1500),
       (2, 'Chuột', 1, 1500),
       (3, 'Bàn phím', 5, 500),
       (4, 'Chuột', 4, 1000);

/*
1. ALIAS
 */
SELECT c.customer_name AS "Tên khách",
       o.order_date    AS "Ngày đặt hàng",
       o.total_amount  AS "Tổng tiền"
FROM shop.customers c
         JOIN shop.orders o ON c.customer_id = o.customer_id;

/*
 2. Aggregate Functions
 */
SELECT
    SUM(total_amount) AS "Tổng doanh thu",
    AVG(total_amount) AS "Trung bình",
    MAX(total_amount) AS "Lớn nhất",
    MIN(total_amount) AS "Nhỏ nhất",
    COUNT(order_id) AS "Số đơn"
FROM shop.orders;

/*
 3. GROUP BY / HAVING
 */

SELECT c.city,
       SUM(o.total_amount) AS total_revenue
FROM shop.customers c
         JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount) > 10000;

/*
 4 Join 3 bảng
 */

SELECT c.customer_name,
       o.order_date,
       oi.product_name,
       oi.quantity,
       oi.price
FROM shop.customers c
         JOIN shop.orders o ON c.customer_id = o.customer_id
         JOIN shop.order_items oi ON o.order_id = oi.order_id;

/*
 5. Subquery – khách hàng chi nhiều nhất
 */

SELECT c.customer_name,
       SUM(o.total_amount) AS total_revenue
FROM shop.customers c
         JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) = (SELECT MAX(total_revenue)
                              FROM (SELECT customer_id, SUM(total_amount) AS total_revenue
                                    FROM shop.orders
                                    GROUP BY customer_id) t);
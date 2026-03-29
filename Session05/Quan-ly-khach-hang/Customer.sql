create schema Customer;

CREATE TABLE Customer.customers
(
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city          VARCHAR(100)
);

CREATE TABLE Customer.orders
(
    order_id    INT PRIMARY KEY,
    customer_id INT,
    order_date  DATE,
    total_price NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer.customers (customer_id)
);

CREATE TABLE Customer.order_items
(
    item_id    INT PRIMARY KEY,
    order_id   INT,
    product_id INT,
    quantity   INT,
    price      NUMERIC(10, 2),
    FOREIGN KEY (order_id) REFERENCES Customer.orders (order_id)
);

INSERT INTO Customer.customers (customer_id, customer_name, city)
VALUES (1, 'Nguyễn Văn A', 'Hà Nội'),
       (2, 'Trần Thị B', 'Đà Nẵng'),
       (3, 'Lê Văn C', 'Hồ Chí Minh'),
       (4, 'Phạm Thị D', 'Hà Nội');

INSERT INTO Customer.orders (order_id, customer_id, order_date, total_price)
VALUES (101, 1, '2024-12-20', 3000),
       (102, 2, '2025-01-05', 1500),
       (103, 1, '2025-02-10', 2500),
       (104, 3, '2025-02-15', 4000),
       (105, 4, '2025-03-01', 800);

INSERT INTO Customer.order_items (item_id, order_id, product_id, quantity, price)
VALUES (1, 101, 1, 2, 1500),
       (2, 102, 2, 1, 1500),
       (3, 103, 3, 5, 500),
       (4, 104, 2, 4, 1000);

/*
 1) Tổng doanh thu và tổng số đơn hàng của mỗi khách hàng
 */

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_price) AS total_revenue,
    COUNT(o.order_id) AS order_count
FROM Customer.customers c
         JOIN Customer.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_price) > 2000;

/*
 2) Subquery: doanh thu trung bình của tất cả khách hàng
 */

SELECT c.customer_id,
       c.customer_name,
       SUM(o.total_price) AS total_revenue
FROM Customer.customers c
         JOIN Customer.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_price) > (SELECT AVG(customer_revenue)
                             FROM (SELECT customer_id,
                                          SUM(total_price) AS customer_revenue
                                   FROM Customer.orders
                                   GROUP BY customer_id) t);

/*
3) Dùng HAVING + GROUP BY để lọc ra thành phố có tổng doanh thu cao nhất
 */
SELECT c.city,
       SUM(o.total_price) AS total_revenue
FROM Customer.customers c
         JOIN Customer.orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_price) = (SELECT MAX(city_revenue)
                             FROM (SELECT c2.city,
                                          SUM(o2.total_price) AS city_revenue
                                   FROM Customer.customers c2
                                            JOIN Customer.orders o2 ON c2.customer_id = o2.customer_id
                                   GROUP BY c2.city) t);
/*
 4) Mở rộng: INNER JOIN 3 bảng để hiển thị chi tiết
 */
SELECT
    c.customer_name,
    c.city,
    SUM(oi.quantity) AS total_products,
    SUM(oi.quantity * oi.price) AS total_spending
FROM Customer.customers c
         JOIN Customer.orders o ON c.customer_id = o.customer_id
         JOIN Customer.order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city;
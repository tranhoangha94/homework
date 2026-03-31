create schema ECom;

CREATE TABLE ecom.customer
(
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE ecom.orders
(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES ecom.customer(customer_id),
    total_amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE ecom.product
(
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

CREATE TABLE ecom.order_detail
(
    order_id INT REFERENCES ecom.orders(order_id),
    product_id INT REFERENCES ecom.product(product_id),
    quantity INT
);

INSERT INTO ecom.customer (full_name, region)
VALUES
    ('Nguyễn Văn A', 'Hà Nội'),
    ('Trần Thị B', 'Đà Nẵng'),
    ('Lê Văn C', 'Hồ Chí Minh'),
    ('Phạm Thị D', 'Hà Nội'),
    ('Hoàng Văn E', 'Đà Nẵng');

INSERT INTO ecom.orders (customer_id, total_amount, order_date, status)
VALUES
    (1, 3000, '2025-01-01', 'Completed'),
    (1, 2500, '2025-01-10', 'Completed'),
    (2, 1500, '2025-01-05', 'Completed'),
    (2, 2000, '2025-02-01', 'Completed'),
    (3, 4000, '2025-02-10', 'Completed'),
    (3, 3500, '2025-03-01', 'Completed'),
    (4, 800,  '2025-03-05', 'Completed'),
    (5, 1200, '2025-03-10', 'Completed');

/*
 1: View tổng doanh thu theo khu vực
*/

CREATE OR REPLACE VIEW ecom.v_revenue_by_region AS
SELECT
    c.region,
    SUM(o.total_amount) AS total_revenue
FROM ecom.customer c
         JOIN ecom.orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

/* Xem dữ liệu */
SELECT * FROM ecom.v_revenue_by_region;

/* Top 3 khu vực có doanh thu cao nhất */
SELECT *
FROM ecom.v_revenue_by_region
ORDER BY total_revenue DESC
LIMIT 3;



/*
2: Nested View (doanh thu > trung bình)
*/

CREATE OR REPLACE VIEW ecom.v_revenue_above_avg AS
SELECT *
FROM ecom.v_revenue_by_region
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM ecom.v_revenue_by_region
);

/* Xem kết quả */
SELECT * FROM ecom.v_revenue_above_avg;
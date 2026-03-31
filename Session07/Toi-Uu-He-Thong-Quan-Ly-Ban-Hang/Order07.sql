create schema Shop;

CREATE TABLE shop.customers
(
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE shop.products
(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category TEXT[],
    price NUMERIC(10,2)
);

CREATE TABLE shop.orders
(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES shop.customers(customer_id),
    product_id INT REFERENCES shop.products(product_id),
    order_date DATE,
    quantity INT
);

/*
 1. INSERT DATA
    - 5 customers
    - 5 products
    - 10 orders
*/

INSERT INTO shop.customers (full_name, email, city)
VALUES
    ('Nguyễn Văn An', 'an.nguyen@gmail.com', 'Hà Nội'),
    ('Trần Thị Bình', 'binh.tran@gmail.com', 'Đà Nẵng'),
    ('Lê Văn Cường', 'cuong.le@gmail.com', 'Hồ Chí Minh'),
    ('Phạm Thị Dung', 'dung.pham@gmail.com', 'Hải Phòng'),
    ('Hoàng Văn Em', 'em.hoang@gmail.com', 'Hà Nội');

INSERT INTO shop.products (product_name, category, price)
VALUES
    ('Laptop Dell XPS 13', ARRAY['Electronics', 'Laptop'], 950.00),
    ('iPhone 14', ARRAY['Electronics', 'Phone'], 1000.00),
    ('Tai nghe Sony', ARRAY['Electronics', 'Audio'], 700.00),
    ('Bàn phím cơ Razer', ARRAY['Accessories', 'Gaming'], 550.00),
    ('Chuột Logitech M90', ARRAY['Accessories', 'Office'], 300.00);

INSERT INTO shop.orders (customer_id, product_id, order_date, quantity)
VALUES
    (1, 1, '2025-01-05', 1),
    (1, 3, '2025-01-15', 2),
    (2, 2, '2025-01-20', 1),
    (2, 5, '2025-02-01', 3),
    (3, 1, '2025-02-10', 1),
    (3, 4, '2025-02-15', 2),
    (4, 3, '2025-03-01', 1),
    (4, 5, '2025-03-05', 4),
    (5, 2, '2025-03-10', 1),
    (5, 4, '2025-03-12', 1);

/*
 2. EXPLAIN ANALYZE BEFORE INDEX
*/

/* Tìm khách hàng theo email */
EXPLAIN ANALYZE
SELECT *
FROM shop.customers
WHERE email = 'an.nguyen@gmail.com';

/* Tìm sản phẩm có category chứa 'Electronics' */
EXPLAIN ANALYZE
SELECT *
FROM shop.products
WHERE category @> ARRAY['Electronics'];

/* Tìm sản phẩm trong khoảng giá 500 đến 1000 */
EXPLAIN ANALYZE
SELECT *
FROM shop.products
WHERE price BETWEEN 500 AND 1000;

/*
 3. CREATE INDEXES
*/

/* B-tree trên email */
CREATE INDEX idx_customers_email
    ON shop.customers(email);

/* Hash trên city */
CREATE INDEX idx_customers_city_hash
    ON shop.customers USING HASH(city);

/* GIN trên category */
CREATE INDEX idx_products_category_gin
    ON shop.products USING GIN(category);

/* GiST trên price
   cần extension btree_gist
*/
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE INDEX idx_products_price_gist
    ON shop.products USING GIST(price);

/*
 4. EXPLAIN ANALYZE AFTER INDEX
*/

/* Tìm khách hàng theo email */
EXPLAIN ANALYZE
SELECT *
FROM shop.customers
WHERE email = 'an.nguyen@gmail.com';

/* Tìm sản phẩm có category chứa 'Electronics' */
EXPLAIN ANALYZE
SELECT *
FROM shop.products
WHERE category @> ARRAY['Electronics'];

/* Tìm sản phẩm trong khoảng giá 500 đến 1000 */
EXPLAIN ANALYZE
SELECT *
FROM shop.products
WHERE price BETWEEN 500 AND 1000;

/*
 5. TEST QUERIES
*/

/* Tìm khách hàng có email cụ thể */
SELECT *
FROM shop.customers
WHERE email = 'an.nguyen@gmail.com';

/* Tìm theo city */
SELECT *
FROM shop.customers
WHERE city = 'Hà Nội';

/* Tìm sản phẩm có category chứa 'Electronics' */
SELECT *
FROM shop.products
WHERE category @> ARRAY['Electronics'];

/* Tìm sản phẩm trong khoảng giá từ 500 đến 1000 */
SELECT *
FROM shop.products
WHERE price BETWEEN 500 AND 1000;

/*
 6. "CLUSTERED INDEX" trên orders theo order_date
 PostgreSQL không có clustered index thật,
 nên dùng index + CLUSTER
*/

CREATE INDEX idx_orders_order_date
    ON shop.orders(order_date);

CLUSTER shop.orders USING idx_orders_order_date;

/*
 7. VIEWS
*/

/* Top 3 khách hàng mua nhiều nhất */
CREATE OR REPLACE VIEW shop.v_top_customers AS
SELECT
    c.customer_id,
    c.full_name,
    SUM(o.quantity) AS total_quantity
FROM shop.customers c
         JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT *
FROM shop.v_top_customers
ORDER BY total_quantity DESC, customer_id ASC
LIMIT 3;

/* Tổng doanh thu theo từng sản phẩm */
CREATE OR REPLACE VIEW shop.v_product_revenue AS
SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM shop.products p
         LEFT JOIN shop.orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

SELECT *
FROM shop.v_product_revenue
ORDER BY total_revenue DESC NULLS LAST, product_id ASC;

/*
 8. VIEW CÓ THỂ GHI ĐỂ UPDATE CITY
*/

CREATE OR REPLACE VIEW shop.v_customer_city AS
SELECT
    customer_id,
    full_name,
    city
FROM shop.customers
        WITH CHECK OPTION;

/* Kiểm tra trước khi update */
SELECT *
FROM shop.v_customer_city;

/* Cập nhật city qua view */
UPDATE shop.v_customer_city
SET city = 'Cần Thơ'
WHERE customer_id = 1;

/* Kiểm tra lại view */
SELECT *
FROM shop.v_customer_city
WHERE customer_id = 1;

/* Kiểm tra lại bảng gốc */
SELECT *
FROM shop.customers
WHERE customer_id = 1;
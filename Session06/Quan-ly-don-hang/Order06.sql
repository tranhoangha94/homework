CREATE SCHEMA Order06;

CREATE TABLE order06.orderinfo
(
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total NUMERIC(10,2),
    status VARCHAR(20)
);

/*
 1. INSERT 5 đơn hàng mẫu
*/

INSERT INTO order06.orderinfo (customer_id, order_date, total, status)
VALUES
    (1, '2024-10-05', 450000, 'Pending'),
    (2, '2024-10-12', 800000, 'Completed'),
    (3, '2024-10-20', 1200000, 'Shipped'),
    (4, '2024-11-01', 300000, 'Cancelled'),
    (5, '2024-11-10', 950000, 'Processing');

/*
 2. Đơn hàng có tổng tiền > 500,000
*/

SELECT *
FROM order06.orderinfo
WHERE total > 500000;

/*
 3. Đơn hàng có ngày đặt trong tháng 10 năm 2024
*/

SELECT *
FROM order06.orderinfo
WHERE order_date BETWEEN '2024-10-01' AND '2024-10-31';

/*
 4. Đơn hàng có trạng thái khác "Completed"
*/

SELECT *
FROM order06.orderinfo
WHERE status <> 'Completed';

/*
 5. Lấy 2 đơn hàng mới nhất
*/

SELECT *
FROM order06.orderinfo
ORDER BY order_date DESC
LIMIT 2;
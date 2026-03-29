Create Schema Customer;


CREATE TABLE customer.customer
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    points INT
);

/*
 1. INSERT 7 khách hàng
*/

INSERT INTO customer.customer (name, email, phone, points)
VALUES
    ('Nguyễn Văn An', 'an@gmail.com', '0901234567', 120),
    ('Trần Thị Bình', 'binh@gmail.com', '0912345678', 250),
    ('Lê Văn Cường', NULL, '0923456789', 180),
    ('Phạm Thị Dung', 'dung@gmail.com', '0934567890', 300),
    ('Hoàng Văn Em', 'em@gmail.com', '0945678901', 90),
    ('Đỗ Thị Hạnh', 'hanh@gmail.com', '0956789012', 220),
    ('Bùi Văn Khang', 'khang@gmail.com', '0967890123', 150);

/*
 2. Danh sách tên khách hàng duy nhất
*/

SELECT DISTINCT name
FROM customer.customer;

/*
 3. Khách hàng chưa có email
*/

SELECT *
FROM customer.customer
WHERE email IS NULL;

/*
 4. 3 khách hàng điểm cao tiếp theo, bỏ qua người cao nhất
*/

SELECT *
FROM customer.customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

/*
 5. Sắp xếp danh sách khách hàng theo tên giảm dần
*/

SELECT *
FROM customer.customer
ORDER BY name DESC;
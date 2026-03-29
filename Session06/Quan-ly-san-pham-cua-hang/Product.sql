create schema Shop;

CREATE TABLE shop.product
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    stock INT
);

/*
 1. INSERT 5 sản phẩm
*/

INSERT INTO shop.product (name, category, price, stock)
VALUES
    ('Laptop Dell XPS 13', 'Điện tử', 25000000, 10),
    ('iPhone 14 Pro', 'Điện tử', 30000000, 5),
    ('Chuột Logitech M90', 'Phụ kiện', 150000, 50),
    ('Bàn phím cơ Razer', 'Phụ kiện', 2000000, 20),
    ('Tai nghe Sony', 'Điện tử', 5000000, 15);

/*
 2. Hiển thị toàn bộ sản phẩm
*/

SELECT *
FROM shop.product;

/*
 3. Hiển thị 3 sản phẩm giá cao nhất
*/

SELECT *
FROM shop.product
ORDER BY price DESC
LIMIT 3;

/*
 4. Sản phẩm "Điện tử" có giá < 10,000,000
*/

SELECT *
FROM shop.product
WHERE category = 'Điện tử'
  AND price < 10000000;

/*
 5. Sắp xếp theo tồn kho tăng dần
*/

SELECT *
FROM shop.product
ORDER BY stock ASC;
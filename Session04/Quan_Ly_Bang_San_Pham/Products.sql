create schema Products;

CREATE TABLE products.products
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(150),
    category     VARCHAR(50),
    price        NUMERIC(12, 0),
    stock        INT,
    manufacturer VARCHAR(50)
);

INSERT INTO products.products (id, name, category, price, stock, manufacturer)
VALUES (1, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       (2, 'Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
       (3, 'Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
       (4, 'Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
       (5, 'iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
       (6, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       (7, 'Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

SELECT * FROM Products.products;

/*
 1 Chèn dữ liệu mới:
Thêm sản phẩm “Chuột không dây Logitech M170”, loại Phụ kiện, giá 300000, tồn kho 20, hãng Logitech
*/
INSERT INTO products.products (id, name, category, price, stock, manufacturer)
VALUES (8, 'Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');
/*
2 Cập nhật dữ liệu:
Tăng giá tất cả sản phẩm của Apple thêm 10%
*/
UPDATE Products.products
SET price = price*1.1
WHERE manufacturer = 'Apple';


/*
3 Xóa dữ liệu:
Xóa sản phẩm có stock = 0
*/
DELETE FROM Products.products
WHERE stock = 0;
/*
4 Lọc theo điều kiện:
Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
*/
SELECT * FROM Products.products
WHERE price BETWEEN  1000000 AND 30000000;
/*
5 Lọc giá trị NULL:
Hiển thị sản phẩm có stock IS NULL
*/
SELECT * FROM Products.products
WHERE stock ISNULL;
/*
6 Loại bỏ trùng:
Liệt kê danh sách hãng sản xuất duy nhất
*/
SELECT DISTINCT manufacturer from Products.products;
/*
7 Sắp xếp dữ liệu
Hiển thị toàn bộ sản phẩm, sắp xếp giảm dần theo giá, sau đó tăng dần theo tên
*/
SELECT * FROM Products.products
ORDER BY price DESC , name ASC;
/*
8 Tìm kiếm (LIKE và ILIKE):
Tìm sản phẩm có tên chứa từ “laptop” (không phân biệt hoa thường)
*/
SELECT * FROM Products.products
WHERE name ILIKE '%laptop%';
/*
9 Giới hạn kết quả:
Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp theo giá giảm dần .
 */
SELECT * FROM Products.products
ORDER BY price DESC
LIMIT 2;
/* Phan 1 */

/* 1: Tao bang */
create schema Exam1;

SET search_path TO Exam1, public;

CREATE TABLE Customer
(
    customer_id VARCHAR(5) PRIMARY KEY NOT NULL,
    customer_full_name  VARCHAR(100) NOT NULL,
    customer_email  VARCHAR(100) NOT NULL UNIQUE,
    customer_phone  VARCHAR(15) NOT NULL,
    customer_address  VARCHAR(225) NOT NULL
);

CREATE TABLE Room
(
    room_id VARCHAR(5) PRIMARY KEY NOT NULL ,
    room_type  VARCHAR(50) NOT NULL,
    room_price  DECIMAL(10, 2) NOT NULL UNIQUE,
    room_status  VARCHAR(20) NOT NULL,
    room_area  INT NOT NULL
);

CREATE TABLE Booking
(
    booking_id SERIAL PRIMARY KEY NOT NULL,
    customer_id VARCHAR(5) REFERENCES Customer (customer_id),
    room_id VARCHAR(5) REFERENCES Room (room_id),
    Check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(10,2)
);

CREATE TABLE PAYMENT
(
    payment_id SERIAL PRIMARY KEY NOT NULL ,
    booking_id INT REFERENCES booking (booking_id),
    payment_method VARCHAR(50) NOT NULL ,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL
);

-- 2: CHen du lieu
INSERT INTO Customer
VALUES
    ('C001', 'Nguyen Anh Tu', 'tu.nguyen@example.com', '0912345678', 'Hanoi, Vietnam'),
    ('C002', 'Tran Thi Mai', 'mai.tran@example.com', '0923456789', 'Ho Chi Minh, Vietnam'),
    ('C003', 'Le Minh Hoang', 'hoang.le@example.com', '0934567890', 'Danang, Vietnam'),
    ('C004', 'Pham Hoang Nam', 'nam.pham@example.com', '0945678901', 'Hue, Vietnam'),
    ('C005', 'Vu Minh Thu', 'thu.vu@example.com', '0956789012', 'Hai Phong, Vietnam'),
    ('C006', 'Nguyen Thi Lan', 'lan.nguyen@example.com', '0967890123', 'Quang Ninh, Vietnam'),
    ('C007', 'Bui Minh Tuan', 'tuan.bui@example.com', '0978901234', 'Bac Giang, Vietnam'),
    ('C008', 'Pham Quang Hieu', 'hieu.pham@example.com', '0989012345', 'Quang Nam, Vietnam'),
    ('C009', 'Le Thi Lan', 'lan.le@example.com', '0990123456', 'Da Lat, Vietnam'),
    ('C010', 'Nguyen Thi Mai', 'mai.nguyen@example.com', '0901234567', 'Can Tho, Vietnam');

INSERT INTO Room
VALUES ('R001', 'Single', 100.0, 'Available', 25),
       ('R002', 'Double', 150.0, 'Booked',40),
       ('R003', 'Suite', 250.0, 'Available',60),
       ('R004', 'Single', 120.0, 'Booked',30),
       ('R005', 'Single', 160.0, 'Available',35);

INSERT INTO Booking
VALUES (1, 'C001', 'R001', '2025-03-01', '2025-03-05', 400.0),
       (2, 'C002', 'R002', '2025-03-02', '2025-03-06', 600.0),
       (3, 'C003','R003', '2025-03-03',       '2025-03-07',       1000.0),
       (4,
        'C004',
        'R004',
        '2025-03-04',
        '2025-03-08',
        480.0),
       (5,
        'C005',
        'R005',
        '2025-03-05',
        '2025-03-09',
        800.0),
       (6,
        'C006',
        'R001',
        '2025-03-06',
        '2025-03-10',
        400.0),
       (7,
        'C007',
        'R002',
        '2025-03-07',
        '2025-03-11',
        600.0),
       (8,
        'C008',
        'R003',
        '2025-03-08',
        '2025-03-12',
        1000.0),
       (9,
        'C009',
        'R004',
        '2025-03-09',
        '2025-03-13',
        480.0),
       (10,
        'C010',
        'R005',
        '2025-03-10',
        '2025-03-14',
        800.0);

INSERT INTO PAYMENT
VALUES (1,1,'Cash','2025-03-05',400.0),
       (2,2,'Credit Card','2025-03-06',600.0),
       (3,3,'Bank Transfer','2025-03-07',1000.0),
       (4,4,'Cash','2025-03-08',480.0),
       (5,5,'Credit Card','2025-03-09',800.0),
       (6,6,'Bank Transfer','2025-03-10',400.0),
       (7,7,'Cash','2025-03-11',600.0),
       (8,8,'Credit Card','2025-03-12',1000.0),
       (9,9,'Bank Transfer','2025-03-13',480.0),
       (10,10,'Cash','2025-03-14',800.0);

-- 3: Cap nhat du lieu
UPDATE booking b
SET total_amount = r.room_price * ( b.check_out_date - b.check_in_date)
FROM Room r
WHERE b.room_id = r.room_id
  AND r.room_status = 'Booked'
  AND b.check_in_date < CURRENT_DATE;

SELECT * FROM Booking;

-- 4: Xoa Du lieu

DELETE  FROM PAYMENT p
WHERE p.payment_method = 'Cash' AND p.payment_amount < 500;

SELECT * FROM PAYMENT;

-- PHAN 2

-- 5. (3 điểm) Lấy thông tin khách hàng gồm mã khách hàng, họ tên, email,
-- số điện thoại và địa chỉ được sắp xếp theo họ tên khách hàng tăng dần.
SELECT  customer_id, customer_full_name, customer_email, customer_phone, customer_address from Customer
ORDER BY Customer.customer_full_name ASC;

-- 6. (3 điểm) Lấy thông tin các phòng khách sạn gồm mã phòng, loại phòng, giá phòng và diện tích phòng,
-- sắp xếp theo giá phòng giảm dần.
SELECT room_id, room_type, room_price, room_area FROM ROOM
ORDER BY room_price DESC;

-- 7. (3 điểm) Lấy thông tin khách hàng và phòng khách sạn đã đặt, gồm mã khách hàng,
-- họ tên khách hàng, mã phòng, ngày nhận phòng và ngày trả phòng.
SELECT c.customer_id, c.customer_full_name, r.room_id, b.check_in_date, b.check_out_date FROM Customer c, Booking b, Room r
WHERE c.customer_id = b.customer_id AND b.room_id = r.room_id;

--     8. (3 điểm) Lấy danh sách khách hàng và tổng tiền đã thanh toán khi đặt phòng,
--     gồm mã khách hàng, họ tên khách hàng, phương thức thanh toán và số tiền thanh toán,
--     sắp xếp theo số tiền thanh toán giảm dần.
SELECT c.customer_id, c.customer_full_name, p.payment_method, p.payment_amount FROM Customer c, Booking b, PAYMENT p
WHERE b.customer_id = c.customer_id AND b.booking_id = p.booking_id
ORDER BY p.payment_amount DESC;

-- 9. (3 điểm) Lấy thông tin khách hàng từ vị trí thứ 2 đến thứ 4 trong bảng Customer
-- được sắp xếp theo tên khách hàng.
SELECT * from Customer
ORDER BY customer_full_name
LIMIT 3 OFFSET 1;

-- 10. (5 điểm) Lấy danh sách khách hàng đã đặt ít nhất 2 phòng
-- và có tổng số tiền thanh toán trên 1000, gồm mã khách hàng, họ tên khách hàng
-- và số lượng phòng đã đặt.
SELECT c.customer_id, c.customer_full_name, COUNT(DISTINCT b.room_id) AS total_rooms
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
JOIN PAYMENT p ON b.booking_id = p.booking_id
GROUP BY  c.customer_id, c.customer_full_name
HAVING COUNT(DISTINCT b.room_id) >= 2 AND SUM(p.payment_amount) > 1000;

--     11. (5 điểm) Lấy danh sách các phòng có tổng số tiền thanh toán dưới 1000
--     và có ít nhất 3 khách hàng đặt, gồm mã phòng, loại phòng, giá phòng và tổng số tiền thanh toán.

SELECT r.room_id, r.room_type, r.room_price, SUM(p.payment_amount) AS total_payment
FROM Room r
         JOIN Booking b ON b.room_id = r.room_id
         JOIN Customer c ON c.customer_id = b.customer_id
         JOIN PAYMENT p ON b.booking_id = p.booking_id
GROUP BY  r.room_id
HAVING COUNT(DISTINCT c.customer_id) >= 3 AND SUM(p.payment_amount) < 1000;

-- 12. (5 điểm) Lấy danh sách các khách hàng có tổng số tiền thanh toán lớn hơn 1000,
-- gồm mã khách hàng, họ tên khách hàng, mã phòng, tổng số tiền thanh toán.

SELECT c.customer_id, c.customer_full_name, r.room_id, SUM(p.payment_amount) AS total_payment
FROM Customer c
         JOIN Booking b ON c.customer_id = b.customer_id
         JOIN PAYMENT p ON b.booking_id = p.booking_id
         JOIN Room r ON b.room_id = r.room_id
GROUP BY c.customer_id, c.customer_full_name, r.room_id
HAVING SUM(p.payment_amount) > 1000;

-- 13. (6 điểm) Lấy danh sách các khách hàng Mmã KH, Họ tên, Email, SĐT) có họ tên chứa chữ "Minh"
-- hoặc địa chỉ (address) ở "Hanoi". Sắp xếp kết quả theo họ tên tăng dần.
SELECT * FROM Customer c
WHERE c.customer_full_name ILIKE '%Minh%'
  AND c.customer_address LIKE 'Hanoi%'
ORDER BY c.customer_full_name ASC;

-- 14. (4 điểm)  Lấy danh sách tất cả các phòng (Mã phòng, Loại phòng, Giá), sắp xếp theo giá phòng giảm dần.
-- Hiển thị 5 phòng tiếp theo sau 5 phòng đầu tiên (tức là lấy kết quả của trang thứ 2, biết mỗi trang có 5 phòng).
SELECT * from Room r
ORDER BY r.room_price DESC
LIMIT 5 OFFSET 5;

-- Phan 3

-- 15. (5 điểm) Hãy tạo một view để lấy thông tin các phòng và khách hàng đã đặt,
-- với điều kiện ngày nhận phòng nhỏ hơn ngày 2025-03-10.
-- Cần hiển thị các thông tin sau: Mã phòng, Loại phòng, Mã khách hàng, họ tên khách hàng
CREATE VIEW booked_rooms_before_10_03 AS SELECT
    r.room_id,
    r.room_type,
    c.customer_id,
    c.customer_full_name
FROM Booking b
JOIN Room r ON b.room_id = r.room_id
JOIN Customer c ON b.customer_id = c.customer_id
WHERE b.check_in_date < '2025-03-10';

SELECT * from booked_rooms_before_10_03;

-- 16. (5 điểm) Hãy tạo một view để lấy thông tin khách hàng và phòng đã đặt,
-- với điều kiện diện tích phòng lớn hơn 30 m².
-- Cần hiển thị các thông tin sau: Mã khách hàng, Họ tên khách hàng, Mã phòng, Diện tích phòng
CREATE VIEW booked_room_over_30m2 AS
SELECT
       c.customer_id,
       c.customer_full_name,
       r.room_id,
       r.room_area
FROM Booking b
         JOIN Room r ON b.room_id = r.room_id
         JOIN Customer c ON b.customer_id = c.customer_id
WHERE r.room_area > 30;

SELECT *
from booked_room_over_30m2;

-- Phan 4
-- 17. (5 điểm) Hãy tạo một trigger check_insert_booking để kiểm tra dữ liệu mối khi chèn vào bảng Booking.
-- Kiểm tra nếu ngày đặt phòng mà sau ngày trả phòng thì thông báo lỗi với nội dung
-- “Ngày đặt phòng không thể sau ngày trả phòng được !” và hủy thao tác chèn dữ liệu vào bảng.
CREATE OR REPLACE FUNCTION
check_insert_booking()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Check_in_date > NEW.check_out_date THEN
        RAISE EXCEPTION 'Ngày đặt phòng không thể sau ngày trả phòng được!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER  trg_check_insert_booking BEFORE INSERT ON Booking
    FOR EACH ROW
    EXECUTE FUNCTION check_insert_booking();

-- 18. (5 điểm) Hãy tạo một trigger có tên là update_room_status_on_booking để
-- tự động cập nhật trạng thái phòng thành "Booked"
-- khi một phòng được đặt (khi có bản ghi được INSERT vào bảng Booking).

CREATE OR REPLACE FUNCTION
    update_status_room_when_booking()
    RETURNS TRIGGER AS $$
DECLARE current_status TEXT;
BEGIN
    SELECT Room.room_status INTO current_status from Room
    WHERE room_id = NEW.room_id;

    IF current_status = 'Booked' THEN RAISE EXCEPTION 'Phòng này đã được đặt';
    END IF;

    UPDATE  Room
    SET room_status = 'Booked'
    WHERE room_id = NEW.room_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_room_status BEFORE INSERT ON Booking
    FOR EACH ROW
    EXECUTE FUNCTION update_status_room_when_booking();

-- Phan 5
-- 19. (5 điểm) Viết store procedure có tên add_customer
-- để thêm mới một khách hàng với đầy đủ các thông tin cần thiết.

CREATE OR REPLACE PROCEDURE add_customer(
    p_customer_id INT,
    p_customer_full_name TEXT,
    p_email TEXT,
    p_phone TEXT,
    p_address TEXT
)
LANGUAGE  plpgsql
AS $$
BEGIN
    IF EXISTS(SELECT 1 FROM Customer WHERE customer_id = p_customer_id)
        THEN RAISE EXCEPTION 'Customer ID đã tồn tại';
    END IF;

    INSERT INTO Customer(customer_id, customer_full_name, customer_email, customer_phone, customer_address)
    VALUES (p_customer_id,
            p_customer_full_name,
            p_email,
            p_phone,
            p_address);
END;
    $$;

--     20. (5 điểm) Hãy tạo một Stored Procedure  có tên là add_payment để thực hiện việc
--     thêm một thanh toán mới cho một lần đặt phòng.

CREATE OR REPLACE PROCEDURE add_payment(
    p_booking_id INT,
    p_payment_method TEXT,
    p_payment_amount INT,
    p_payment_date DATE
)
LANGUAGE plpgsql
AS $$
    BEGIN
        IF NOT EXISTS(SELECT  1 FROM Booking WHERE booking_id = p_booking_id) THEN
            RAISE 'Booking Is not existed!';

        END IF;

        INSERT INTO PAYMENT(booking_id, payment_method, payment_amount, payment_date)
        VALUES (p_booking_id, p_payment_method, p_payment_amount, p_payment_date);
    END;
    $$;
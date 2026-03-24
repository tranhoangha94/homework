create schema Student;

CREATE TABLE student.students
(
    id         SERIAL PRIMARY KEY,
    full_name  VARCHAR(100),
    gender     VARCHAR(10),
    birth_year INT,
    major      VARCHAR(50),
    gpa        NUMERIC(3, 1)
);

INSERT INTO student.students (id, full_name, gender, birth_year, major, gpa)
VALUES (1, 'Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       (2, 'Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
       (3, 'Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
       (4, 'Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
       (5, 'Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       (6, 'Lưu Đức Tài', 'Nam', 2004, 'Cơ khí', NULL),
       (7, 'Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

SELECT * FROM Student.students;

/*
 1. Chèn dữ liệu mới:
Thêm sinh viên “Phan Hoàng Nam”, giới tính Nam, sinh năm 2003, ngành CNTT, GPA 3.8
 */
INSERT INTO student.students (id, full_name, gender, birth_year, major, gpa)
VALUES (8, 'Phan Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);

/*
 2. Cập nhật dữ liệu:
Sinh viên “Lê Quốc Cường” vừa cải thiện học lực, cập nhật gpa = 3.4
 */
UPDATE Student.students
SET gpa = 3.4
WHERE full_name = 'Lê Quốc Cường';

/*
 3 Xóa dữ liệu:
Xóa tất cả sinh viên có gpa IS NULL
 */
DELETE FROM Student.students
WHERE gpa ISNULL;

/*
 4 Truy vấn cơ bản:
Hiển thị sinh viên ngành CNTT có gpa >= 3.0, chỉ lấy 3 kết quả đầu tiên
 */
 SELECT * from Student.students
 WHERE gpa >= 3.0
 LIMIT 3;

/*
 5 Loại bỏ trùng lặp:
Liệt kê danh sách ngành học duy nhất
 */
 SELECT DISTINCT  major from Student.students;

/*
 6 Sắp xếp:
Hiển thị sinh viên ngành CNTT, sắp xếp giảm dần theo GPA, sau đó tăng dần theo tên
 */

SELECT * from Student.students
WHERE major = 'CNTT'
ORDER BY gpa DESC , full_name ASC;

/*
 7 .Tìm kiếm:
Tìm sinh viên có tên bắt đầu bằng “Nguyễn”
 */

SELECT * from Student.students
WHERE full_name LIKE 'Nguyễn%';

/*
 8 Khoảng giá trị:
Hiển thị sinh viên có năm sinh từ 2001 đến 2003
 */
SELECT * from Student.students
WHERE birth_year BETWEEN 2001 AND 2003;
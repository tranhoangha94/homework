create  database SalaryDB;

create schema salary;

CREATE TYPE salary.department_enum AS ENUM (
    'IT',
    'HR',
    'Finance'
    );

CREATE TYPE salary.position_enum AS ENUM (
    'Developer',
    'Tester',
    'Recruiter',
    'HR Manager',
    'Accountant'
    );

CREATE TABLE salary.employees
(
    id         SERIAL PRIMARY KEY,
    full_name  VARCHAR(100),
    department salary.department_enum,
    position   salary.position_enum,
    salary     NUMERIC(10, 0),
    bonus      NUMERIC(10, 0),
    join_year  INT
);

INSERT INTO salary.employees (id, full_name, department, position, salary, bonus, join_year)
VALUES (1, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       (2, 'Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
       (3, 'Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
       (4, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       (5, 'Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
       (6, 'Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
       (7, 'Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

SELECT * from salary.employees;

/*
 2. Cập nhật lương thưởng:
    Tăng 10% lương cho những nhân viên làm trong phòng IT có mức lương dưới 18,000,000
    Với nhân viên có bonus IS NULL, đặt giá trị bonus = 500000
 */
 --a. Tăng 10% lương cho nhân viên IT có lương < 18,000,000
UPDATE salary.employees
SET salary = salary * 1.1
WHERE department = 'IT'
  AND salary < 18000000;

--b. Gán bonus = 500000 cho các nhân viên có bonus NULL
UPDATE salary.employees
SET bonus = 500000
WHERE department = 'IT' AND bonus IS NULL AND salary < 18000000;

/*
3.Truy vấn:
Hiển thị danh sách nhân viên thuộc phòng IT hoặc HR, gia nhập sau năm 2020, và có tổng thu nhập (salary + bonus) lớn hơn 15,000,000
Chỉ lấy 3 nhân viên đầu tiên sau khi sắp xếp giảm dần theo tổng thu nhập
*/
SELECT * from salary.employees
WHERE join_year > 2020 AND (salary + COALESCE(bonus, 0)) > 15000000 AND department IN ('IT','HR')
ORDER BY (salary + COALESCE(bonus, 0)) DESC
LIMIT 3;

/*
 4. Truy vấn theo mẫu tên:
Tìm tất cả nhân viên có tên bắt đầu bằng “Nguyễn” hoặc kết thúc bằng “Hân”
 */
SELECT * from salary.employees
WHERE full_name LIKE 'Nguyễn%' OR full_name LIKE '%Hân'

/*
 5. Truy vấn đặc biệt:
Liệt kê các phòng ban duy nhất có ít nhất một nhân viên có bonus IS NOT NULL
 */
 SELECT DISTINCT department from salary.employees
 WHERE bonus IS NOT NULL;

/*
 Khoảng thời gian làm việc:
Hiển thị nhân viên gia nhập trong khoảng từ 2019 đến 2022 (BETWEEN)
 */
 SELECT * from salary.employees
 WHERE join_year BETWEEN 2019 AND 2022;
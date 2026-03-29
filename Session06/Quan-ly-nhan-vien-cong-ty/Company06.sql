create SCHEMA Company;

CREATE TABLE company.employee
(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

/*
 1. INSERT 6 nhân viên
*/

INSERT INTO company.employee (full_name, department, salary, hire_date)
VALUES
    ('Nguyễn Văn An', 'IT', 8000000, '2023-02-10'),
    ('Trần Thị Bình', 'HR', 7000000, '2022-05-20'),
    ('Lê Văn Cường', 'IT', 9000000, '2023-07-15'),
    ('Phạm Thị An', 'Finance', 5500000, '2023-03-01'),
    ('Hoàng Văn Dũng', 'IT', 6000000, '2021-11-11'),
    ('Đỗ Thị Lan', 'Marketing', 5000000, '2023-09-09');

/*
 2. UPDATE tăng 10% lương phòng IT
*/

UPDATE company.employee
SET salary = salary * 1.1
WHERE department = 'IT';

/*
 3. DELETE nhân viên lương < 6,000,000
*/

DELETE FROM company.employee
WHERE salary < 6000000;

/*
 4. Tìm nhân viên có tên chứa "An" (không phân biệt hoa thường)
*/

SELECT *
FROM company.employee
WHERE full_name ILIKE '%an%';

/*
 5. Nhân viên vào làm năm 2023
*/

SELECT *
FROM company.employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';
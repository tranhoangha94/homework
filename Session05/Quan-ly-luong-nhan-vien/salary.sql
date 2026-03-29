create schema sesson5;

CREATE TABLE sesson5.departments
(
    dept_id   SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE sesson5.employees
(
    emp_id    SERIAL PRIMARY KEY,
    emp_name  VARCHAR(100),
    dept_id   INT REFERENCES sesson5.departments (dept_id),
    salary    NUMERIC(10, 2),
    hire_date DATE
);

CREATE TABLE sesson5.projects
(
    project_id   SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id      INT REFERENCES sesson5.departments (dept_id)
);

INSERT INTO sesson5.departments (dept_name)
VALUES ('IT'),
       ('HR'),
       ('Finance'),
       ('Marketing');
-- Employees
INSERT INTO sesson5.employees (emp_name, dept_id, salary, hire_date)
VALUES ('Nguyen Van A', 1, 1500.00, '2022-01-10'),
       ('Tran Thi B', 2, 1200.00, '2021-03-15'),
       ('Le Van C', 1, 2000.00, '2020-07-20'),
       ('Pham Thi D', 3, 1800.00, '2023-05-01'),
       ('Hoang Van E', 4, 1300.00, '2022-09-12');

-- Projects
INSERT INTO sesson5.projects (project_name, dept_id)
VALUES ('System Upgrade', 1),
       ('Recruitment Plan', 2),
       ('Budget 2025', 3),
       ('Ad Campaign', 4),
       ('AI Research', 1);

SELECT
    e.emp_name AS "Tên nhân viên",
    d.dept_name AS "Phòng ban",
    e.salary AS "Lương"
FROM sesson5.employees e
         JOIN sesson5.departments d ON e.dept_id = d.dept_id;

SELECT
    SUM(salary) AS tong_quy_luong,
    AVG(salary) AS luong_trung_binh,
    MAX(salary) AS luong_cao_nhat,
    MIN(salary) AS luong_thap_nhat,
    COUNT(*) AS so_nhan_vien
FROM sesson5.employees;

SELECT  * from sesson5.employees;
SELECT  * from sesson5.departments;

SELECT
    d.dept_name AS "Phòng ban",
    AVG(e.salary) AS "Lương trung bình"
FROM sesson5.employees e
         JOIN sesson5.departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 1500;

SELECT
    p.project_name AS "Dự án",
    d.dept_name AS "Phòng ban",
    e.emp_name AS "Nhân viên"
FROM sesson5.projects p
         JOIN sesson5.departments d ON p.dept_id = d.dept_id
         JOIN sesson5.employees e ON e.dept_id = d.dept_id;

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM sesson5.employees e
         JOIN sesson5.departments d ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM sesson5.employees e2
    WHERE e2.dept_id = e.dept_id
);
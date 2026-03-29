create schema Student;

-- Students
CREATE TABLE student.students
(
    student_id SERIAL PRIMARY KEY,
    full_name  VARCHAR(100),
    major      VARCHAR(50)
);

-- Courses
CREATE TABLE student.courses
(
    course_id   SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credit      INT
);

-- Enrollments
CREATE TABLE student.enrollments
(
    student_id INT REFERENCES student.students (student_id),
    course_id  INT REFERENCES student.courses (course_id),
    score      NUMERIC(5, 2)
);

INSERT INTO student.students (full_name, major)
VALUES ('Nguyen Van A', 'IT'),
       ('Tran Thi B', 'Business'),
       ('Le Van C', 'IT'),
       ('Pham Thi D', 'Finance'),
       ('Hoang Van E', 'IT'),
       ('Do Thi F', 'Marketing'),
       ('Bui Van G', 'Finance');

INSERT INTO student.courses (course_name, credit)
VALUES ('Database', 3),
       ('Algorithms', 4),
       ('Operating Systems', 3),
       ('Marketing Basics', 2),
       ('Accounting', 3),
       ('Data Structures', 4);

INSERT INTO student.enrollments (student_id, course_id, score)
VALUES (1, 1, 8.5),
       (1, 2, 7.0),
       (1, 6, 9.0),

       (2, 4, 9.5),
       (2, 5, 8.0),

       (3, 1, 6.5),
       (3, 2, 8.0),
       (3, 3, 7.5),

       (4, 5, 7.0),
       (4, 4, 6.5),

       (5, 1, 9.0),
       (5, 3, 8.5),
       (5, 6, 9.2),

       (6, 4, 8.0),

       (7, 5, 7.8),
       (7, 3, 6.9);

SELECT  * FROM Student.courses;
/*
 Liệt kê danh sách sinh viên cùng tên môn học và điểm
dùng bí danh bảng ngắn (vd. s, c, e)
và bí danh cột như Tên sinh viên, Môn học, Điểm
 */
SELECT s.full_name AS "Tên Sinh Viên", c.course_name AS "Khóa học", e.score AS "Điểm"
FROM Student.students s
JOIN Student.enrollments e ON s.student_id = e.student_id
JOIN Student.courses c ON c.course_id = e.course_id;

/*
 Aggregate Functions:
Tính cho từng sinh viên:
Điểm trung bình
Điểm cao nhất
Điểm thấp nhất
 */
SELECT s.full_name AS "Tên sinh viên", AVG(e.score) AS "TB", MAX(e.score) AS "MAX", MIN(e.score) AS "MIN"

FROM Student.enrollments e JOIN student.students s ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name;

/*
 GROUP BY / HAVING:
Tìm ngành học (major) có điểm trung bình cao hơn 7.5

 */

create schema Student;

-- Students
CREATE TABLE student.students
(
    student_id SERIAL PRIMARY KEY,
    full_name  VARCHAR(100),
    major      VARCHAR(50)
);

-- Courses
CREATE TABLE student.courses
(
    course_id   SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    credit      INT
);

-- Enrollments
CREATE TABLE student.enrollments
(
    student_id INT REFERENCES student.students (student_id),
    course_id  INT REFERENCES student.courses (course_id),
    score      NUMERIC(5, 2)
);

INSERT INTO student.students (full_name, major)
VALUES ('Nguyen Van A', 'IT'),
       ('Tran Thi B', 'Business'),
       ('Le Van C', 'IT'),
       ('Pham Thi D', 'Finance'),
       ('Hoang Van E', 'IT'),
       ('Do Thi F', 'Marketing'),
       ('Bui Van G', 'Finance');

INSERT INTO student.courses (course_name, credit)
VALUES ('Database', 3),
       ('Algorithms', 4),
       ('Operating Systems', 3),
       ('Marketing Basics', 2),
       ('Accounting', 3),
       ('Data Structures', 4);

INSERT INTO student.enrollments (student_id, course_id, score)
VALUES (1, 1, 8.5),
       (1, 2, 7.0),
       (1, 6, 9.0),

       (2, 4, 9.5),
       (2, 5, 8.0),

       (3, 1, 6.5),
       (3, 2, 8.0),
       (3, 3, 7.5),

       (4, 5, 7.0),
       (4, 4, 6.5),

       (5, 1, 9.0),
       (5, 3, 8.5),
       (5, 6, 9.2),

       (6, 4, 8.0),

       (7, 5, 7.8),
       (7, 3, 6.9);

SELECT  * FROM Student.courses;
/*
 Liệt kê danh sách sinh viên cùng tên môn học và điểm
dùng bí danh bảng ngắn (vd. s, c, e)
và bí danh cột như Tên sinh viên, Môn học, Điểm
 */
SELECT s.full_name AS "Tên Sinh Viên", c.course_name AS "Khóa học", e.score AS "Điểm"
FROM Student.students s
         JOIN Student.enrollments e ON s.student_id = e.student_id
         JOIN Student.courses c ON c.course_id = e.course_id;

/*
 Aggregate Functions:
Tính cho từng sinh viên:
Điểm trung bình
Điểm cao nhất
Điểm thấp nhất
 */
SELECT s.full_name AS "Tên sinh viên", AVG(e.score) AS "TB", MAX(e.score) AS "MAX", MIN(e.score) AS "MIN"

FROM Student.enrollments e JOIN student.students s ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name;

/*
 GROUP BY / HAVING:
Tìm ngành học (major) có điểm trung bình cao hơn 7.5

 */

SELECT s.major AS "Ngành học", AVG(e.score) AS "Điểm trung bình"
FROM student.students s
JOIN student.enrollments e ON s.student_id = e.student_id
GROUP BY s.major
HAVING AVG(e.score) > 7.5;

/*
JOIN:
Liệt kê tất cả sinh viên, môn học, số tín chỉ và điểm (JOIN 3 bảng)
 */

SELECT s.full_name   AS "Tên sinh viên",
       c.course_name AS "Môn học",
       c.credit      AS "Số tín chỉ",
       e.score       AS "Điểm"
FROM student.students s
         JOIN student.enrollments e ON s.student_id = e.student_id
         JOIN student.courses c ON c.course_id = e.course_id;
/*
Subquery:
Tìm sinh viên có điểm trung bình cao hơn điểm trung bình toàn trường
Gợi ý: dùng AVG(score) trong subquery
 */
SELECT s.student_id,
       s.full_name  AS "Tên sinh viên",
       AVG(e.score) AS "Điểm trung bình"
FROM student.students s
         JOIN student.enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name
HAVING AVG(e.score) > (SELECT AVG(score)
                       FROM student.enrollments);
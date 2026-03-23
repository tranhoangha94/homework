CREATE SCHEMA elearning;

SET search_path TO elearning;

CREATE TABLE elearning.Students
(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50)  NOT NULL,
    last_name  VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE elearning.Instructors
(
    instructor_id SERIAL PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE elearning.Courses
(
    course_id     SERIAL PRIMARY KEY,
    course_name   VARCHAR(100) NOT NULL,
    instructor_id INT          NOT NULL,
    CONSTRAINT fk_courses_instructor
        FOREIGN KEY (instructor_id)
            REFERENCES Instructors (instructor_id)
);

CREATE TABLE elearning.Enrollments
(
    enrollment_id SERIAL PRIMARY KEY,
    student_id    INT  NOT NULL,
    course_id     INT  NOT NULL,
    enroll_date   DATE NOT NULL,
    CONSTRAINT fk_enrollments_student
        FOREIGN KEY (student_id)
            REFERENCES Students (student_id),
    CONSTRAINT fk_enrollments_course
        FOREIGN KEY (course_id)
            REFERENCES Courses (course_id)
);

CREATE TABLE elearning.Assignments
(
    assignment_id SERIAL PRIMARY KEY,
    course_id     INT          NOT NULL,
    title         VARCHAR(100) NOT NULL,
    due_date      DATE         NOT NULL,
    CONSTRAINT fk_assignments_course
        FOREIGN KEY (course_id)
            REFERENCES Courses (course_id)
);

CREATE TABLE elearning.Submissions
(
    submission_id   SERIAL PRIMARY KEY,
    assignment_id   INT  NOT NULL,
    student_id      INT  NOT NULL,
    submission_date DATE NOT NULL,
    grade           NUMERIC(5, 2) CHECK (grade >= 0 AND grade <= 100),
    CONSTRAINT fk_submissions_assignment
        FOREIGN KEY (assignment_id)
            REFERENCES Assignments (assignment_id),
    CONSTRAINT fk_submissions_student
        FOREIGN KEY (student_id)
            REFERENCES Students (student_id)
);
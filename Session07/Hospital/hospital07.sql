create schema Hospital;

CREATE TABLE hospital.patients
(
    patient_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    symptoms TEXT[]
);

CREATE TABLE hospital.doctors
(
    doctor_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE hospital.appointments
(
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES hospital.patients(patient_id),
    doctor_id INT REFERENCES hospital.doctors(doctor_id),
    appointment_date DATE,
    diagnosis VARCHAR(200),
    fee NUMERIC(10,2)
);

/*
 1. INSERT DATA
    - 5 patients
    - 5 doctors
    - 10 appointments
*/

INSERT INTO hospital.patients (full_name, phone, city, symptoms)
VALUES
    ('Nguyễn Văn An', '0901234567', 'Hà Nội', ARRAY['sot', 'ho', 'dau hong']),
    ('Trần Thị Bình', '0912345678', 'Đà Nẵng', ARRAY['dau dau', 'met moi']),
    ('Lê Văn Cường', '0923456789', 'Hồ Chí Minh', ARRAY['ho', 'kho tho']),
    ('Phạm Thị Dung', '0934567890', 'Hải Phòng', ARRAY['dau bung', 'buon non']),
    ('Hoàng Văn Em', '0945678901', 'Hà Nội', ARRAY['sot', 'met moi', 'ho']);

INSERT INTO hospital.doctors (full_name, department)
VALUES
    ('Bác sĩ Nguyễn Minh', 'Nội tổng quát'),
    ('Bác sĩ Trần Lan', 'Tai Mũi Họng'),
    ('Bác sĩ Lê Hùng', 'Hô hấp'),
    ('Bác sĩ Phạm Hoa', 'Tiêu hóa'),
    ('Bác sĩ Đỗ Nam', 'Nhi khoa');

INSERT INTO hospital.appointments (patient_id, doctor_id, appointment_date, diagnosis, fee)
VALUES
    (1, 1, '2025-03-01', 'Cảm cúm', 250000),
    (1, 2, '2025-03-10', 'Viêm họng', 300000),
    (2, 1, '2025-03-02', 'Đau đầu do thiếu ngủ', 200000),
    (2, 5, '2025-03-12', 'Suy nhược nhẹ', 220000),
    (3, 3, '2025-03-03', 'Viêm phế quản', 450000),
    (3, 3, '2025-03-18', 'Tái khám hô hấp', 400000),
    (4, 4, '2025-03-05', 'Rối loạn tiêu hóa', 350000),
    (4, 4, '2025-03-20', 'Đau dạ dày', 500000),
    (5, 1, '2025-03-06', 'Sốt siêu vi', 280000),
    (5, 2, '2025-03-22', 'Ho kéo dài', 320000);

/*
 2. INDEXES
*/

/* B-tree: tìm bệnh nhân theo phone */
CREATE INDEX idx_patients_phone
    ON hospital.patients(phone);

/* Hash: tìm bệnh nhân theo city */
CREATE INDEX idx_patients_city_hash
    ON hospital.patients USING HASH(city);

/* GIN: tìm bệnh nhân theo từ khóa trong mảng symptoms */
CREATE INDEX idx_patients_symptoms_gin
    ON hospital.patients USING GIN(symptoms);

/*
 GiST: tìm cuộc hẹn theo khoảng phí (fee)
 Cần extension btree_gist để hỗ trợ scalar numeric với GiST
*/
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE INDEX idx_appointments_fee_gist
    ON hospital.appointments USING GIST(fee);

/*
 3. "Clustered Index" theo ngày khám
 PostgreSQL không có clustered index thật,
 dùng index + CLUSTER để sắp xếp vật lý dữ liệu 1 lần
*/

CREATE INDEX idx_appointments_date
    ON hospital.appointments(appointment_date);

CLUSTER hospital.appointments USING idx_appointments_date;

/*
 4. VIEW + QUERIES
*/

/* View tổng phí theo bệnh nhân */
CREATE OR REPLACE VIEW hospital.v_patient_total_fee AS
SELECT
    p.patient_id,
    p.full_name,
    COALESCE(SUM(a.fee), 0) AS total_fee
FROM hospital.patients p
         LEFT JOIN hospital.appointments a
                   ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.full_name;

/* Top 3 bệnh nhân có tổng phí khám cao nhất */
SELECT *
FROM hospital.v_patient_total_fee
ORDER BY total_fee DESC
LIMIT 3;

/* View tổng số lượt khám theo bác sĩ */
CREATE OR REPLACE VIEW hospital.v_doctor_appointment_count AS
SELECT
    d.doctor_id,
    d.full_name,
    d.department,
    COUNT(a.appointment_id) AS total_visits
FROM hospital.doctors d
         LEFT JOIN hospital.appointments a
                   ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.full_name, d.department;

/* Tính tổng số lượt khám theo bác sĩ */
SELECT *
FROM hospital.v_doctor_appointment_count
ORDER BY total_visits DESC, doctor_id ASC;

/*
 5. View có thể cập nhật để thay đổi city của bệnh nhân
*/

CREATE OR REPLACE VIEW hospital.v_patient_city AS
SELECT
    patient_id,
    full_name,
    city
FROM hospital.patients
        WITH CHECK OPTION;

/* Kiểm tra trước khi update */
SELECT *
FROM hospital.v_patient_city;

/* Cập nhật city qua view */
UPDATE hospital.v_patient_city
SET city = 'Cần Thơ'
WHERE patient_id = 1;

/* Kiểm tra lại view */
SELECT *
FROM hospital.v_patient_city
WHERE patient_id = 1;

/* Kiểm tra lại bảng gốc patients */
SELECT *
FROM hospital.patients
WHERE patient_id = 1;
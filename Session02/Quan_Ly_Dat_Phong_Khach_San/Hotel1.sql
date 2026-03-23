CREATE SCHEMA Hotel;
SET search_path TO hotel;

CREATE TABLE hotel.roomtypes (
room_type_id SERIAL PRIMARY KEY,
type_name VARCHAR(50) NOT NULL UNIQUE,
price_per_night NUMERIC(10,2) NOT NULL,
max_capacity INT NOT NULL,
CONSTRAINT chk_roomtypes_price
CHECK (price_per_night > 0),
CONSTRAINT chk_roomtypes_capacity
CHECK (max_capacity > 0)
);

CREATE TABLE hotel.rooms (
room_id SERIAL PRIMARY KEY,
room_number VARCHAR(10) NOT NULL UNIQUE,
room_type_id INT NOT NULL,
status VARCHAR(20) NOT NULL,
CONSTRAINT chk_rooms_status
CHECK (status IN ('Available', 'Occupied', 'Maintenance')),
CONSTRAINT fk_rooms_roomtype
FOREIGN KEY (room_type_id)
REFERENCES hotel.roomtypes(room_type_id)
);

CREATE TABLE hotel.customers (
customer_id SERIAL PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(15) NOT NULL
);

CREATE TABLE hotel.bookings
(
    booking_id  SERIAL PRIMARY KEY,
    customer_id INT         NOT NULL,
    room_id     INT         NOT NULL,
    check_in    DATE        NOT NULL,
    check_out   DATE        NOT NULL,
    status      VARCHAR(20) NOT NULL,
    CONSTRAINT chk_bookings_status
        CHECK (status IN ('Pending', 'Confirmed', 'Cancelled')),
    CONSTRAINT chk_booking_dates
        CHECK (check_out > check_in),
    CONSTRAINT fk_bookings_customer
        FOREIGN KEY (customer_id)
            REFERENCES hotel.customers (customer_id),
    CONSTRAINT fk_bookings_room
        FOREIGN KEY (room_id)
            REFERENCES hotel.rooms (room_id)
);

CREATE TABLE hotel.payments
(
    payment_id   SERIAL PRIMARY KEY,
    booking_id   INT            NOT NULL,
    amount       NUMERIC(10, 2) NOT NULL,
    payment_date DATE           NOT NULL,
    method       VARCHAR(20)    NOT NULL,
    CONSTRAINT chk_payments_amount
        CHECK (amount >= 0),
    CONSTRAINT chk_payments_method
        CHECK (method IN ('Credit Card', 'Cash', 'Bank Transfer')),
    CONSTRAINT fk_payments_booking
        FOREIGN KEY (booking_id)
            REFERENCES hotel.bookings (booking_id)
);
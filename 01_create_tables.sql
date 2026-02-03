CREATE TABLE role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE user_account (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INTEGER NOT NULL,
    CONSTRAINT fk_role
        FOREIGN KEY (role_id)
        REFERENCES role(role_id)
);


CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    loyalty_points INTEGER DEFAULT 0,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES user_account(user_id)
);


CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    booking_date DATE NOT NULL,
    booking_status VARCHAR(30) NOT NULL,
    total_cost NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);


CREATE TABLE flight (
    flight_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    airline VARCHAR(100) NOT NULL,
    departure VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    seat_class VARCHAR(20) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_booking_flight
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
);


CREATE TABLE accommodation (
    accommodation_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_booking_accommodation
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
);


CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    CONSTRAINT fk_booking_payment
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id)
);


CREATE TABLE optional_service (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    service_price NUMERIC(10,2) NOT NULL
);


CREATE TABLE booking_service (
    booking_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    PRIMARY KEY (booking_id, service_id),
    CONSTRAINT fk_booking
        FOREIGN KEY (booking_id)
        REFERENCES booking(booking_id),
    CONSTRAINT fk_service
        FOREIGN KEY (service_id)
        REFERENCES optional_service(service_id)
);

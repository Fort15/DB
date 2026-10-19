DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS fare_classes CASCADE;
DROP TABLE IF EXISTS flights CASCADE;
DROP TABLE IF EXISTS aircraft CASCADE;
DROP TABLE IF EXISTS airports CASCADE;
DROP TABLE IF EXISTS passengers CASCADE;

CREATE TABLE passengers (
    passenger_id INT GENERATED ALWAYS AS IDENTITY,
    passport_number VARCHAR(20) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    CONSTRAINT pk_passengers PRIMARY KEY (passenger_id),
    CONSTRAINT uq_passengers_passport UNIQUE (passport_number),
    CONSTRAINT uq_passengers_email UNIQUE (email),
    CONSTRAINT chk_passengers_birth CHECK (birth_date < CURRENT_DATE)
);

CREATE TABLE airports (
    airport_id int GENERATED ALWAYS AS IDENTITY,
    iata_code CHAR(3) NOT NULL,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    CONSTRAINT pk_airports PRIMARY KEY (airport_id),
    CONSTRAINT uq_airports_iata UNIQUE (iata_code)
);

CREATE TABLE aircraft (
    aircraft_id INT GENERATED ALWAYS AS IDENTITY,
    tail_number VARCHAR(20) NOT NULL,
    model VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL,
    CONSTRAINT pk_aircraft PRIMARY KEY (aircraft_id),
    CONSTRAINT uq_aircraft_tail UNIQUE (tail_number),
    CONSTRAINT chk_aircraft_seats CHECK (total_seats > 0)
);

CREATE TABLE flights (
    flight_id INT GENERATED ALWAYS AS IDENTITY,
    flight_number VARCHAR(10) NOT NULL,
    departure_airport_id INT NOT NULL,
    arrival_airport_id INT NOT NULL,
    aircraft_id INT NOT NULL,
    departure_time TIMESTAMPTZ NOT NULL,
    arrival_time TIMESTAMPTZ NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'scheduled',
    CONSTRAINT pk_flights PRIMARY KEY (flight_id),
    CONSTRAINT fk_flights_departure FOREIGN KEY (departure_airport_id)
        REFERENCES airports (airport_id) ON DELETE RESTRICT,
    CONSTRAINT fk_flights_arrival FOREIGN KEY (arrival_airport_id)
        REFERENCES airports (airport_id) ON DELETE RESTRICT,
    CONSTRAINT fk_flights_aircraft FOREIGN KEY (aircraft_id)
        REFERENCES aircraft (aircraft_id) ON DELETE RESTRICT,
    CONSTRAINT uq_flights_number_time UNIQUE (flight_number, departure_time),
    CONSTRAINT chk_flights_times CHECK (arrival_time > departure_time),
    CONSTRAINT chk_flights_airport_diff CHECK (departure_airport_id <> arrival_airport_id),
    CONSTRAINT chk_flights_status CHECK (status IN ('scheduled', 'delayed', 'cancelled', 'completed'))
);

CREATE TABLE fare_classes (
    class_id INT GENERATED ALWAYS AS IDENTITY,
    code VARCHAR(2) NOT NULL,
    name VARCHAR(50) NOT NULL,
    baggage_kg INT NOT NULL,
    refundable BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_fare_classes PRIMARY KEY (class_id),
    CONSTRAINT uq_fare_classes_code UNIQUE (code),
    CONSTRAINT chk_fare_classes_bag CHECK (baggage_kg >= 0)
);

CREATE TABLE bookings (
    booking_id INT GENERATED ALWAYS AS IDENTITY,
    passenger_id INT NOT NULL,
    booked_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    total_price NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_bookings PRIMARY KEY (booking_id),
    CONSTRAINT fk_bookings_passenger FOREIGN KEY (passenger_id)
        REFERENCES passengers (passenger_id) ON DELETE CASCADE,
    CONSTRAINT chk_bookings_status CHECK (status IN ('pending','confirmed','cancelled')),
    CONSTRAINT chk_bookings_total_price CHECK (total_price >= 0)
);

CREATE TABLE tickets (
    ticket_id INT GENERATED ALWAYS AS IDENTITY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    class_id INT NOT NULL,
    seat_number VARCHAR(5) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_tickets PRIMARY KEY (ticket_id),
    CONSTRAINT fk_tickets_booking FOREIGN KEY (booking_id)
        REFERENCES bookings (booking_id) ON DELETE CASCADE,
    CONSTRAINT fk_tickets_flight FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id) ON DELETE RESTRICT,
    CONSTRAINT fk_tickets_class FOREIGN KEY (class_id)
        REFERENCES fare_classes (class_id) ON DELETE RESTRICT,
    CONSTRAINT uq_tickets_seat UNIQUE (flight_id, seat_number),
    CONSTRAINT chk_tickets_price CHECK (price > 0)
);

CREATE TABLE payments (
    payment_id INT GENERATED ALWAYS AS IDENTITY,
    booking_id INT NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    method VARCHAR(20) NOT NULL,
    paid_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT pk_payments PRIMARY KEY (payment_id),
    CONSTRAINT fk_payments_booking FOREIGN KEY (booking_id)
        REFERENCES bookings (booking_id) ON DELETE CASCADE,
    CONSTRAINT chk_payments_amount CHECK (amount > 0),
    CONSTRAINT chk_payments_method CHECK (method IN ('card','cash','transfer'))
);
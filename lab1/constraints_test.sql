-- Test 1: UNIQUE on passport_number
INSERT INTO passengers (passport_number, full_name, birth_date, email, phone)
VALUES ('4512738291', 'the same passport', '1990-01-01',
        'unique.passport@mail.ru', '+79990000001');

-- Test 2: UNIQUE on email
INSERT INTO passengers (passport_number, full_name, birth_date, email, phone)
VALUES ('9999999999', 'the same email', '1990-01-01',
        'artem.smirnov.89@mail.ru', '+79990000002');

-- Test 3: CHECK on price (price > 0)
INSERT INTO tickets (booking_id, flight_id, class_id, seat_number, price)
VALUES (3, 1, 1, '30A', -500.00);

-- Test 4: CHECK on booking status
INSERT INTO bookings (passenger_id, status, total_price)
VALUES (1, 'flying', 5000.00);

-- Test 5: UNIQUE composite (flight_id, seat_number)
INSERT INTO tickets (booking_id, flight_id, class_id, seat_number, price)
VALUES (3, 1, 1, '12A', 7000.00);

-- Test 6: FOREIGN KEY on passenger_id
INSERT INTO bookings (passenger_id, status, total_price)
VALUES (9999, 'pending', 1000.00);

-- Test 7: CHECK on flight times
INSERT INTO flights (flight_number, departure_airport_id, arrival_airport_id,
                     aircraft_id, departure_time, arrival_time, status)
VALUES ('SU999', 1, 2, 1, '2026-12-01 10:00:00+03', '2026-12-01 08:00:00+03', 'scheduled');

-- Test 8: CHECK on same airports
INSERT INTO flights (flight_number, departure_airport_id, arrival_airport_id,
                     aircraft_id, departure_time, arrival_time, status)
VALUES ('SU888', 1, 1, 1, '2026-12-01 10:00:00+03', '2026-12-01 12:00:00+03', 'scheduled');

-- Test 9: UNIQUE on iata_code
INSERT INTO airports (iata_code, name, city, country)
VALUES ('SVO', 'Ne Sheremetyevo', 'Москва', 'Россия');

-- Test 10: CHECK on payment method
INSERT INTO payments (booking_id, amount, method)
VALUES (3, 5000.00, 'bitcoin');

-- Test 11: UNIQUE on tail_number
INSERT INTO aircraft (tail_number, model, total_seats)
VALUES ('RA-73001', 'ZV-67', 200);

-- Test 12: CHECK on birth_date
INSERT INTO passengers (passport_number, full_name, birth_date, email, phone)
VALUES ('7777777777', 'Vladymyr Vladymyr', '2099-01-01',
        'future@mail.ru', '+79990000003');

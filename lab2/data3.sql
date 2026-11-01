-- TASK 1.1

INSERT INTO passengers (passport_number, full_name, birth_date, email, phone) 
VALUES ('7777888899', 'Барак Обама', '1995-05-05', 'extra@mail.ru', '+79997778899');

INSERT INTO bookings (passenger_id, booked_at, status, total_price) 
VALUES (16, '2026-11-20 10:00:00+03', 'confirmed', 50000.00);

INSERT INTO tickets (booking_id, flight_id, class_id, seat_number, price) VALUES 
(19, 1, 1, '30A', 10000.00),
(19, 1, 1, '30B', 10000.00),
(19, 1, 1, '30C', 10000.00),
(19, 1, 1, '30D', 10000.00),
(19, 1, 1, '30E', 10000.00);

INSERT INTO bookings (passenger_id, booked_at, status, total_price) 
VALUES (1, '2026-11-21 12:00:00+03', 'confirmed', 0.00);
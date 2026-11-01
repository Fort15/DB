-- TASK 1.2

-- 1)
INSERT INTO passengers (passport_number, full_name, birth_date, email, phone) 
VALUES ('9999888877', 'Колесник Влад Игнатович', '1997-07-07', 'zxcwww1337228@mail.ru', '+79998887766');

INSERT INTO bookings (passenger_id, booked_at, status, total_price) 
VALUES ((SELECT passenger_id FROM passengers WHERE passport_number = '9999888877'), 
        '2026-11-23 15:00:00+03', 'pending', 25000.00);

INSERT INTO tickets (booking_id, flight_id, class_id, seat_number, price) 
VALUES 
((SELECT booking_id FROM bookings WHERE total_price = 25000.00 AND status = 'pending'), 2, 1, '15A', 12500.00),
((SELECT booking_id FROM bookings WHERE total_price = 25000.00 AND status = 'pending'), 2, 1, '15B', 12500.00);

-- 2)
UPDATE bookings 
SET status = 'confirmed' 
WHERE total_price = 25000.00 AND status = 'pending' AND passenger_id = (SELECT passenger_id FROM passengers WHERE passport_number = '9999888877');

-- 3)
UPDATE tickets 
SET price = price * 0.9 
WHERE flight_id = 1 AND class_id = 1;

-- 4)
DELETE FROM passengers 
WHERE passport_number = '9999888877';

-- 5)
BEGIN;

DELETE FROM passengers;

SELECT COUNT(*) AS "Пассажиров осталось" FROM passengers;

ROLLBACK;

SELECT COUNT(*) AS "Пассажиров вернулось" FROM passengers;
-- Найти билеты, цена > средней цены за этот же рейс
SELECT
    t1.ticket_id,
    t1.flight_id,
    t1.price,
    (SELECT AVG(t2.price) FROM tickets t2 WHERE t2.flight_id = t1.flight_id) AS avg_flight_price
FROM tickets t1
WHERE t1.price > (
    SELECT AVG(t2.price)
    FROM tickets t2
    WHERE t2.flight_id = t1.flight_id
);

-- Пассажиры у которых есть хотя бы один оплаченный платеж
SELECT 
    p.passenger_id,
    p.full_name
FROM passengers p
WHERE EXISTS (
    SELECT 1
    FROM bookings b
    JOIN payments pay ON b.booking_id = pay.booking_id
    WHERE b.passenger_id = p.passenger_id
);

-- Найти рейсы на которые не продано ни одного билета
SELECT 
    f.flight_id,
    f.flight_number
FROM flights f
WHERE NOT EXISTS (
    SELECT 1
    FROM tickets t
    WHERE t.flight_id = f.flight_id
);

-- Вывести самый дорогой билет для каждого пассажира
SELECT
    p.passenger_id,
    p.full_name,
    t.ticket_id,
    t.price
FROM passengers p
JOIN bookings b ON p.passenger_id = b.passenger_id
JOIN tickets t ON b.booking_id = t.booking_id
WHERE t.price = (
    SELECT MAX(t2.price)
    FROM bookings b2
    JOIN tickets t2 ON b2.booking_id = t2.booking_id
    WHERE b2.passenger_id = p.passenger_id
);
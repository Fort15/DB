-- Подробная информация о билете (1)
SELECT
    t.ticket_id,
    p.full_name AS passenger,
    f.flight_number,
    fc.name AS class_name,
    t.seat_number,
    t.price
FROM tickets t
JOIN bookings b ON t.booking_id = b.booking_id
JOIN passengers p ON b.passenger_id = p.passenger_id
JOIN flights f ON t.flight_id = f.flight_id
JOIN fare_classes fc ON t.class_id = fc.class_id
ORDER BY t.ticket_id;

-- Пассажиры без покупок (2)
SELECT
    p.passenger_id,
    p.full_name,
    p.email,
    t.ticket_id
FROM passengers p
LEFT JOIN bookings b ON p.passenger_id = b.passenger_id
LEFT JOIN tickets t ON b.booking_id = t.booking_id
WHERE b.booking_id IS NULL;


-- Запланированные рейсы из Мск в Казань (3)
SELECT
    f.flight_number,
    dep.city AS departure_city,
    arr.city AS arrival_city,
    ac.model AS aircraft_model,
    f.departure_time
FROM flights f
JOIN airports dep ON f.departure_airport_id = dep.airport_id
JOIN airports arr ON f.arrival_airport_id = arr.airport_id
JOIN aircraft ac ON f.aircraft_id = ac.aircraft_id
WHERE dep.iata_code = 'SVO' AND arr.iata_code = 'KZN' AND f.status = 'scheduled';
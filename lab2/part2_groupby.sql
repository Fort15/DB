-- Сколько билетов куплено на каждый рейс (1)
SELECT
    f.flight_number,
    COUNT(t.ticket_id) as ticket_sold
FROM flights f
JOIN tickets t ON f.flight_id = t.flight_id
GROUP BY f.flight_number
HAVING COUNT(t.ticket_id) > 2;

-- Выручка и средняя цена билета для каждого класса
SELECT
    fc.name AS class_name,
    SUM(t.price) AS total_revenue,
    AVG(t.price) AS avg_price
FROM fare_classes fc
JOIN tickets t ON fc.class_id = t.class_id
GROUP BY fc.name
HAVING SUM(t.price) > 50000;

-- Min, Max, Avg цена билетов для кажого самолета
SELECT 
    ac.model AS aircraft_model,
    MIN(t.price) AS min_ticket_price,
    MAX(t.price) AS max_ticket_price,
    AVG(t.price) AS avg_ticket_price
FROM aircraft ac
JOIN flights f ON ac.aircraft_id = f.aircraft_id
JOIN tickets t ON f.flight_id = t.flight_id
GROUP BY ac.model;
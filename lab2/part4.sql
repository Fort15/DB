-- Анализ выручки по моделям самолётов

WITH base_data AS (
    SELECT
        ac.model AS aircraft_model,
        f.flight_number,
        t.price AS ticket_price
    FROM tickets t
    JOIN flights f ON t.flight_id = f.flight_id
    JOIN aircraft ac ON f.aircraft_id = ac.aircraft_id
),

flight_stats AS (
    SELECT
        aircraft_model,
        flight_number,
        COUNT(*) as tickets_count,
        SUM(ticket_price) as flight_revenue
    FROM base_data
    GROUP BY aircraft_model, flight_number
),

aircraft_totals AS (
    SELECT
        aircraft_model,
        SUM(tickets_count) AS total_tickets,
        SUM(flight_revenue) AS total_revenue,
        AVG(flight_revenue) AS avg_revenue_per_flight
    FROM flight_stats
    GROUP BY aircraft_model
)

SELECT 
    aircraft_model,
    total_tickets,
    total_revenue,
    ROUND(avg_revenue_per_flight, 2) AS avg_revenue_per_flight
FROM aircraft_totals
ORDER BY total_revenue DESC;
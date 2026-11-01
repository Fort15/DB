BEGIN;

DROP TABLE IF EXISTS flight_schedule_changes;

CREATE TABLE flight_schedule_changes (
    log_id INT GENERATED ALWAYS AS IDENTITY,
    flight_id INT NOT NULL,
    
    new_departure_time TIMESTAMPTZ,
    new_arrival_time TIMESTAMPTZ,
    new_departure_airport_id INT,
    new_arrival_airport_id INT,

    changed_at TIMESTAMPTZ NOT NULL DEFAULT now(),

    CONSTRAINT pk_flights_log PRIMARY KEY (log_id),
    CONSTRAINT fk_flight_logs_flight FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id) ON DELETE CASCADE
);

COMMIT;
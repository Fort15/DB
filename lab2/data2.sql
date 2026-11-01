-- TASK 1.1

INSERT INTO passengers (passport_number, full_name, birth_date, email, phone) VALUES
('1111222233', 'Сидоров Петр Ильич', '1988-07-20', 'sidorov@mail.ru', '+79991112233'),
('2222333344', 'Никитина Дарья Олеговна', '1999-02-15', 'nikitina@mail.ru', '+79992223344'),
('3333444455', 'Гусев Артем Игоревич', '1990-12-05', 'gusev@mail.ru', '+79993334455'),
('4444555566', 'Фролова Светлана Ивановна', '1985-10-11', 'frolova@mail.ru', '+79994445566'),
('5555666677', 'Тестов Тест Тестович', '2000-01-01', 'test@mail.ru', '+79995556677'); 

INSERT INTO airports (iata_code, name, city, country) VALUES
('OVB', 'Tolmachevo', 'Novosibirsk', 'Russia'),
('KHV', 'Novy', 'Khabarovsk', 'Russia');

INSERT INTO aircraft (tail_number, model, total_seats) VALUES
('RA-88888', 'Airbus A330', 300),
('RA-99999', 'Boeing 737 MAX', 210);

INSERT INTO flights (flight_number, departure_airport_id, arrival_airport_id, aircraft_id, departure_time, arrival_time, status) VALUES
('SU123', 1, 7, 5, '2026-09-15 10:00:00+03', '2026-09-15 15:00:00+07', 'completed'),
('SU124', 7, 1, 5, '2026-10-10 12:00:00+07', '2026-10-10 13:00:00+03', 'completed'),
('SU125', 3, 8, 6, '2026-11-25 08:00:00+03', '2026-11-25 20:00:00+10', 'delayed'),
('SU126', 1, 2, 1, '2026-11-05 14:00:00+03', '2026-11-05 15:30:00+03', 'cancelled'),
('SU127', 4, 5, 2, '2026-11-15 18:00:00+03', '2026-11-15 20:00:00+03', 'scheduled');

INSERT INTO bookings (passenger_id, booked_at, status, total_price) VALUES
(1, '2026-09-01 10:00:00+03', 'confirmed', 35000.00), 
(2, '2026-10-02 11:00:00+03', 'confirmed', 15000.00),
(11, '2026-11-01 09:00:00+03', 'confirmed', 12000.00), 
(12, '2026-11-05 10:00:00+03', 'pending', 8000.00),
(13, '2026-11-10 12:00:00+03', 'cancelled', 45000.00),
(1, '2026-11-12 15:00:00+03', 'confirmed', 20000.00),
(14, '2026-11-15 10:00:00+03', 'confirmed', 50000.00), 
(2, '2026-11-20 14:00:00+03', 'pending', 30000.00);

INSERT INTO tickets (booking_id, flight_id, class_id, seat_number, price) VALUES
(11, 9, 1, '10A', 15000.00),
(11, 9, 1, '10B', 20000.00),
(12, 10, 2, '3A', 15000.00),
(13, 11, 1, '15C', 12000.00),
(14, 11, 1, '16A', 8000.00),
(15, 12, 2, '4A', 45000.00),
(16, 9, 1, '11A', 20000.00),
(17, 13, 3, '1A', 50000.00),
(18, 10, 1, '20B', 30000.00);

INSERT INTO payments (booking_id, amount, method, paid_at) VALUES
(11, 35000.00, 'card', '2026-09-01 10:05:00+03'),
(12, 15000.00, 'card', '2026-10-02 11:05:00+03'),
(13, 12000.00, 'transfer', '2026-11-01 09:05:00+03'),
(15, 45000.00, 'card', '2026-11-10 12:05:00+03'),
(17, 50000.00, 'transfer', '2026-11-15 10:05:00+03');
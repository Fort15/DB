INSERT INTO passengers (passport_number, full_name, birth_date, email, phone) VALUES
('4512738291', 'Смирнов Артем Игоревич', '1989-05-14', 'artem.smirnov.89@mail.ru', '+79161234567'),
('4615920183', 'Петрова Елена Викторовна', '1994-11-22', 'elena.petrova.ZV@yandex.ru', '+79257654321'),
('5008147258', 'Кузнецов Дмитрий Сергеевич', '1981-02-03', 'kuznetsov.dmitry@gmail.com', '+79039876543'),
('4021639402', 'Попова Анна Андреевна', '2001-08-18', 'anna.popova.2001@rambler.ru', '+79771112233'),
('6003826154', 'Васильев Максим Николаевич', '1975-06-30', 'vasiliev_mn@internet.ru', '+79514445566'),
('3618503921', 'Соколова Ольга Михайловна', '1998-01-12', 'olga.sokolova.98@bk.ru', '+79623332211'),
('2811294810', 'Федоров Иван Александрович', '1992-09-25', 'fedorov.ivan92@list.ru', '+79055557788'),
('1906471039', 'Морозова Мария Дмитриевна', '1986-04-07', 'morozova.maris@inbox.ru', '+79108889900'),
('0823315926', 'Волков Алексей Владимирович', '2003-12-19', 'volkov.alex.v@yandex.ru', '+79262224466'),
('6502758392', 'Лебедева Наталья Игоревна', '1979-07-05', 'natalia.lebedeva79@mail.ru', '+79096663311');

INSERT INTO airports (iata_code, name, city, country) VALUES
('SVO', 'Sheremetyevo International', 'Moscow', 'Russia'),
('DME', 'Domodedovo International', 'Moscow', 'Russia'),
('LED', 'Pulkovo International', 'St. Petersburg', 'Russia'),
('KZN', 'Kazan International', 'Kazan', 'Russia'),
('AER', 'Sochi International', 'Sochi', 'Russia'),
('VVO', 'Vladivostok International', 'Vladivostok', 'Russia');

INSERT INTO aircraft (tail_number, model, total_seats) VALUES
('RA-73001', 'Boeing 737-800', 189),
('RA-73002', 'Airbus A320', 180),
('RA-73003', 'Boeing 777-300ER', 402),
('RA-73004', 'Sukhoi Superjet 100', 98);

INSERT INTO fare_classes (code, name, baggage_kg, refundable) VALUES
('EC', 'Economy',  23, FALSE),
('BC', 'Business', 32, TRUE),
('FC', 'First',    40, TRUE);

INSERT INTO flights (flight_number, departure_airport_id, arrival_airport_id, 
                     aircraft_id, departure_time, arrival_time, status) VALUES
('SU100', 1, 3, 1, '2026-11-01 08:00:00+03', '2026-11-01 09:20:00+03', 'scheduled'),
('SU101', 3, 1, 1, '2026-11-01 10:00:00+03', '2026-11-01 11:25:00+03', 'scheduled'),
('SU200', 1, 4, 2, '2026-11-01 12:00:00+03', '2026-11-01 13:40:00+03', 'scheduled'),
('SU300', 1, 5, 3, '2026-11-02 07:00:00+03', '2026-11-02 10:00:00+03', 'scheduled'),
('SU301', 5, 1, 3, '2026-11-02 11:00:00+03', '2026-11-02 14:00:00+03', 'delayed'),
('SU400', 2, 6, 3, '2026-11-03 05:00:00+03', '2026-11-03 14:30:00+03', 'scheduled'),
('SU500', 1, 2, 4, '2026-11-04 09:00:00+03', '2026-11-04 10:00:00+03', 'cancelled'),
('SU600', 4, 3, 2, '2026-11-05 15:00:00+03', '2026-11-05 16:45:00+03', 'completed');

INSERT INTO bookings (passenger_id, booked_at, status, total_price) VALUES
(1,  '2026-10-01 10:00:00+03', 'confirmed', 15000.00),
(2,  '2026-10-02 11:30:00+03', 'confirmed', 25000.00),
(3,  '2026-10-03 09:15:00+03', 'pending',    8000.00),
(4,  '2026-10-04 14:20:00+03', 'confirmed', 45000.00),
(5,  '2026-10-05 16:45:00+03', 'cancelled', 12000.00),
(6,  '2026-10-06 08:00:00+03', 'confirmed', 30000.00),
(7,  '2026-10-07 19:30:00+03', 'pending',    6000.00),
(8,  '2026-10-08 12:00:00+03', 'confirmed', 20000.00),
(9,  '2026-10-09 15:00:00+03', 'confirmed', 18000.00),
(10, '2026-10-10 17:20:00+03', 'pending',   22000.00);

INSERT INTO tickets (booking_id, flight_id, class_id, seat_number, price) VALUES
(1, 1, 1, '12A', 7500.00),
(1, 1, 1, '12B', 7500.00),
(2, 2, 2, '3A', 12500.00),
(2, 2, 2, '3B', 12500.00),
(3, 3, 1, '15C', 8000.00),
(4, 4, 3, '1A', 22500.00),
(4, 4, 3, '1B', 22500.00),
(5, 5, 1, '20D', 12000.00),
(6, 6, 2, '5A', 15000.00),
(6, 6, 2, '5B', 15000.00),
(7, 7, 1, '22A', 6000.00),
(8, 8, 2, '4A', 10000.00),
(8, 8, 2, '4B', 10000.00),
(9, 1, 2, '2A', 9000.00),
(9, 1, 2, '2B', 9000.00),
(10,3, 1, '18E', 11000.00),
(10,3, 1, '18F', 11000.00);

INSERT INTO payments (booking_id, amount, method, paid_at) VALUES
(1, 15000.00, 'card', '2026-10-01 10:05:00+03'),
(2, 25000.00, 'card', '2026-10-02 11:35:00+03'),
(4, 45000.00, 'transfer', '2026-10-04 14:25:00+03'),
(5, 12000.00, 'card', '2026-10-05 16:50:00+03'),
(6, 30000.00, 'card', '2026-10-06 08:05:00+03'),
(8, 20000.00, 'transfer', '2026-10-08 12:05:00+03'),
(9, 18000.00, 'cash', '2026-10-09 15:05:00+03'),
(10, 22000.00, 'card', '2026-10-10 17:25:00+03');
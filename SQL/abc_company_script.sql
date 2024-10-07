DROP DATABASE IF EXISTS abc_company;
CREATE DATABASE abc_company;
USE abc_company;
CREATE TABLE clients (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    client_type ENUM('Individual', 'Empresa') NOT NULL,
    identification VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE
);

CREATE TABLE addresses (
	id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    address_type ENUM('Física', 'Facturación'),
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    country VARCHAR(255),
    postal_code VARCHAR(50),
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

CREATE TABLE contact_methods (
	id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    contact_type ENUM('Telefono', 'Email') NOT NULL,
    contact VARCHAR(250) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

CREATE TABLE company_contacts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    contact_name VARCHAR(100),
    contact_position VARCHAR(100),
    contact_phone VARCHAR(20),
    contact_email VARCHAR(100),
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type ENUM('Solo', 'Doble', 'Suite') NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    room_status BOOLEAN DEFAULT TRUE
);

CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE room_services (
    room_id INT,
    service_id INT,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);


CREATE TABLE seasons (
    season_id INT AUTO_INCREMENT PRIMARY KEY,
    season_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price_increase DECIMAL(5,2) NOT NULL DEFAULT 1.00 -- Price multiplier (1.00 = no change)
);


CREATE TABLE season_room_rates (
    season_id INT,
    room_type ENUM('Solo', 'Doble', 'Suite'),
    price_increase DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (season_id, room_type),
    FOREIGN KEY (season_id) REFERENCES seasons(season_id) ON DELETE CASCADE
);


CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    room_id INT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    reservation_status ENUM('Pendiente', 'Confirmada', 'Cancelada') NOT NULL,
    total DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE
);


CREATE TABLE reservation_services (
    reservation_id INT,
    service_id INT,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);


CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Tarjeta', 'Transferencia', 'Efectivo') NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id) ON DELETE CASCADE
);

INSERT INTO clients (name, client_type, identification)
VALUES 
('Michel Jackson', 'Individual', '789346'),
('Tony Stark', 'Individual', '174891'),
('Real Madrid', 'Empresa', '687843'),
('Bruce Wayne', 'Individual', '123146'),
('Luis Gonzales', 'Individual', '878752');

INSERT INTO addresses (client_id, address_type, address, city, country, postal_code)
VALUES
(1, 'Física', '123 4ta calle 23-91', 'New York', 'USA', '10001'),
(2, 'Facturación', '456 4ta calle', 'Guatemala', 'Guatemala', '94101'),
(3, 'Física', 'Zona 1', 'Guatemala', 'Guatemala', '90001'),
(4, 'Facturación', 'zona 2', 'Guatemala', 'Guatemala', '60601'),
(5, 'Física', 'zona 3', 'Guatemala', 'Guatemala', '33101');

INSERT INTO contact_methods (client_id, contact_type, contact)
VALUES
(1, 'Telefono', '555-1234'),
(2, 'Email', 'email@email.com'),
(3, 'Telefono', '555-9876'),
(4, 'Email', 'email@email2.com'),
(5, 'Telefono', '555-5432');


INSERT INTO company_contacts (client_id, contact_name, contact_position, contact_phone, contact_email)
VALUES
(3, 'Cristiano Ronaldo', 'Futbolista del Real Madrid', '555-9999', 'cr7@email.com'),
(3, 'Vinicius Jr', 'Futbolista del Real Madrid', '777-8888', 'vini@email.com'),
(3, 'Kylian Mbappé', 'Futbolista del Real Madrid', '555-8888', 'km@email.com');


INSERT INTO rooms (room_number, room_type, price, room_status)
VALUES
('101', 'Solo', 100.00, TRUE),
('102', 'Doble', 150.00, TRUE),
('103', 'Suite', 300.00, TRUE),
('104', 'Solo', 110.00, TRUE),
('105', 'Solo', 160.00, TRUE);


INSERT INTO services (service_name, price)
VALUES
('Internet', 10.00),
('Desayuno', 20.00),
('Servicio a la habitación', 30.00),
('Piscina', 50.00),
('TV por cable', 40.00);

INSERT INTO room_services (room_id, service_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5);


INSERT INTO seasons (season_name, start_date, end_date, price_increase)
VALUES
('Temporada alta', '2024-12-01', '2025-01-15', 1.50),
('Temporada media', '2024-07-01', '2024-08-31', 1.25),
('Temporada baja', '2024-01-16', '2024-06-30', 1.00),
('Temporada de verano', '2024-11-20', '2024-11-30', 1.75),
('Temporada de invierno', '2024-09-01', '2024-09-10', 1.60);

INSERT INTO season_room_rates (season_id, room_type, price_increase)
VALUES
(1, 'Solo', 1.50),
(2, 'Doble', 1.25),
(3, 'Suite', 1.00),
(4, 'Solo', 1.75),
(5, 'Solo', 1.60);

INSERT INTO reservations (client_id, room_id, check_in_date, check_out_date, reservation_status, total)
VALUES
(1, 1, '2024-07-01', '2024-07-07', 'Confirmada', 0),
(2, 5, '2024-11-20', '2024-11-25', 'Cancelada', 0),
(2, 2, '2024-07-01', '2024-07-07', 'Confirmada', 0),
(2, 2, '2024-12-05', '2024-12-10', 'Pendiente', 0),
(3, 3, '2024-08-01', '2024-08-05', 'Confirmada', 0),
(4, 4, '2024-09-02', '2024-09-06', 'Confirmada', 0),
(5, 5, '2024-11-20', '2024-11-25', 'Cancelada', 0);



INSERT INTO reservation_services (reservation_id, service_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);


INSERT INTO payments (reservation_id, amount, payment_method, payment_date)
VALUES
(1, 150.00, 'Transferencia', '2024-07-01'),
(2, 200.00, 'Transferencia', '2024-12-01'),
(3, 300.00, 'Tarjeta', '2024-08-01'),
(4, 250.00, 'Tarjeta', '2024-09-01'),
(5, 100.00, 'Efectivo', '2024-11-20');

SELECT * FROM clients;

SELECT 
    c.id AS client_id,
    c.name AS client_name,
    c.client_type,
    cm.contact_type AS contact_method_type,
    cm.contact AS contact_method,
    cc.contact_name AS company_contact_name,
    cc.contact_position,
    cc.contact_phone,
    cc.contact_email
FROM 
    clients c
LEFT JOIN 
    contact_methods cm ON c.id = cm.client_id
LEFT JOIN 
    company_contacts cc ON c.id = cc.client_id
ORDER BY 
    c.id;




-- Consulta del costo total por reserva
SELECT 
    R.reservation_id,
    C.name AS client,
    H.room_number,
    H.room_type,
    (H.price * T.price_increase) AS price_with_season,
    SUM(S.price) AS service_cost,
    (H.price * T.price_increase + SUM(S.price)) AS total_cost
FROM reservations R
JOIN clients C ON R.client_id = C.id
JOIN rooms H ON R.room_id = H.id
JOIN seasons T ON T.season_id = 2
LEFT JOIN reservation_services RS ON R.reservation_id = RS.reservation_id
LEFT JOIN services S ON RS.service_id = S.id
WHERE R.reservation_id = 2
GROUP BY R.reservation_id, C.name, H.room_number, H.room_type, T.price_increase;

-- Consulta de ingresos generados por habitaciones y servicios en un período:
SELECT 
    SUM(P.amount) AS total_income,
    SUM(H.price) AS room_income,
    SUM(S.price) AS service_income
FROM payments P
JOIN reservations R ON P.reservation_id = R.reservation_id
JOIN rooms H ON R.room_id = H.id
LEFT JOIN reservation_services RS ON R.reservation_id = RS.reservation_id
LEFT JOIN services S ON RS.service_id = S.id
WHERE P.payment_date BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY R.room_id;


-- Consulta de clientes frecuentes

SELECT 
    C.name AS client,
    COUNT(R.reservation_id) AS total_reservations,
    SUM(P.amount) AS total_value
FROM clients C
JOIN reservations R ON C.id = R.client_id
JOIN payments P ON R.reservation_id = P.reservation_id
WHERE R.check_in_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY C.id
ORDER BY total_reservations DESC;


-- Consulta de ocupación por habitación
SELECT 
    H.room_type,
    COUNT(R.reservation_id) AS total_reservations,
    COUNT(R.room_id) AS total_rooms,
    (COUNT(R.reservation_id)) AS occupied_rooms
FROM rooms H
LEFT JOIN reservations R ON H.id = R.room_id
WHERE R.check_in_date BETWEEN '2024-01-01' AND '2024-12-31' -- Modifica las fechas según necesites
GROUP BY H.room_type;





DROP DATABASE ipem_db;
CREATE DATABASE ipem_db;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS incidents_aud;
DROP TABLE IF EXISTS refuelings_aud;
DROP TABLE IF EXISTS records_aud;
DROP TABLE IF EXISTS attendance_aud;
DROP TABLE IF EXISTS cars_aud;
DROP TABLE IF EXISTS users_aud;
DROP TABLE IF EXISTS car_type_aud;
DROP TABLE IF EXISTS revinfo;

DROP TABLE IF EXISTS incidents;
DROP TABLE IF EXISTS refuelings;
DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS car_type;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================================================
-- 1. TABELAS PRINCIPAIS
-- =========================================================================
CREATE TABLE car_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100),
    model VARCHAR(100),
    year INT,
    category ENUM('PASSENGER', 'UTILITY'),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM'
);

CREATE TABLE users (
    registration VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    permission VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    gender VARCHAR(20),
    birth_date DATE,
    driver_license VARCHAR(20),
    driver_license_category VARCHAR(5),
    driver_license_expiration DATE,
    employee_status ENUM('AVAILABLE', 'ON_DUTY', 'DISMISSED') DEFAULT 'AVAILABLE',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM'
);

CREATE TABLE cars (
    prefix VARCHAR(20) PRIMARY KEY,
    license_plate VARCHAR(10),
    type_id INT,
    fuel VARCHAR(20),
    current_km FLOAT,
    next_oil_change_km FLOAT,
    tank_capacity FLOAT,
    renavam VARCHAR(11) UNIQUE,
    chassi VARCHAR(17) UNIQUE,
    available BOOLEAN,
    color VARCHAR(30),
    required_license VARCHAR(20),
    vehicle_status ENUM('AVAILABLE', 'IN_USE', 'MAINTENANCE', 'UNAVAILABLE') DEFAULT 'AVAILABLE',
    observations TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM',
    CONSTRAINT fk_car_type FOREIGN KEY (type_id) REFERENCES car_type(id)
);

CREATE TABLE attendance (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    car_prefix VARCHAR(20),
    user_registration VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    completion_time DATETIME,
    expected_completion_time DATETIME,
    departure_km FLOAT,
    arrival_km FLOAT,
    destination_requester VARCHAR(255),
    description TEXT,
    priority ENUM('LOW', 'MEDIUM', 'HIGH', 'SCHEDULED') DEFAULT 'MEDIUM',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM',
    CONSTRAINT fk_service_car FOREIGN KEY (car_prefix) REFERENCES cars(prefix),
    CONSTRAINT fk_service_user FOREIGN KEY (user_registration) REFERENCES users(registration)
);

CREATE TABLE records (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    service_id BIGINT,
    record_type ENUM('CHECK_IN', 'CHECK_OUT', 'REFUELING', 'INCIDENT'),
    record_date DATETIME,
    record_km FLOAT,
    note VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM',
    CONSTRAINT fk_record_service FOREIGN KEY (service_id) REFERENCES attendance(id)
);

CREATE TABLE refuelings (
    record_id BIGINT PRIMARY KEY,
    liters FLOAT,
    price_per_liter DOUBLE,
    total_amount DOUBLE,
    fuel_type ENUM('GASOLINE', 'ETHANOL', 'DIESEL', 'GNV'),
    gas_station_name VARCHAR(100),
    invoice VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM',
    CONSTRAINT fk_refueling_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE
);

CREATE TABLE incidents (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    service_id BIGINT,
    incident_type ENUM('CANCELLATION', 'DEFECT') NOT NULL,
    severity ENUM('LOW', 'MEDIUM', 'CRITICAL') DEFAULT 'MEDIUM',
    location VARCHAR(255),
    request_support BOOLEAN DEFAULT FALSE,
    description TEXT,
    resolved BOOLEAN DEFAULT FALSE,
    resolved_at DATETIME,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    updated_by VARCHAR(100) DEFAULT 'SYSTEM',
    CONSTRAINT fk_incident_service FOREIGN KEY (service_id) REFERENCES attendance(id)
);

-- =========================================================================
-- 2. TABELAS DE AUDITORIA (HIBERNATE ENVERS)
-- =========================================================================
CREATE TABLE revinfo (
    rev INT AUTO_INCREMENT PRIMARY KEY,
    revtstmp BIGINT
);

CREATE TABLE car_type_aud (
    id INT, rev INT, revtype TINYINT,
    brand VARCHAR(100), model VARCHAR(100), year INT, category VARCHAR(50), is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (id, rev),
    CONSTRAINT fk_car_type_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

CREATE TABLE users_aud (
    registration VARCHAR(50), rev INT, revtype TINYINT,
    name VARCHAR(100), email VARCHAR(255), password VARCHAR(255), permission VARCHAR(50),
    phone VARCHAR(20), gender VARCHAR(20), birth_date DATE, driver_license VARCHAR(20),
    driver_license_category VARCHAR(5), driver_license_expiration DATE, employee_status VARCHAR(50), is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (registration, rev),
    CONSTRAINT fk_users_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

CREATE TABLE cars_aud (
    prefix VARCHAR(20), rev INT, revtype TINYINT,
    license_plate VARCHAR(10), type_id INT, fuel VARCHAR(20), current_km FLOAT,
    next_oil_change_km FLOAT, tank_capacity FLOAT, renavam VARCHAR(11), chassi VARCHAR(17),
    available BOOLEAN, color VARCHAR(30), required_license VARCHAR(20), vehicle_status VARCHAR(50),
    observations TEXT, is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (prefix, rev),
    CONSTRAINT fk_cars_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

CREATE TABLE attendance_aud (
    id BIGINT, rev INT, revtype TINYINT,
    car_prefix VARCHAR(20), user_registration VARCHAR(50),
    departure_time DATETIME, arrival_time DATETIME, completion_time DATETIME, expected_completion_time DATETIME,
    departure_km FLOAT, arrival_km FLOAT,
    destination_requester VARCHAR(255), description TEXT, priority VARCHAR(20), is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (id, rev),
    CONSTRAINT fk_attendance_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

CREATE TABLE records_aud (
    id BIGINT, rev INT, revtype TINYINT,
    service_id BIGINT, record_type VARCHAR(50), record_date DATETIME, record_km FLOAT, note VARCHAR(255), is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (id, rev),
    CONSTRAINT fk_records_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

CREATE TABLE refuelings_aud (
    record_id BIGINT, rev INT, revtype TINYINT,
    liters FLOAT, price_per_liter DOUBLE, total_amount DOUBLE, fuel_type VARCHAR(20), gas_station_name VARCHAR(100), invoice VARCHAR(50), is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (record_id, rev),
    CONSTRAINT fk_refuelings_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

CREATE TABLE incidents_aud (
    id BIGINT, rev INT, revtype TINYINT,
    service_id BIGINT, incident_type VARCHAR(50), severity VARCHAR(20), location VARCHAR(255),
    request_support BOOLEAN, description TEXT, resolved BOOLEAN, resolved_at DATETIME, is_active BOOLEAN,
    created_at DATETIME, updated_at DATETIME, created_by VARCHAR(100), updated_by VARCHAR(100),
    PRIMARY KEY (id, rev),
    CONSTRAINT fk_incidents_aud_rev FOREIGN KEY (rev) REFERENCES revinfo(rev)
);

-- =========================================================================
-- 3. INSERTS
-- =========================================================================
INSERT INTO car_type (brand, model, year, category) VALUES 
('Toyota', 'Corolla', 2024, 'PASSENGER'), ('Chevrolet', 'S10', 2023, 'UTILITY'), ('Ford', 'Ranger', 2024, 'UTILITY'),
('Volkswagen', 'Virtus', 2023, 'PASSENGER'), ('Fiat', 'Cronos', 2022, 'PASSENGER'), ('Renault', 'Oroch', 2023, 'UTILITY'),
('Nissan', 'Frontier', 2024, 'UTILITY'), ('Honda', 'HR-V', 2024, 'PASSENGER'), ('Jeep', 'Renegade', 2023, 'PASSENGER'),
('Ford', 'Transit', 2022, 'UTILITY'), ('Renault', 'Duster', 2023, 'UTILITY'), ('Fiat', 'Mobi', 2024, 'PASSENGER'),
('Chevrolet', 'Onix', 2023, 'PASSENGER'), ('Ford', 'Ka Sedan', 2021, 'PASSENGER'), ('Volkswagen', 'Gol', 2022, 'PASSENGER'),
('Toyota', 'Hilux', 2024, 'UTILITY');

INSERT INTO users (registration, name, email, password, permission, phone, driver_license_category, employee_status) VALUES 
('10001', 'Ana Paula Martins', 'ana.paula@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990001', 'B', 'ON_DUTY'),
('10002', 'Bruno Lima', 'bruno.lima@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990002', 'AB', 'AVAILABLE'),
('10003', 'Marcos Vinicius', 'marcos.v@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990003', 'B', 'AVAILABLE'),
('10004', 'Juliana Costa', 'juliana.c@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990004', 'AB', 'ON_DUTY'),
('10005', 'Carla Mendes', 'carla.m@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990005', 'B', 'AVAILABLE'),
('10006', 'Eduardo Alves', 'eduardo.alves@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'ADMINISTRATOR', '11999990006', 'B', 'AVAILABLE'),
('10007', 'Fernanda Rocha', 'fernanda.r@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990007', 'AB', 'AVAILABLE'),
('10008', 'Niuan Spolidorio da Rocha Souza', 'niuan.souza@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'ADMINISTRATOR', '11999990008', 'B', 'AVAILABLE'),
('10009', 'Igor Mendes', 'igor.mendes@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990009', 'D', 'ON_DUTY'),
('10010', 'Larissa Gomes', 'larissa.gomes@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990010', 'B', 'AVAILABLE'),
('10011', 'Kevin Santos', 'kevin.santos@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990011', 'B', 'AVAILABLE'),
('10012', 'Helena Duarte', 'helena.duarte@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'ADMINISTRATOR', '11999990012', 'B', 'AVAILABLE'),
('10013', 'Thiago Silva', 'thiago.silva@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990013', 'D', 'AVAILABLE'),
('10014', 'Amanda Oliveira', 'amanda.o@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990014', 'B', 'AVAILABLE'),
('10015', 'Rafael Pereira', 'rafael.p@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990015', 'AB', 'ON_DUTY'),
('10016', 'Camila Ribeiro', 'carla.r@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990016', 'B', 'AVAILABLE'),
('10017', 'Diego Nogueira', 'diego.n@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990017', 'B', 'AVAILABLE'),
('10018', 'Aline Castro', 'aline.c@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990018', 'B', 'AVAILABLE'),
('10019', 'Felipe Santos', 'felipe.s@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990019', 'AB', 'AVAILABLE'),
('10020', 'Letícia Moraes', 'leticia.m@ipem.sp.gov.br', '$2a$10$YB1lLj/IMXD4Lm0cbAphKumArFegy1hC8yxr0Cm3/n4jm9kAd7rFi', 'TECHNICIAN', '11999990020', 'B', 'AVAILABLE');

INSERT INTO cars (prefix, license_plate, type_id, fuel, current_km, tank_capacity, vehicle_status, color) VALUES 
('1234', 'KAA1234', 14, 'Gasoline', 15000.0, 45.0, 'AVAILABLE', 'Silver'),
('5678', 'GOL5678', 15, 'Gasoline', 45000.0, 50.0, 'IN_USE', 'White'),
('9012', 'MOB9012', 12, 'Gasoline', 8900.0, 40.0, 'AVAILABLE', 'Black'),
('3456', 'ONX3456', 13, 'Gasoline', 5500.0, 44.0, 'AVAILABLE', 'Red'),
('7890', 'HLX7890', 16, 'Diesel', 22000.0, 80.0, 'IN_USE', 'White'),
('4412', 'DST4412', 11, 'Gasoline', 30000.0, 50.0, 'AVAILABLE', 'Gray'),
('CAR007', 'STU1007', 6, 'Diesel', 12000.0, 60.0, 'UNAVAILABLE', 'White'),
('CAR008', 'VWX1008', 7, 'Diesel', 95000.0, 75.0, 'AVAILABLE', 'Black'),
('CAR009', 'YZA1009', 8, 'Gasoline', 5000.0, 50.0, 'AVAILABLE', 'White'),
('CAR010', 'BCD1010', 9, 'Gasoline', 4000.0, 45.0, 'AVAILABLE', 'Silver'),
('CAR011', 'AAA1111', 1, 'Gasoline', 1000.0, 50.0, 'AVAILABLE', 'White'),
('CAR012', 'BBB2222', 2, 'Diesel', 15000.0, 70.0, 'AVAILABLE', 'Black'),
('CAR013', 'CCC3333', 3, 'Diesel', 25000.0, 80.0, 'IN_USE', 'Silver'),
('CAR014', 'DDD4444', 4, 'Gasoline', 3500.0, 50.0, 'AVAILABLE', 'Gray'),
('CAR015', 'EEE5555', 5, 'Gasoline', 12000.0, 45.0, 'AVAILABLE', 'White'),
('CAR016', 'FFF6666', 6, 'Gasoline', 18000.0, 55.0, 'AVAILABLE', 'Black'),
('CAR017', 'GGG7777', 7, 'Diesel', 40000.0, 80.0, 'MAINTENANCE', 'Silver'),
('CAR018', 'HHH8888', 8, 'Gasoline', 5000.0, 50.0, 'AVAILABLE', 'White'),
('CAR019', 'III9999', 9, 'Gasoline', 8000.0, 55.0, 'AVAILABLE', 'Black'),
('CAR020', 'JJJ0000', 10, 'Diesel', 11000.0, 75.0, 'AVAILABLE', 'Silver');

INSERT INTO attendance (id, car_prefix, user_registration, departure_time, arrival_time, completion_time, expected_completion_time, departure_km, arrival_km, destination_requester, description, priority) VALUES 
(7340, '4412', '10005', '2026-04-16 10:10:00', '2026-04-16 11:05:00', '2026-04-16 11:05:00', '2026-04-16 11:30:00', 30000.0, 30015.0, 'Base Central', 'Revisão de documentos e rastreamento de tacógrafo. Todos os pontos de conformidade foram atendidos.', 'MEDIUM'),
(7341, '7890', '10004', '2026-04-20 07:40:00', NULL, NULL, '2026-04-20 12:00:00', 22000.0, NULL, 'Polo Oeste', 'Verificação de geração de dados e conformidade do tacógrafo. A próxima etapa é fixação do lacre.', 'LOW'),
(7342, '3456', '10003', '2026-04-17 12:55:00', '2026-04-17 14:15:00', '2026-04-17 14:15:00', '2026-04-17 15:00:00', 5500.0, 5540.0, 'Corredor Sul', 'Verificação de materiais perigosos e acondicionamento correto. Todas as medições dentro dos parâmetros.', 'HIGH'),
(7343, '9012', '10002', '2026-04-17 15:05:00', '2026-04-17 16:40:00', '2026-04-17 16:40:00', '2026-04-17 17:00:00', 8900.0, 8935.0, 'Regional Norte', 'Instalação e calibração do radar interno. Não foram encontradas falhas adicionais após o procedimento.', 'SCHEDULED'),
(7344, '5678', '10001', '2026-04-20 09:05:00', NULL, NULL, '2026-04-20 11:20:00', 45000.0, NULL, 'Base Leste', 'Verificação de válvulas e registros de gás. Sem desvios críticos até o momento.', 'MEDIUM'),
(7345, '1234', NULL, '2026-04-20 08:10:00', NULL, NULL, '2026-04-20 10:00:00', 15000.0, NULL, 'Av. Brigadeiro Faria Lima, 1540', 'Relato de perda de pressão no circuito de combustível. Técnico deve investigar bomba, filtro e sensor de bomba.', 'HIGH');

INSERT INTO revinfo (rev, revtstmp) VALUES 
(1, 1776262200000), (2, 1776348600000), (3, 1776356700000), 
(4, 1776361500000), (5, 1776582300000), (6, 1776585600000);

INSERT INTO attendance_aud (id, rev, revtype, car_prefix, user_registration, departure_time, arrival_time, completion_time, expected_completion_time, departure_km, arrival_km, destination_requester, description, priority, is_active) VALUES 
(7340, 1, 0, '4412', '10005', '2026-04-16 10:10:00', '2026-04-16 11:05:00', '2026-04-16 11:05:00', '2026-04-16 11:30:00', 30000.0, 30015.0, 'Base Central', 'Revisão de documentos e rastreamento de tacógrafo. Todos os pontos de conformidade foram atendidos.', 'MEDIUM', 1),
(7342, 2, 0, '3456', '10003', '2026-04-17 12:55:00', '2026-04-17 14:15:00', '2026-04-17 14:15:00', '2026-04-17 15:00:00', 5500.0, 5540.0, 'Corredor Sul', 'Verificação de materiais perigosos e acondicionamento correto. Todas as medições dentro dos parâmetros.', 'HIGH', 1),
(7343, 3, 0, '9012', '10002', '2026-04-17 15:05:00', '2026-04-17 16:40:00', '2026-04-17 16:40:00', '2026-04-17 17:00:00', 8900.0, 8935.0, 'Regional Norte', 'Instalação e calibração do radar interno. Não foram encontradas falhas adicionais após o procedimento.', 'SCHEDULED', 1),
(7341, 4, 0, '7890', '10004', '2026-04-20 07:40:00', NULL, NULL, '2026-04-20 12:00:00', 22000.0, NULL, 'Polo Oeste', 'Verificação de geração de dados e conformidade do tacógrafo. A próxima etapa é fixação do lacre.', 'LOW', 1),
(7345, 5, 0, '1234', NULL, '2026-04-20 08:10:00', NULL, NULL, '2026-04-20 10:00:00', 15000.0, NULL, 'Av. Brigadeiro Faria Lima, 1540', 'Relato de perda de pressão no circuito de combustível. Técnico deve investigar bomba, filtro e sensor de bomba.', 'HIGH', 1),
(7344, 6, 0, '5678', '10001', '2026-04-20 09:05:00', NULL, NULL, '2026-04-20 11:20:00', 45000.0, NULL, 'Base Leste', 'Verificação de válvulas e registros de gás. Sem desvios críticos até o momento.', 'MEDIUM', 1);

INSERT INTO attendance (id, car_prefix, user_registration, departure_time, completion_time, departure_km, destination_requester, description, priority) VALUES 
(7346, 'CAR011', '10007', '2026-04-21 08:00:00', '2026-04-21 17:00:00', 1000.0, 'São Paulo', 'Inspeção fiscal de rotina', 'MEDIUM'),
(7347, 'CAR012', '10009', '2026-04-22 09:00:00', '2026-04-22 16:00:00', 15000.0, 'Campinas', 'Verificação de equipamentos', 'HIGH'),
(7348, 'CAR013', '10010', '2026-04-23 07:30:00', NULL, 25000.0, 'Santos', 'Transporte de materiais', 'LOW'),
(7349, 'CAR014', '10011', '2026-04-24 08:00:00', '2026-04-24 12:00:00', 3500.0, 'Sorocaba', 'Reunião administrativa', 'MEDIUM'),
(7350, 'CAR015', '10013', '2026-04-25 10:00:00', '2026-04-25 18:00:00', 12000.0, 'Jundiaí', 'Aferição de balanças', 'HIGH'),
(7351, 'CAR016', '10014', '2026-04-26 08:00:00', '2026-04-26 14:00:00', 18000.0, 'São José dos Campos', 'Manutenção corretiva', 'SCHEDULED'),
(7352, 'CAR017', '10015', '2026-04-27 09:00:00', NULL, 40000.0, 'Taubaté', 'Entrega de notificações', 'MEDIUM'),
(7353, 'CAR018', '10016', '2026-04-28 08:30:00', '2026-04-28 17:00:00', 5000.0, 'Jacareí', 'Verificação de postos', 'HIGH'),
(7354, 'CAR019', '10017', '2026-04-29 07:00:00', '2026-04-29 15:00:00', 8000.0, 'Guarulhos', 'Visita técnica', 'LOW'),
(7355, 'CAR020', '10018', '2026-04-30 08:00:00', '2026-04-30 16:00:00', 11000.0, 'Osasco', 'Fiscalização de radar', 'MEDIUM'),
(7356, 'CAR007', '10019', '2026-05-01 08:00:00', NULL, 12000.0, 'São Paulo', 'Ronda diária', 'HIGH'),
(7357, 'CAR008', '10020', '2026-05-01 09:00:00', NULL, 95000.0, 'Campinas', 'Inspeção veicular', 'SCHEDULED'),
(7358, 'CAR009', '10002', '2026-05-01 10:00:00', NULL, 5000.0, 'Santos', 'Suporte logístico', 'MEDIUM'),
(7359, 'CAR010', '10003', '2026-05-01 11:00:00', NULL, 4000.0, 'Sorocaba', 'Acompanhamento', 'LOW');

INSERT INTO revinfo (rev, revtstmp) VALUES 
(7, 1776662200000), (8, 1776748600000), (9, 1776856700000), (10, 1776961500000), (11, 1777082300000), 
(12, 1777185600000), (13, 1777262200000), (14, 1777348600000), (15, 1777456700000), (16, 1777561500000), 
(17, 1777682300000), (18, 1777785600000), (19, 1777862200000), (20, 1777948600000);

INSERT INTO attendance_aud (id, rev, revtype, car_prefix, user_registration, departure_time, completion_time, departure_km, destination_requester, description, priority, is_active) VALUES 
(7346, 7, 0, 'CAR011', '10007', '2026-04-21 08:00:00', '2026-04-21 17:00:00', 1000.0, 'São Paulo', 'Inspeção fiscal de rotina', 'MEDIUM', 1),
(7347, 8, 0, 'CAR012', '10009', '2026-04-22 09:00:00', '2026-04-22 16:00:00', 15000.0, 'Campinas', 'Verificação de equipamentos', 'HIGH', 1),
(7348, 9, 0, 'CAR013', '10010', '2026-04-23 07:30:00', NULL, 25000.0, 'Santos', 'Transporte de materiais', 'LOW', 1),
(7349, 10, 0, 'CAR014', '10011', '2026-04-24 08:00:00', '2026-04-24 12:00:00', 3500.0, 'Sorocaba', 'Reunião administrativa', 'MEDIUM', 1),
(7350, 11, 0, 'CAR015', '10013', '2026-04-25 10:00:00', '2026-04-25 18:00:00', 12000.0, 'Jundiaí', 'Aferição de balanças', 'HIGH', 1),
(7351, 12, 0, 'CAR016', '10014', '2026-04-26 08:00:00', '2026-04-26 14:00:00', 18000.0, 'São José dos Campos', 'Manutenção corretiva', 'SCHEDULED', 1),
(7352, 13, 0, 'CAR017', '10015', '2026-04-27 09:00:00', NULL, 40000.0, 'Taubaté', 'Entrega de notificações', 'MEDIUM', 1),
(7353, 14, 0, 'CAR018', '10016', '2026-04-28 08:30:00', '2026-04-28 17:00:00', 5000.0, 'Jacareí', 'Verificação de postos', 'HIGH', 1),
(7354, 15, 0, 'CAR019', '10017', '2026-04-29 07:00:00', '2026-04-29 15:00:00', 8000.0, 'Guarulhos', 'Visita técnica', 'LOW', 1),
(7355, 16, 0, 'CAR020', '10018', '2026-04-30 08:00:00', '2026-04-30 16:00:00', 11000.0, 'Osasco', 'Fiscalização de radar', 'MEDIUM', 1),
(7356, 17, 0, 'CAR007', '10019', '2026-05-01 08:00:00', NULL, 12000.0, 'São Paulo', 'Ronda diária', 'HIGH', 1),
(7357, 18, 0, 'CAR008', '10020', '2026-05-01 09:00:00', NULL, 95000.0, 'Campinas', 'Inspeção veicular', 'SCHEDULED', 1),
(7358, 19, 0, 'CAR009', '10002', '2026-05-01 10:00:00', NULL, 5000.0, 'Santos', 'Suporte logístico', 'MEDIUM', 1),
(7359, 20, 0, 'CAR010', '10003', '2026-05-01 11:00:00', NULL, 4000.0, 'Sorocaba', 'Acompanhamento', 'LOW', 1);

INSERT INTO records (id, service_id, record_type, record_date, record_km, note) VALUES 
(1, 7340, 'REFUELING', '2026-04-16 10:30:00', 30010.0, 'Posto BR'),
(2, 7342, 'INCIDENT', '2026-04-17 13:30:00', 5520.0, 'Pneu furado'),
(3, 7343, 'REFUELING', '2026-04-17 16:00:00', 8920.0, 'Posto Shell');

INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, fuel_type, gas_station_name, invoice) VALUES 
(1, 40.0, 5.80, 232.00, 'GASOLINE', 'Posto BR Central', 'NF2001'),
(3, 30.0, 5.75, 172.50, 'GASOLINE', 'Posto Shell Norte', 'NF2002');

INSERT INTO incidents (service_id, incident_type, severity, location, request_support, description, resolved, resolved_at) VALUES 
(7342, 'DEFECT', 'MEDIUM', 'Corredor Sul KM 10', TRUE, 'Pneu furado no acostamento, aguardando troca', TRUE, '2026-04-17 14:00:00');

INSERT INTO attendance (id, car_prefix, user_registration, departure_time, arrival_time, completion_time, expected_completion_time, departure_km, arrival_km, destination_requester, description, priority) VALUES 
(7301, '1234', '10001', '2026-01-10 08:00:00', '2026-01-10 16:30:00', '2026-01-10 16:30:00', '2026-01-10 17:00:00', 14000.0, 14080.0, 'Base Sul', 'Ronda inicial do ano e verificação de balanças.', 'MEDIUM'),
(7302, 'CAR011', '10005', '2026-01-25 09:15:00', '2026-01-25 14:00:00', '2026-01-25 14:00:00', '2026-01-25 15:00:00', 500.0, 580.0, 'Regional Leste', 'Acompanhamento de aferição.', 'LOW'),
(7311, '5678', '10002', '2026-02-05 07:30:00', '2026-02-05 18:10:00', '2026-02-05 18:10:00', '2026-02-05 18:00:00', 44000.0, 44200.0, 'Sede Central', 'Operação especial de carnaval.', 'HIGH'),
(7312, 'CAR013', '10007', '2026-02-20 10:00:00', '2026-02-20 15:45:00', '2026-02-20 15:45:00', '2026-02-20 16:00:00', 24000.0, 24150.0, 'Polo Norte', 'Transporte de documentação fiscal.', 'MEDIUM'),
(7321, '9012', '10003', '2026-03-12 08:00:00', '2026-03-12 17:30:00', '2026-03-12 17:30:00', '2026-03-12 18:00:00', 8500.0, 8750.0, 'Corredor Oeste', 'Verificação de taxímetros na capital.', 'HIGH'),
(7322, 'CAR017', '10015', '2026-03-28 06:00:00', '2026-03-28 14:20:00', '2026-03-28 14:20:00', '2026-03-28 14:30:00', 39000.0, 39300.0, 'Interior - Campinas', 'Notificação de postos de combustível.', 'SCHEDULED'),
(7331, '7890', '10019', '2026-04-02 08:00:00', '2026-04-02 12:00:00', '2026-04-02 12:00:00', '2026-04-02 13:00:00', 21500.0, 21600.0, 'São José dos Campos', 'Auditoria local de rotina.', 'MEDIUM'),
(7332, 'CAR020', '10008', '2026-04-08 09:00:00', '2026-04-08 16:00:00', '2026-04-08 16:00:00', '2026-04-08 17:00:00', 10500.0, 10800.0, 'Sede - Administrativo', 'Deslocamento da gestão para alinhamento.', 'MEDIUM');

INSERT INTO revinfo (rev, revtstmp) VALUES 
(50, 1768050000000), 
(51, 1769350000000), 
(52, 1770300000000), 
(53, 1771600000000),
(54, 1773300000000),
(55, 1774700000000), 
(56, 1775130000000), 
(57, 1775650000000); 

INSERT INTO attendance_aud (id, rev, revtype, car_prefix, user_registration, departure_time, completion_time, departure_km, destination_requester, description, priority, is_active) VALUES 
(7301, 50, 0, '1234', '10001', '2026-01-10 08:00:00', '2026-01-10 16:30:00', 14000.0, 'Base Sul', 'Ronda inicial do ano e verificação de balanças.', 'MEDIUM', 1),
(7302, 51, 0, 'CAR011', '10005', '2026-01-25 09:15:00', '2026-01-25 14:00:00', 500.0, 'Regional Leste', 'Acompanhamento de aferição.', 'LOW', 1),
(7311, 52, 0, '5678', '10002', '2026-02-05 07:30:00', '2026-02-05 18:10:00', 44000.0, 'Sede Central', 'Operação especial de carnaval.', 'HIGH', 1),
(7312, 53, 0, 'CAR013', '10007', '2026-02-20 10:00:00', '2026-02-20 15:45:00', 24000.0, 'Polo Norte', 'Transporte de documentação fiscal.', 'MEDIUM', 1),
(7321, 54, 0, '9012', '10003', '2026-03-12 08:00:00', '2026-03-12 17:30:00', 8500.0, 'Corredor Oeste', 'Verificação de taxímetros na capital.', 'HIGH', 1),
(7322, 55, 0, 'CAR017', '10015', '2026-03-28 06:00:00', '2026-03-28 14:20:00', 39000.0, 'Interior - Campinas', 'Notificação de postos de combustível.', 'SCHEDULED', 1),
(7331, 56, 0, '7890', '10019', '2026-04-02 08:00:00', '2026-04-02 12:00:00', 21500.0, 'São José dos Campos', 'Auditoria local de rotina.', 'MEDIUM', 1),
(7332, 57, 0, 'CAR020', '10008', '2026-04-08 09:00:00', '2026-04-08 16:00:00', 10500.0, 'Sede - Administrativo', 'Deslocamento da gestão para alinhamento.', 'MEDIUM', 1);

INSERT INTO records (id, service_id, record_type, record_date, record_km, note) VALUES 
(10, 7301, 'REFUELING', '2026-01-10 12:00:00', 14040.0, 'Abastecimento em viagem (Jan)'),
(11, 7311, 'REFUELING', '2026-02-05 14:30:00', 44100.0, 'Completou o tanque (Fev)'),
(12, 7312, 'INCIDENT',  '2026-02-20 11:15:00', 24050.0, 'Luz da injeção acendeu'),
(13, 7321, 'REFUELING', '2026-03-12 09:20:00', 8600.0, 'Abastecimento antes da serra (Mar)'),
(14, 7322, 'REFUELING', '2026-03-28 10:10:00', 39150.0, 'Diesel na rodovia (Mar)'),
(15, 7332, 'REFUELING', '2026-04-08 15:00:00', 10750.0, 'Abastecimento de retorno (Abr)');

INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, fuel_type, gas_station_name, invoice) VALUES 
(10, 45.0, 5.60, 252.00, 'GASOLINE', 'Posto Ipiranga Centro', 'NF-1001'),
(11, 50.0, 5.75, 287.50, 'GASOLINE', 'Auto Posto Bandeirantes', 'NF-1002'),
(13, 40.0, 5.80, 232.00, 'GASOLINE', 'Posto BR Rodovia', 'NF-1003'),
(14, 70.0, 6.10, 427.00, 'DIESEL',   'Posto Graal', 'NF-1004'),
(15, 35.0, 5.90, 206.50, 'GASOLINE', 'Posto Shell SJC', 'NF-1005');

INSERT INTO incidents (service_id, incident_type, severity, location, request_support, description, resolved, resolved_at) VALUES 
(7312, 'DEFECT', 'LOW', 'Rodovia Presidente Dutra, KM 145', FALSE, 'Luz amarela no painel, mas o veículo manteve o funcionamento normal.', TRUE, '2026-02-20 16:00:00');

-- =========================================================================
-- 4. TRIGGERS
-- =========================================================================

DELIMITER $$

DROP TRIGGER IF EXISTS trg_validate_car_availability$$
CREATE TRIGGER trg_validate_car_availability
BEFORE INSERT ON attendance
FOR EACH ROW
BEGIN
    DECLARE current_status VARCHAR(20);
    SELECT vehicle_status INTO current_status FROM cars WHERE prefix = NEW.car_prefix;
    
    IF current_status != 'AVAILABLE' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: This vehicle is not available for use at the moment.';
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_update_km_and_oil$$
CREATE TRIGGER trg_update_km_and_oil
AFTER INSERT ON records
FOR EACH ROW
BEGIN
    DECLARE v_oil_km FLOAT;
    DECLARE v_car_prefix VARCHAR(20);
    DECLARE v_current_obs TEXT;
    
    SELECT car_prefix INTO v_car_prefix FROM attendance WHERE id = NEW.service_id;
    
    SELECT next_oil_change_km, observations INTO v_oil_km, v_current_obs FROM cars WHERE prefix = v_car_prefix;
    
    UPDATE cars SET current_km = NEW.record_km WHERE prefix = v_car_prefix;
    
    IF NEW.record_km >= v_oil_km THEN
        IF v_current_obs IS NULL OR v_current_obs NOT LIKE '%ALERT: Oil change required.%' THEN
            UPDATE cars 
            SET vehicle_status = 'MAINTENANCE',
                observations = CONCAT(IFNULL(v_current_obs, ''), ' - ALERT: Oil change required.')
            WHERE prefix = v_car_prefix;
        ELSE 
            UPDATE cars SET vehicle_status = 'MAINTENANCE' WHERE prefix = v_car_prefix;
        END IF;
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_start_service_status$$
CREATE TRIGGER trg_start_service_status
AFTER INSERT ON attendance
FOR EACH ROW
BEGIN
    UPDATE cars SET vehicle_status = 'IN_USE' WHERE prefix = NEW.car_prefix;
END$$

DROP TRIGGER IF EXISTS trg_clear_use_after_cancellation$$
CREATE TRIGGER trg_clear_use_after_cancellation
AFTER INSERT ON incidents
FOR EACH ROW
BEGIN
    DECLARE v_car_prefix VARCHAR(20);

    IF NEW.incident_type = 'CANCELLATION' THEN
        SELECT car_prefix INTO v_car_prefix FROM attendance WHERE id = NEW.service_id;
        
        UPDATE cars SET vehicle_status = 'AVAILABLE' WHERE prefix = v_car_prefix;
        
        UPDATE attendance SET completion_time = CURRENT_TIMESTAMP WHERE id = NEW.service_id AND completion_time IS NULL;
    END IF;
END$$

DELIMITER ;



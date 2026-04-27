SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE refuelings;
TRUNCATE TABLE incidents;
TRUNCATE TABLE records;
TRUNCATE TABLE services;
TRUNCATE TABLE cars;
TRUNCATE TABLE users;
TRUNCATE TABLE car_type;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO car_type (brand, model, year, category) VALUES
('Toyota', 'Corolla', 2024, 'passenger'),
('Chevrolet', 'S10', 2023, 'utility'),
('Ford', 'Ranger', 2024, 'utility'),
('Volkswagen', 'Virtus', 2023, 'passenger'),
('Fiat', 'Cronos', 2022, 'passenger'),
('Renault', 'Oroch', 2023, 'utility'),
('Nissan', 'Frontier', 2024, 'utility'),
('Honda', 'HR-V', 2024, 'passenger'),
('Jeep', 'Renegade', 2023, 'passenger'),
('Ford', 'Transit', 2022, 'utility');

INSERT INTO users (registration, name, email, password, permission, phone, gender, birth_date, driver_license, employee_status) VALUES
('10001', 'Ana Silva', 'ana.silva@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990001', 'F', '1990-05-15', '12345678901', 'available'),
('10002', 'Bruno Costa', 'bruno.costa@ipem.sp.gov.br', 'senha123', 'ADMINISTRATOR', '11999990002', 'M', '1985-08-20', '12345678902', 'available'),
('10003', 'Carlos Souza', 'carlos.souza@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990003', 'M', '1992-03-10', '12345678903', 'on_duty'),
('10004', 'Daniela Lima', 'daniela.lima@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990004', 'F', '1995-11-22', '12345678904', 'available'),
('10005', 'Eduardo Alves', 'eduardo.alves@ipem.sp.gov.br', 'senha123', 'ADMINISTRATOR', '11999990005', 'M', '1980-01-30', '12345678905', 'available'),
('10006', 'Fernanda Rocha', 'fernanda.rocha@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990006', 'F', '1993-07-04', '12345678906', 'on_duty'),
('10007', 'Gabriel Martins', 'gabriel.martins@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990007', 'M', '1998-12-12', '12345678907', 'available'),
('10008', 'Helena Duarte', 'helena.duarte@ipem.sp.gov.br', 'senha123', 'ADMINISTRATOR', '11999990008', 'F', '1975-06-18', '12345678908', 'available'),
('10009', 'Igor Mendes', 'igor.mendes@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990009', 'M', '1991-09-09', '12345678909', 'on_duty'),
('10010', 'Juliana Ferreira', 'juliana.ferreira@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990010', 'F', '1994-02-28', '12345678910', 'available'),
('10011', 'Kevin Santos', 'kevin.santos@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990011', 'M', '1996-04-14', '12345678911', 'available'),
('10012', 'Larissa Gomes', 'larissa.gomes@ipem.sp.gov.br', 'senha123', 'TECHNICIAN', '11999990012', 'F', '1997-10-30', '12345678912', 'available');

INSERT INTO cars (prefix, license_plate, type_id, fuel, current_km, next_oil_change_km, vehicle_status, color) VALUES
('CAR001', 'ABC1001', 1, 'Gasoline', 15000.0, 20000.0, 'available', 'Silver'),
('CAR002', 'DEF1002', 2, 'Diesel', 45000.0, 45050.0, 'maintenance', 'White'),
('CAR003', 'GHI1003', 3, 'Diesel', 8900.0, 15000.0, 'in_use', 'Black'),
('CAR004', 'JKL1004', 1, 'Gasoline', 5500.0, 10000.0, 'available', 'Red'),
('CAR005', 'MNO1005', 4, 'Gasoline', 22000.0, 25000.0, 'available', 'Blue'),
('CAR006', 'PQR1006', 5, 'Gasoline', 30000.0, 35000.0, 'available', 'Gray'),
('CAR007', 'STU1007', 6, 'Diesel', 12000.0, 20000.0, 'unavailable', 'White'),
('CAR008', 'VWX1008', 7, 'Diesel', 95000.0, 100000.0, 'available', 'Black'),
('CAR009', 'YZA1009', 8, 'Gasoline', 5000.0, 10000.0, 'available', 'White'),
('CAR010', 'BCD1010', 9, 'Gasoline', 4000.0, 10000.0, 'available', 'Silver');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES
('CAR001', '10001', '2026-04-01 08:00:00', 15000.0, 'São Paulo', 'Fiscalização'),
('CAR003', '10003', '2026-04-02 09:00:00', 8900.0, 'Campinas', 'Visita Técnica'),
('CAR004', '10004', '2026-04-03 07:30:00', 5500.0, 'Santos', 'Transporte de materiais'),
('CAR005', '10006', '2026-04-04 08:00:00', 22000.0, 'Sorocaba', 'Reunião'),
('CAR006', '10007', '2026-04-05 10:00:00', 30000.0, 'Jundiaí', 'Fiscalização'),
('CAR008', '10009', '2026-04-06 08:00:00', 95000.0, 'São José dos Campos', 'Manutenção'),
('CAR009', '10010', '2026-04-07 09:00:00', 5000.0, 'Taubaté', 'Entrega'),
('CAR010', '10011', '2026-04-08 08:30:00', 4000.0, 'Jacareí', 'Verificação'),
('CAR001', '10012', '2026-04-09 07:00:00', 15200.0, 'Guarulhos', 'Visita'),
('CAR003', '10001', '2026-04-10 08:00:00', 9200.0, 'Osasco', 'Fiscalização');


INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR001', '10001', '2026-04-01 08:00:00', 15000.0, 'São Paulo', 'Fiscalização');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-01 08:00:00', 15000.0, 'Saída SP');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-01 10:00:00', 15100.0, 'Posto BR');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 50.0, 5.80, 290.00, 'NF1001');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR003', '10003', '2026-04-02 09:00:00', 8900.0, 'Campinas', 'Visita Técnica');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-02 09:00:00', 8900.0, 'Saída Campinas');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'INCIDENT', '2026-04-02 11:00:00', 9000.0, 'Pneu furado');
INSERT INTO incidents (service_id, incident_type, location, request_support, description) VALUES (2, 'DEFECT', 'Rodovia Bandeirantes KM 50', TRUE, 'Pneu furado, aguardando socorro');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR004', '10004', '2026-04-03 07:30:00', 5500.0, 'Santos', 'Transporte');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-03 07:30:00', 5500.0, 'Saída Santos');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-03 10:00:00', 5700.0, 'Posto Shell');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 40.0, 5.75, 230.00, 'NF1002');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR005', '10006', '2026-04-04 08:00:00', 22000.0, 'Sorocaba', 'Reunião');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-04 08:00:00', 22000.0, 'Saída Sorocaba');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-04 12:00:00', 22200.0, 'Posto Ale');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 30.0, 5.90, 177.00, 'NF1003');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR006', '10007', '2026-04-05 10:00:00', 30000.0, 'Jundiaí', 'Fiscalização');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-05 10:00:00', 30000.0, 'Saída Jundiaí');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-05 15:00:00', 30200.0, 'Posto Ipiranga');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 60.0, 5.60, 336.00, 'NF1004');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR008', '10009', '2026-04-06 08:00:00', 95000.0, 'SJC', 'Manutenção');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-06 08:00:00', 95000.0, 'Saída SJC');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-06 14:00:00', 95150.0, 'Posto Rede');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 45.0, 5.85, 263.25, 'NF1005');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR009', '10010', '2026-04-07 09:00:00', 5000.0, 'Taubaté', 'Entrega');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-07 09:00:00', 5000.0, 'Saída Taubaté');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-07 13:00:00', 5200.0, 'Posto BR');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 55.0, 5.70, 313.50, 'NF1006');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR010', '10011', '2026-04-08 08:30:00', 4000.0, 'Jacareí', 'Verificação');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-08 08:30:00', 4000.0, 'Saída Jacareí');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-08 12:00:00', 4200.0, 'Posto Shell');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 35.0, 5.95, 208.25, 'NF1007');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR001', '10012', '2026-04-09 07:00:00', 15200.0, 'Guarulhos', 'Visita');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-09 07:00:00', 15200.0, 'Saída Guarulhos');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-09 11:00:00', 15400.0, 'Posto Ipiranga');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 40.0, 5.80, 232.00, 'NF1008');

INSERT INTO services (car_prefix, user_registration, departure_time, departure_km, destination_requester, description) VALUES ('CAR003', '10001', '2026-04-10 08:00:00', 9200.0, 'Osasco', 'Fiscalização');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'CHECK_OUT', '2026-04-10 08:00:00', 9200.0, 'Saída Osasco');
INSERT INTO records (service_id, record_type, record_date, record_km, note) VALUES (LAST_INSERT_ID(), 'REFUELING', '2026-04-10 16:00:00', 9400.0, 'Posto Ale');
INSERT INTO refuelings (record_id, liters, price_per_liter, total_amount, invoice) VALUES (LAST_INSERT_ID(), 50.0, 5.75, 287.50, 'NF1009');

CREATE TABLE car_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100),
    model VARCHAR(100),
    year INT,
    category ENUM('PASSENGER', 'UTILITY'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
    employee_status ENUM('AVAILABLE', 'ON_DUTY', 'DISMISSED') DEFAULT 'AVAILABLE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE cars (
    prefix VARCHAR(20) PRIMARY KEY,
    license_plate VARCHAR(10),
    type_id INT,
    fuel VARCHAR(20),
    current_km FLOAT,
    next_oil_change_km FLOAT,
    available BOOLEAN,
    color VARCHAR(30),
    required_license VARCHAR(20),
    vehicle_status ENUM('AVAILABLE', 'IN_USE', 'MAINTENANCE', 'UNAVAILABLE') DEFAULT 'AVAILABLE',
    observations TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_car_type FOREIGN KEY (type_id) REFERENCES car_type(id)
);

CREATE TABLE services (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    car_prefix VARCHAR(20),
    user_registration VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    completion_time DATETIME,
    departure_km FLOAT,
    arrival_km FLOAT,
    destination_requester VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_record_service FOREIGN KEY (service_id) REFERENCES services(id)
);

CREATE TABLE refuelings (
    record_id BIGINT PRIMARY KEY,
    liters FLOAT,
    price_per_liter DOUBLE,
    total_amount DOUBLE,
    invoice VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_refueling_record FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE
);

CREATE TABLE incidents (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    service_id BIGINT,
    incident_type ENUM('CANCELLATION', 'DEFECT') NOT NULL,
    location VARCHAR(255),
    request_support BOOLEAN DEFAULT FALSE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_incident_service FOREIGN KEY (service_id) REFERENCES services(id)
);

DELIMITER $$

DROP TRIGGER IF EXISTS trg_validate_car_availability$$
CREATE TRIGGER trg_validate_car_availability
BEFORE INSERT ON services
FOR EACH ROW
BEGIN
    DECLARE current_status VARCHAR(20);
    SELECT vehicle_status INTO current_status FROM cars WHERE prefix = NEW.car_prefix;
    
    IF current_status != 'available' THEN
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
    
    -- Atualiza KM atual do carro
    UPDATE cars 
    SET current_km = NEW.record_km
    WHERE prefix = (SELECT car_prefix FROM services WHERE id = NEW.service_id);

    -- Verifica necessidade de manutenção
    SELECT next_oil_change_km INTO v_oil_km 
    FROM cars WHERE prefix = (SELECT car_prefix FROM services WHERE id = NEW.service_id);
    
    IF NEW.record_km >= v_oil_km THEN
        UPDATE cars 
        SET vehicle_status = 'maintenance',
            observations = CONCAT(IFNULL(observations, ''), ' - ALERT: Oil change required.')
        WHERE prefix = (SELECT car_prefix FROM services WHERE id = NEW.service_id);
    END IF;
END$$

DROP TRIGGER IF EXISTS trg_start_service_status$$
CREATE TRIGGER trg_start_service_status
AFTER INSERT ON services
FOR EACH ROW
BEGIN
    UPDATE cars SET vehicle_status = 'in_use' WHERE prefix = NEW.car_prefix;
END$$

DROP TRIGGER IF EXISTS trg_clear_use_after_cancellation$$
CREATE TRIGGER trg_clear_use_after_cancellation
AFTER INSERT ON incidents
FOR EACH ROW
BEGIN
    IF NEW.incident_type = 'CANCELLATION' THEN
        UPDATE cars SET vehicle_status = 'available' 
        WHERE prefix = (SELECT car_prefix FROM services WHERE id = NEW.service_id);
    END IF;
END$$

DELIMITER ;

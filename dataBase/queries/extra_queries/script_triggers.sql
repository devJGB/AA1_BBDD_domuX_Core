-- Crear dos Triggers

-- Nos conectamos 
USE domuxdb; 

-- Para este ejercicio voy actualizar primero la bbdd añadiendo dos campos nuevos.
-- Añado a dwelling (viviendas) un nuevo campo que será calculado, el nº de dispositivos que contiene la casa
ALTER TABLE dwelling 
ADD total_devices INT DEFAULT 0;

-- Añado a routines un nuevo campo que será calculado, el total en minutos que dura la rutina. 
ALTER TABLE routines 
ADD duration_minutes INT;

-- 1) Trigger que calcula y actualiza actomaticamente los dispositivos que hay en una vivienda 
-- cuando se inserta uno nuevo

DELIMITER //

CREATE TRIGGER tgr_update_total_devices 
AFTER INSERT ON devices
FOR EACH ROW 
BEGIN 
    -- Comprobamos si el nuevo dispositivo tiene asignada una habitación
    IF NEW.id_room IS NOT NULL THEN
        UPDATE dwelling 
        SET total_devices = total_devices + 1
        WHERE id = (SELECT id_dwelling FROM rooms WHERE id = NEW.id_room);
    END IF;
END;
DELIMITER ;

DELIMITER //
-- hacemos lo mismo si eliminamos un desposito
CREATE TRIGGER after_device_delete
AFTER DELETE ON devices
FOR EACH ROW
BEGIN
    IF OLD.id_room IS NOT NULL THEN
        UPDATE dwelling 
        SET total_devices = total_devices - 1
        WHERE id = (SELECT id_dwelling FROM rooms WHERE id = OLD.id_room);
    END IF;
END; 

DELIMITER ;

-- 2) Trigger que calcula con la fucnion TIMESTAMPDIFF la diferencia de tiempo y calcula  duration_minutes (tiempo que dura la rutina)

DELIMITER //
CREATE TRIGGER trg_calculate_routine_duration
BEFORE INSERT ON routines
FOR EACH ROW
BEGIN
    SET NEW.duration_minutes = 
        TIMESTAMPDIFF(MINUTE, NEW.start_time, NEW.end_time);
END;

DELIMITER ;




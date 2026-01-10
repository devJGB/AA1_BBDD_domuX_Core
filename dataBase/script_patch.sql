-- PARCHE ACTUALIZACIÓN DE LA BASE DA DATOS 

-- Nos conectamos a la bbdd
USE domuxdb;

-- 1) Añadir dos nuevs campos obligatorios a una tabla (users)
ALTER TABLE users 
ADD DNI VARCHAR(30);

ALTER TABLE users 
ADD birth_date DATE;

-- 2) Eliminar un campo (windows-tabla rooms)
ALTER TABLE rooms 
DROP COLUMN number_windows;

-- 3) Cambiar un campo de texto a número (postal-code de users)
ALTER TABLE users 
MODIFY postal_code INT; 

-- 4) Hacer obligatorio un campo que no lo era (model en devices)
ALTER TABLE devices 
MODIFY model VARCHAR(50) NOT NULL DEFAULT 'DESCONOCIDO';

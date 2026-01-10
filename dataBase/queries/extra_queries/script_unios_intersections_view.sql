-- 5 Consultas con Uniones o Intersecciones y Vistas

-- Nos conectamos
USE domuxdb;

-- 1) Vista que almacena la consulta que mostraría que usuario tiene mas dispositivos contratados activos/inactivos
CREATE VIEW devices_per_users AS
SELECT 
	u.id AS id_usuario,
	concat(u.name, " ", u.last_name) AS usuario,
	dv.id AS id_dispositivo,
	dv.is_active AS esta_activo
FROM users u
LEFT JOIN dwelling dw ON u.id = dw.id_user
LEFT JOIN rooms r ON dw.id = r.id_dwelling
LEFT JOIN devices  dv ON r.id = dv.id_room

-- 2) Consulta con union, vemos los usaurios y sus dispositvos activos/inactivos
SELECT
    usuario,
    COUNT(id_dispositivo) AS total,
    'ACTIVOS' AS tipo
FROM devices_per_users dpu 
WHERE esta_activo = TRUE
GROUP BY id_usuario, usuario

UNION

SELECT
    usuario,
    COUNT(id_dispositivo) AS total,
    'INACTIVOS' AS tipo
FROM devices_per_users dpu 
WHERE esta_activo = FALSE
GROUP BY id_usuario, usuario
ORDER BY total DESC

-- 3) Dispositivos actuadores/sensores
SELECT
	d.name AS dispositivo, 
	'Sensor' AS tipo
FROM devices d, device_sensors ds
WHERE d.id = ds.id_device

UNION

SELECT 
	d.name AS dispositivo,
	'Actuador' AS tipo
FROM devices d, device_actuators da
WHERE d.id = da.id_device

-- 4) Rutinas activas/inactivas
SELECT 
	r.name AS nombre,
	r.is_active AS esta_activa
FROM routines r 
WHERE is_active = TRUE

UNION

SELECT 
	r.name AS nombre,
	r.is_active AS esta_activa
FROM routines R
WHERE is_active = FALSE


-- 5) cidades que coinciden entre usuarios y viviendas.
SELECT 
	u.city AS ciudad
FROM users u 

INTERSECT 

SELECT
dw.city AS ciudad
FROM dwelling dw

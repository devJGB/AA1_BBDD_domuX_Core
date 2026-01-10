-- 5 consultas donde hagas uso de OUTER JOIN (LEFT o RIGHT)

-- Nos conectamos 
USE domuxdb;

-- 1) Usuarios y tipo de vivienda
SELECT 
	CONCAT(u.name," ",u.last_name),
	dw.name AS vivienda,
	dw.house_type,
	dw.city AS ciudad
FROM users u 
LEFT OUTER JOIN dwelling dw ON u.id = dw.id_user


--  2) dispositivos y habitaciones 
-- todos las habitaciones tengan o no dispositivos
SELECT 
	r.name AS habitación,
	dv.name AS dispositivo
FROM rooms r 
LEFT JOIN devices dv ON r.id = dv.id_room  
-- todas los dipositivos (no puede suceder que no tengan habtación)
SELECT 
	r.name AS habitación,
	dv.name AS dispositivo
FROM rooms r 
RIGHT JOIN devices dv ON r.id = dv.id_room  
-- solo los que tienen pareja
SELECT 
	r.name AS habitación,
	dv.name AS dispositivo
FROM rooms r
INNER JOIN devices dv ON r.id = dv.id_room 

-- 3) Dispositivos enlazados todos y solo los que tienen enlace
-- todos estén enlazados o no
SELECT 
    dv.name AS dispositivo,
    dv_linked.name AS dispositivo_enlazado
FROM devices dv
LEFT JOIN device_device dd ON dv.id = dd.id_device
LEFT JOIN devices dv_linked ON dd.id_linked = dv_linked.id
ORDER BY dv.name
-- solo los enlazados
SELECT 
    dv.name AS dispositivo,
    dv_linked.name AS dispositivo_enlazado
FROM devices dv
INNER JOIN device_device dd ON dv.id = dd.id_device
INNER JOIN devices dv_linked ON dd.id_linked = dv_linked.id
ORDER BY dv.name


-- 4) Dispositivos con código/sin código
-- todos los dispositivos
SELECT 
	dv.name AS dispositivo,
	dv.model AS modelo
FROM devices dv 
LEFT JOIN device_actuators da ON dv.id = da.id_device 
LEFT JOIN device_sensors ds ON dv.id = ds.id_device 

SELECT 
	r.name AS habitación,
	dv.name AS dispositivo,
	dv.code AS codigo
FROM rooms r 
RIGHT JOIN devices dv ON r.id = dv.id_room  

-- 5) Rutinas con acciones 
-- todas las acciones tenga o no rutina asignada
SELECT 
 ac.task AS accion,
 rt.name AS rutina
FROM actions ac
LEFT JOIN routines rt ON ac.id = id_routine 
-- todas las rutinas aunque no tengan acción (esto no puede pasar)
SELECT 
 rt.name AS rutina,
 ac.task AS accion
FROM actions ac
RIGHT JOIN routines rt ON ac.id = id_routine 
-- Solo las acciones con rutinas asignadas
SELECT 
 rt.name AS rutina,
 ac.task AS accion
FROM actions ac
INNER JOIN routines rt ON ac.id = id_routine 

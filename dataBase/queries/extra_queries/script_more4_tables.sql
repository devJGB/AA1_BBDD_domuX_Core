-- 5 Consultas donde se utilicen más de 4 tablas

-- 1) Qué usuarios tienen rutinas en  habitaciones llamadas "Comedor"
SELECT
	CONCAT(u.name, "-", u.last_name) AS usuario,
	r.name AS habitacion,
	rt.name AS rutina
FROM users u 
INNER JOIN dwelling dw ON u.id = dw.id_user 
INNER JOIN rooms r ON dw.id = r.id_dwelling 
INNER JOIN devices dv ON r.id = dv.id_room 
INNER JOIN device_routine dr ON dv.id = dr.id_device 
INNER JOIN routines rt ON rt.id = dr.id_routine 
WHERE r.name LIKE 'Comedor' 
ORDER BY usuario ASC

-- 2) Viviendas que tienen rutinas que terminan antes de las 12:00
SELECT 
	dw.name AS nombre,
	rt.name AS rutina,
	rt.end_time AS off_rutina
FROM dwelling dw
INNER JOIN rooms r ON dw.id = r.id_dwelling 
INNER JOIN devices dv ON r.id = dv.id_room 
INNER JOIN device_routine dr ON dv.id = dr.id_device 
INNER JOIN routines rt ON rt.id = dr.id_routine 
WHERE HOUR(rt.end_time) <= 12
ORDER BY  off_rutina ASC

-- 3) Usuarios que tienen dispositicos de la marca Xiaomi y son actuadores
SELECT 
	CONCAT(u.name, " ",u.last_name) AS usuario,
	dw.city AS ciudad_vivienda
FROM users u 
INNER JOIN dwelling dw ON u.id = dw.id_user 
INNER JOIN rooms r ON dw.id = r.id_dwelling 
INNER JOIN devices dv ON r.id = dv.id_room 
INNER JOIN device_actuators dva ON dv.id = dva.id_device 
WHERE dv.brand = 'Xiaomi'

-- 4) Usuarios con casa en Valencia con rutinas las Miercoles Inactivas
SELECT 
	UPPER(u.name) AS nombre,
	dv.name AS dispositivo,
	rt.name AS rutina,
	r.name AS habitacion
FROM users u 
INNER JOIN dwelling dw ON u.id = dw.id_user 
INNER JOIN rooms r ON dw.id = r.id_dwelling 
INNER JOIN devices dv ON r.id = dv.id_room 
INNER JOIN device_routine dr ON dv.id = dr.id_device 
INNER JOIN routines rt ON rt.id = dr.id_routine 
WHERE dv.is_active = FALSE AND 
	dw.city = 'Zaragoza' AND 
	dr.wednesday = TRUE

-- 5) Usuarios con sensores inactivos
SELECT
 CONCAT(u.name," ",u.last_name) AS usuario,
 dv.name AS dispositivo,
 SUBSTR(dv.code, 1,3) AS tipo
FROM users u 
INNER JOIN dwelling dw ON u.id = dw.id_user 
INNER JOIN rooms r ON dw.id = r.id_dwelling 
INNER JOIN devices dv ON r.id = dv.id_room 
INNER JOIN device_sensors ds ON dv.id = ds.id_device 
WHERE dv.is_active = FALSE 
GROUP BY u.id, u.name , u.last_name 
ORDER BY dispositivo DESC
	
	

	
	
	
	
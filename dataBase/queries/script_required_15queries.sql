-- 15 Consultas requeridas

-- Nos conectamos
USE domuxdb;

-- 1) Usuarios registrados en el año 2025 y el mes de registro (1 tabla + función fecha + ORDER BY)
SELECT 
	u.name AS nombre,
	u.last_name AS apellidos,
	MONTHNAME(u.registration_date) mes,
	YEAR(u.registration_date) año
FROM users u 
WHERE u.registration_date BETWEEN '2025-01-01' AND  '2025-12-31'
ORDER BY u.registration_date ASC 
	
-- 2) Usuarios y qué viviendas son mas grandes que la media y están activas (2 tablas + subconsulata + func. agregada + ORDER BY)
SELECT
	CONCAT(u.name, " - ", u.last_name) AS nombre_completo,
	d.name AS vivienda,
	d.square_meters,
	d.city AS ciudad_vivienda
FROM users u, dwelling d 
WHERE u.id = d.id_user AND
	d.is_active = TRUE AND
	d.square_meters > (SELECT AVG(d.square_meters) FROM dwelling d)
ORDER BY d.square_meters DESC

-- 3) Usuarios y Viviendas registradas, ciudad donde se encuntra y ordenado por nombre de usuario (2 tablas + ORDER BY)
SELECT 
	u.name AS nombre,
	u.last_name AS apellido,
	d.name AS nombre_vivienda,
	d.city AS ciudad_vivienda,
	d.house_type AS estilo_vivienda
FROM users u , dwelling d 
WHERE u.id = d.id_user 
ORDER BY u.name

-- 4) Cuantas viviendas tiene cada usuario (2 tablas + función agregada)
SELECT
	u.name AS nombre,
	u.last_name AS apellidos,
COUNT(d.id) AS total_viviendas_registradas
FROM users u , dwelling d 
WHERE  u.id = d.id_user 
GROUP BY u.id ,u.name, u.last_name

-- 5) Rutinas activas con sus acciones (2 tablas)
	SELECT
		r.name AS nombre,
		r.description AS description,
		a.task AS accion
	FROM routines r, actions a 
	WHERE 
		r.id = a.id_routine AND
		r.is_active = TRUE 
		
-- 6) Vivienda con Habitaciones con luz natural alta (2 tablas + función UPPER)
SELECT 
	d.name AS nombre,
	UPPER(d.city) AS ciudad,
	r.name AS habitacion
FROM dwelling d, rooms r 
WHERE d.id = r.id_dwelling AND
	  r.natural_light_type = 'high' 
ORDER BY ciudad

-- 7) Dispositivos inalámbricos con código abreviado (2 tablas + función SUBSTR)
SELECT 
    d.name AS dispositivo,
    d.code AS codigo_completo,
    SUBSTR(d.code, 1, 3) AS tipo,
    SUBSTR(d.code, 4) AS numero,
    r.name AS habitacion
FROM devices d, rooms r
WHERE d.id_room = r.id AND
    d.wireless = TRUE
    
 -- 8) Superficie media de habitaciones por vivienda (2 tablas + función ROUND + función agregada)
SELECT
    d.name AS vivienda,
    ROUND(AVG(r.square_meters), 1) AS media_m2
FROM dwelling d, rooms r
WHERE d.id = r.id_dwelling
GROUP BY d.id, d.name
    
-- 9) Dispositivos con mayor consumo por vivienda y habitación  donde se encunetra (3 tablas + fucnión agregada + subconsulta + ORDER BY)
SELECT 
	d.name AS nombre_vivienda,
	r.name AS nombre_habitacion,
	dv.name AS nombre_dispositivo,
	dv.brand AS marca,
	dv.power_w AS consumo
FROM dwelling d, rooms r, devices dv
WHERE 
	d.id = r.id_dwelling AND 
	r.id = dv.id_room AND 
	dv.power_w = ( 
		SELECT MAX(dv2.power_w) 
		FROM rooms r2, devices dv2
		WHERE r2.id_dwelling = d.id AND
			r2.id = dv2.id_room )
ORDER BY consumo DESC 

-- 10)  Consumo total por vivienda (3 tablas + función agregada + ORDER BY)
SELECT
	d.name AS nombre_vivienda,
	d.city AS ciudad,
	SUM(dv.power_w) AS consumo_total
FROM dwelling d, rooms r, devices dv
WHERE d.id = r.id_dwelling AND
	r.id = dv.id_room 
GROUP BY d.id , d.name, d.city 
ORDER BY consumo_total ASC 

-- 11) Sensores en viviendas con mascotas (3 tablas + subconsulta)
SELECT 
    dw.name AS vivienda,
    dw.city AS ciudad,
    r.name AS habitacion,
    d.name AS sensor
FROM dwelling dw, rooms r, devices d
WHERE dw.id = r.id_dwelling AND
    r.id = d.id_room AND
    dw.pets = TRUE AND
    d.id IN (SELECT id_device FROM device_sensors)
    
-- 12) Actuadores en rutinas activas (4 tablas + función agregada)
SELECT 
    dv.name AS actuador,
    da.action_type AS tipo_accion,
    COUNT(dr.id_routine) AS total_rutinas_activas
FROM devices dv, device_actuators da, device_routine dr, routines r
WHERE 
    dv.id = da.id_device AND
     dv.id = dr.id_device AND
     r.id = dr.id_routine AND
     r.is_active = TRUE
GROUP BY dv.id, dv.name, da.action_type

-- 13) Cuál es la primera rutina activa de cada dispositivo tipo sensor (4 tablas + función agregada +  subconsulta + ORDER BY)
SELECT 
    dv.name AS dispositivo,
    ds.sensor_type AS tipo_sensor,
    r.name AS rutina,
    r.start_time AS hora_inicio
FROM devices dv, device_sensors ds, device_routine dr, routines r
WHERE 
    dv.id = ds.id_device AND
    dv.id = dr.id_device AND
    r.id = dr.id_routine AND
    r.is_active = TRUE AND
    r.start_time = (
        SELECT MIN(r2.start_time)
        FROM device_routine dr2, routines r2
        WHERE dr2.id_device = dv.id AND
          r2.id = dr2.id_routine AND
          r2.is_active = TRUE )
ORDER BY hora_inicio

-- 14) Dispositivos enlazados entre sí (2 tablas + relación reflexiva)
SELECT
	d1.name AS dispositivo,
	d1.code AS codigo,
	d2.name AS enlazado_con,
	d2.code AS codigo_enlazado
FROM device_device dd, devices d1, devices d2
WHERE  d1.id = dd.id_device AND 
	  d2.id = dd.id_linked AND 
	  dd.id_device != dd.id_linked
	  
		 
-- 15) Usuarios con rutinas los fines de semana (con subconsulta)
SELECT
    CONCAT(u.name, ' ', u.last_name) AS nombre_completo,
    d.name AS vivienda,
    r.name AS habitacion,
    rt.name AS rutina
FROM users u, dwelling d, rooms r, devices dv, routines rt, device_routine dr 
WHERE 
    u.id = d.id_user AND 
    d.id = r.id_dwelling AND
    r.id = dv.id_room AND 
    dv.id = dr.id_device AND
    dr.id_routine = rt.id AND 
    dv.id IN (
        SELECT dr.id_device FROM device_routine dr
        WHERE dr.saturday = TRUE
           OR dr.sunday = TRUE )
ORDER BY u.last_name ASC 

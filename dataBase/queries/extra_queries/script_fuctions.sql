-- Crea 2 funciones almacenadas que devuelvan el resultado de alguna consulta donde estén involucradas más de 2 tablas y 
-- donde se realice alguna comprobación previa 

-- Nos conectamos
USE domuxdb;

-- 1) Función que devuelve la potencia de consumo total de la vivienda, por habitción si tiene dispositivos y que este activos

DELIMITER //
-- pasamos el id de la dwelling 
CREATE FUNCTION get_powerW_dwewelling(p_id_dwelling INT)
RETURNS FLOAT 
BEGIN
	DECLARE exist_dw INT;
	DECLARE exist_dv INT;
	DECLARE total_power FLOAT;
	-- Comprobamos si la vivienda existe
	SET exist_dw = (SELECT COUNT(*) 
		FROM  dwelling dw 
		WHERE dw.id = p_id_dwelling );
		
		IF exist_dw = 0 THEN
			-- si la vivienda no existe se devuelve el valor de error
			RETURN -1.0;
		END IF;
	
	-- Como sabemos que habitaciones tiene mínimo una, comprobamos que tenga dispositivos
	SET exist_dv = (SELECT COUNT(*)
		FROM dwelling dw
		INNER JOIN rooms r ON dw.id = r.id_dwelling
		INNER JOIN devices dv ON r.id = dv.id_room 
		WHERE dw.id = p_id_dwelling );
		
		IF exist_dv = 0 THEN
			-- si no hay dispositivos se devulve el valor de error y sabemos que no hay dispositivos en la vivienda
			RETURN -1.0;
		END IF;
	
	-- Si todo va bien, se calcula la potencia y se devuelve 
	SET total_power = (SELECT 
			 SUM(dv.power_w)
		FROM dwelling dw
		INNER JOIN rooms r ON dw.id = r.id_dwelling
		INNER JOIN devices dv ON r.id = dv.id_room 
		WHERE dw.id = p_id_dwelling AND
			dv.is_active = TRUE);
	
	RETURN total_power;
		
END;

DELIMITER ;

SELECT get_powerW_dwewelling(15);


-- 2) Qué marcas de dispositivos compran mas los usuarios de una determinada ciudad.

DELIMITER // 
-- Pasamos una ciudad por parametro 
CREATE FUNCTION get_favourite_brand(p_city VARCHAR(50))
RETURNS VARCHAR(50)
BEGIN
	DECLARE exist_city INT;
	DECLARE favourite_brand VARCHAR(50);
	-- Comprobamos que la ciudad existe en nuestra bbdd de usuario 
	SET exist_city = (SELECT COUNT(*) 
		FROM users u
		WHERE u.city = p_city);
	
	-- Si la ciudad no se encuentra, retornamos una "Ciudad no registrada"
	IF exist_city = 0 THEN 
		RETURN 'Ciudad no registrada';
	END IF;
	
	-- Si todo va bien buscamos la marca preferida 
	-- Busco la marcas iguales, las agrupo por nombre, las ordeno desc y devuelvo una, esa es la que mas coincidencia tiene
	SET favourite_brand = (
	SELECT dv.brand
	FROM users u
	LEFT JOIN dwelling dw ON u.id = dw.id_user
	LEFT JOIN rooms r ON dw.id = r.id_dwelling
	LEFT JOIN devices dv ON r.id = dv.id_room
	WHERE u.city = p_city 
	GROUP BY dv.brand
	ORDER BY COUNT(*) DESC 
	LIMIT 1 );
	
	IF favourite_brand IS NULL THEN
		RETURN "Sin dispositivos conectados";
	END IF;
	
	RETURN favourite_brand;
	
END;

DELIMITER ;

SELECT get_favourite_brand('Valencia')
SELECT get_favourite_brand('Zaragoza')
SELECT get_favourite_brand('Bilbao')
SELECT get_favourite_brand('Alicante')
SELECT get_favourite_brand('Palma')


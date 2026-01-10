-- Creamos la Base de datos domuxdb
CREATE DATABASE IF NOT EXISTS domuxdb;

-- Creamos el usaurio y le concedemos todos los permisos
CREATE USER 'Santiago' @localhost IDENTIFIED BY '123456';

GRANT ALL PRIVILEGES ON domuxdb TO 'Santiago' @localhost;

-- Aplicamos cambios 
FLUSH PRIVILEGES;

-- Mostramos los permisos
SHOW GRANTS FOR 'Santiago' @localhost;

-- Nos conetamos a la bbdd
USE domuxdb;

-- Creamos la tablas:

-- Tabla usuarios
CREATE TABLE IF NOT EXISTS users (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	direction VARCHAR(50),
	city VARCHAR(50),
	province VARCHAR(50),
	postal_code VARCHAR(20),
	password VARCHAR(250) NOT NULL,
	registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla viviendas. Relación 1:N con users: Un usuario (propietario) puede tener N viviendas.
CREATE TABLE IF NOT EXISTS dwelling (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	direction VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	province VARCHAR(50) NOT NULL,
	postal_code VARCHAR(20) NOT NULL,
	house_type ENUM('apartment', 'house', 'studio', 'loft', 'other' ),
	square_meters DOUBLE DEFAULT 0.0,
	is_active BOOLEAN NOT NULL DEFAULT TRUE,
	pets BOOLEAN NOT NULL DEFAULT FALSE,
	raw_material ENUM('brick', 'wood', 'concrete', 'steel', 'stone', 'other') NOT NULL,
	id_user INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_user) REFERENCES users (id)
);

-- Tabla habitaciones. Relación 1:N con dwelling: Una vivienda tiene N habitaciones, la habitación pertenece a 1 vivienda.
CREATE TABLE IF NOT EXISTS rooms (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	name VARCHAR(50) NOT NULL,
	flat VARCHAR(10) DEFAULT '1', 
	square_meters DOUBLE DEFAULT 0.0,
	power_outlet BOOLEAN,
	natural_light_type ENUM('high', 'low', 'medium', 'none'),
	number_doors INT DEFAULT 1,
	number_windows INT DEFAULT 0,
	id_dwelling INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_dwelling) REFERENCES dwelling (id)	
);

-- Tabla dispositivos. Relación N:0 con rooms: Una habitación puede tener dispositivos o no.
CREATE TABLE IF NOT EXISTS devices (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	code VARCHAR(20) NOT NULL UNIQUE,
	wireless BOOLEAN,
	brand VARCHAR(50),
	model VARCHAR(50),
	power_w DOUBLE DEFAULT 0.0,
	is_active BOOLEAN,
	id_room INT UNSIGNED,
	FOREIGN KEY (id_room) REFERENCES rooms (id)
);

-- Tabla para la especialización de sensores (Herencia/Subtipo de Devices)
CREATE TABLE IF NOT EXISTS device_sensors (
	id_device INT UNSIGNED PRIMARY KEY,
	sensor_type ENUM( 'temperature', 'humidity', 'motion', 'light', 'other') NOT NULL,
	FOREIGN KEY (id_device) REFERENCES devices (id)
);

-- Tabla para la especialización de actuadores (Herencia/Subtipo de Devices)
CREATE TABLE IF NOT EXISTS device_actuators (
	id_device INT UNSIGNED PRIMARY KEY,
	action_type ENUM('switch', 'valve', 'motor', 'led', 'other') NOT NULL,
	FOREIGN KEY (id_device) REFERENCES devices (id)
);

-- Relación reflexiva para dispositivos enlazados, pueden estar enlazados o no.
CREATE TABLE IF NOT EXISTS device_device (
	id_device INT UNSIGNED NOT NULL,
	id_linked INT UNSIGNED NOT NULL,
	PRIMARY KEY (id_device, id_linked),
	FOREIGN KEY (id_device) REFERENCES devices (id),
	FOREIGN KEY (id_linked) REFERENCES devices (id)
);

-- Tabla de rutinas, los dispositivos tienen rutinas
CREATE TABLE IF NOT EXISTS routines (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	description VARCHAR(100),
	start_time TIME,
	end_time TIME,
	is_active BOOLEAN,
	creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para las acciones que puede tener una rutina, puede tener N acciones asociadas.
CREATE TABLE IF NOT EXISTS actions (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	task VARCHAR(100),
	id_routine INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_routine) REFERENCES routines (id)
);

-- Tabla de la relación N:M: device_routine, que dispositivos, en que rutinas participa y los días de se debe repetir
CREATE TABLE IF NOT EXISTS device_routine(
	id_device INT UNSIGNED NOT NULL,
	id_routine INT UNSIGNED NOT NULL,
	monday BOOLEAN NOT NULL DEFAULT FALSE,
	tuesday BOOLEAN NOT NULL DEFAULT FALSE,
	wednesday BOOLEAN NOT NULL DEFAULT FALSE,
	thursdays BOOLEAN NOT NULL DEFAULT FALSE,
	friday BOOLEAN NOT NULL DEFAULT FALSE,
	saturday BOOLEAN NOT NULL DEFAULT FALSE,
	sunday BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (id_device, id_routine),
	FOREIGN KEY (id_device) REFERENCES devices (id),
	FOREIGN KEY (id_routine) REFERENCES routines(id)
);

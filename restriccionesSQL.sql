CREATE DATABASE restricciones CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE TABLE clientes (Cliente VARCHAR(50),DNI VARCHAR(9),Direccion VARCHAR(60));
CREATE TABLE series (Nombre VARCHAR(60),Temporadas INT,Fecha_emision DATE,Género ENUM('Accion','Comedia','Suspense','Ciencia Ficcion','Misterio'),Idioma VARCHAR(60),Director VARCHAR (60),Protagonistas VARCHAR(60));
CREATE TABLE actores (DNI VARCHAR (9),Nombre VARCHAR(60),Edad INT,País VARCHAR(40));
CREATE TABLE pais (codigo VARCHAR(40), Nombre VARCHAR(40),Continente VARCHAR(40));
INSERT INTO clientes VALUES ('Manuel Perez','77777777A','Calle Golondrino 4');
INSERT INTO clientes VALUES ('Pedro Ramirez','88888888B','Calle La Paz 24');
INSERT INTO pais VALUES ('A45B56C67','China','Asia');
INSERT INTO pais VALUES ('D12E23F34','Alemania','Europa');
INSERT INTO actores VALUES ('12345678A','Richard Richar','43','Belgica');
INSERT INTO actores VALUES ('98765432B','Chad Chadison','22','EEUU');
INSERT INTO series VALUES ('La casa de papel','2','2017-05-2','Accion','Español','Alex Pina','Ursula Corbero');
INSERT INTO series VALUES ('Perdidos','6','2004-09-22','Misterio','Ingles','Jack Bender','Matthew Fox');
-- restriccion a nivel de tabla
CREATE TABLE empleados (cedula INT(8),Nombre VARCHAR (30),apellido VARCHAR(30),cargo VARCHAR(30),tiempo_servicio INT,PRIMARY KEY (cedula));
-- restriccion a nivel de columna
CREATE TABLE empleados2 (cedula INT(8) PRIMARY KEY,Nombre VARCHAR (30),apellido VARCHAR(30),cargo VARCHAR(30),tiempo_servicio INT);
CREATE TABLE ordenadores (Serial VARCHAR (12) PRIMARY KEY, Procesador VARCHAR (20),TarjetaGrafica VARCHAR (20));
CREATE TABLE coches (Matricula VARCHAR(10),Color VARCHAR(15),Kilometros BIGINT, PRIMARY KEY (Matricula));

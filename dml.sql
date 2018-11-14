-- conectar a mysql
mysql -u root -p 

-- desconectar de mysql
quit

-- ver bases de datos creadas
show databases;

-- mostrar versión
select version();
 
-- mostrar fecha y hora actual
select NOW();

-- mostrar usuario
select USER();

-- crear un usuario dentro de la base de datos que pongamos
GRANT ALL ON nombre_bd.* TO 'nombre_usuario'@'dominio';

-- crear base de datos
CREATE DATABASE nombre_bd;

-- entrar a la base de datos
USE nombre_bd;

-- mostrar las tablas de la base de datos
SHOW TABLES;

-- ver elementos de las columnas de la tabla (* todas columna; segunda manera solo las que indiques.)
SELECT * FROM nombre_tabla;
SELECT user,host FROM user;


DESCRIBE nombre_tabla;

-- crear tabla
CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

--

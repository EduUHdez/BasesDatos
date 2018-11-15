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
CREATE DATABASE testsql CHARACTER SET Latin1 COLLATE latin1_spanish_ci;

-- entrar a la base de datos
USE nombre_bd;

-- ver los set de caracteres
SHOW CHARACTER SET;

-- modificar una base de datos
ALTER DATABASE testsql CHARACTER SET utf8;

-- crear tabla
CREATE TABLE nombre_tabla ;
CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);
create table tiposdatos (numero INT, unacoma FLOAT, numeropequenio TINYINT, numerogrande BIGINT, masdeuno DECIMAL(3,2), hora TIME, fecha DATE, palabra VARCHAR(20)); 


INSERT INTO pet VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);
-- mostrar las tablas de la base de datos
SHOW TABLES;

-- ver elementos de las columnas de la tabla (* todas columna; segunda manera solo las que indiques.)
SELECT * FROM nombre_tabla;
SELECT user,host FROM user;

-- mostrar tabla
DESCRIBE nombre_tabla;

-- eliminar base de datos
DROP DATABASE nombre_bd;








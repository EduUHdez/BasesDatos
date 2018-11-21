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

-- insertar valores en la tabla
INSERT INTO pet VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);

-- insertar varios valores en una tabla
INSERT INTO proveedores (nombre, direccion, pago) VALUES ('Juan','Poligono','2500'),('Felipe','Calle mayor','4600'),('Federico','Calle cerrada','1800');

-- mostrar las tablas de la base de datos
SHOW TABLES;

-- mostrar tabla
DESCRIBE nombre_tabla;

-- ver elementos de las columnas de la tabla (* todas columna; segunda manera solo las que indiques.)
SELECT * FROM nombre_tabla;
SELECT user,host FROM user;

-- restriccion a nivel de tabla
CREATE TABLE empleados (cedula INT(8),Nombre VARCHAR (30),apellido VARCHAR(30),cargo VARCHAR(30),tiempo_servicio INT,PRIMARY KEY (cedula));

-- restriccion a nivel de columna
CREATE TABLE empleados2 (cedula INT(8) PRIMARY KEY,Nombre VARCHAR (30),apellido VARCHAR(30),cargo VARCHAR(30),tiempo_servicio INT);

-- FOREIGN KEY() encierra la columna que sera clave referencial en la tabla productos, REFERENCES indicala tabla a la que hace referencia encerrando entre paréntesis el campo al que hace referencia, en nuestro casoREFERENCES proveedores(codigo) es el campo “código” de la tabla “proveedores”.
CREATE TABLE productos (codigo_p INT AUTO_INCREMENT, codigo_provee INT, nombre VARCHAR(40), precio FLOAT, disponible INT, PRIMARY KEY(codigo_p), FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo));

-- El campo que es clave primario no puede estar vacio ni admite valores nulos.

--
ON DELETE CASCADE ON UPDATE CASCADE);

-- para eliminar una clave foreign de una tabla
	-- miramos primero el id de la clave con : SHOW CREATE TABLE productos; en el apartado CONSTRAINT
ALTER TABLE productos DROP FOREIGN KEY productos_ibfk_1;
-- para volver a añadir la clave a una tabla ya existente
ALTER TABLE productos ADD FOREIGN KEY(codigo_provee) REFERENCES proveedores(codigo) ON DELETE CASCADE ON UPDATE CASCADE;

-- vaciar una tabla por completo
TRUNCATE TABLE nombretabla;

-- con NOT NULL detras del dato no te deja si no introduces un varchar de entre 0 y 20 caracteres.

-- El autoincrement nos iniciara un contador++ que comenzara en uno; no es necesario hacer INSERT de este valor; tiene que ser clave primaria.
...(nombredato tipodato AUTO_INCREMENT,...,PRIMARY KEY(nombredato));
-- luego al insertar datos en esta tabla con AUTO_INCREMENT tendremos que tener en cuenta que tendremos que seleccionar los campos para los que vamos a introducir valores INSERT INTO proveedores (nombre,direccion,pago) VALUES ('','','');

-- eliminar base de datos
DROP DATABASE nombre_bd;








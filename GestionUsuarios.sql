SELECT * FROM mysql.user;
-- 1.-Crea un usuario 'creausuarios' y otórgale permisos para que pueda crear usuarios.

CREATE USER 'creausuarios'@'localhost' IDENTIFIED BY 'creausuarios';
-- el identified deberia ser una contraseña con 8 caracteres minimo, una mayuscula, un caracter alfanumerico y un numero.
GRANT ALL PRIVILEGES ON *.* TO creausuarios@'localhost';

-- 2.-Conecta como 'creausuarios' crea un nuevo usuario 'usujardineria'.
-- mysql -u creausuarios -p;(con esto accedemos con el nuevo usuario y nos pedira su contraseña).
CREATE USER 'usujardineria'@'localhost' IDENTIFIED BY 'Usujardineria@1234';

-- 3.-Conecta como 'root', otórgale permisos al usuario 'usujardineria' para que pueda crear tablas en jardineria.
-- mysql -u root -p;
USE Jardineria;
GRANT ALL PRIVILEGES ON Jardineria TO usujardineria@'localhost';

-- 4.-Conecta como 'usujardineria' comprueba que dispone de los permisos creando una tabla de árboles en jardineria. La tabla debe tener código,
-- nombre, altura máxima y edad de vida media.
-- mysql -u usujardineria -p;
CREATE TABLE arboles (codigo VARCHAR(20), nombre VARCHAR(20), alturamax VARCHAR(20), edadmedia VARCHAR(20));

-- 5.-Conecta como 'root', muestra los permisos que tiene el usuario 'usujardineria'.
SHOW GRANTS FOR usujardineria@'localhost';

-- 6.-Conecta como 'usujardineria' muestra los permisos que posee y comprueba que son los mismos a los de la orden anterior.
-- mysql -u usujardineria -p;
SHOW GRANTS FOR usujardineria@'localhost';

-- 7.-Conecta como 'root' otorga permiso de creación y borrado, así como de ejecución al usuario 'usujardineria' sobre una base de datos creada previamente.
CREATE DATABASE Eduardo;

GRANT ALL PRIVILEGES ON Eduardo TO usujardineria@'localhost';

-- 8.-Conecta como 'root' crea un usuario de nombre 'creartablasnba' que tenga permisos para crear, borrar y modificar tablas de nba.
-- mysql -u root -p;
USE nba;
CREATE USER 'creartablasnba'@'localhost' IDENTIFIED BY 'Creartablasnba@1234';
GRANT ALL PRIVILEGES ON nba TO creartablasnba@'localhost';

-- 9.-Conecta como 'creartablasnba' crea un tabla sencilla de al menos dos columnas.
-- mysql -u creartablasnba -p;
CREATE TABLE estadios (nombre VARCHAR(20),capacidad VARCHAR(20));

-- 10.-Conecta como 'root' crea un usuario de nombre 'soloconsulta' que pueda realizar operaciones de consulta sobre todas las tablas de todas las bases de datos.
CREATE USER 'soloconsulta'@'localhost' IDENTIFIED BY 'Soloconsulta@1234';
GRANT ALL PRIVILEGES ON *.* TO soloconsulta@'localhost';

-- 11.-Añade a 'soloconsulta' el permiso de insertar en la tabla jugadores de nba.

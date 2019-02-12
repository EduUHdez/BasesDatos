use nba;
SELECT * FROM equipos;
SELECT Ciudad FROM equipos;
SELECT * FROM equipos WHERE Conferencia='East';
SELECT count(*) FROM equipos WHERE Conferencia='East';
SELECT * FROM jugadores;
SELECT Nombre FROM jugadores WHERE Peso>250;
SELECT Nombre FROM jugadores WHERE Procedencia IN('Spain''China');
SELECT * FROM jugadores WHERE nombre LIKE '%John%';
-- Despues del WHERE se puede usar and para añadir otra busqueda mas
 
SELECT peso/2,20 FROM jugadores WHERE peso BETWEEN 220 and 250;

-- Para seleccionar dos columnas las ponemos separadas con una ,

SELECT nombre, peso/2,20 FROM jugadores WHERE peso BETWEEN 220 and 250;

SELECT nombre, max(peso) FROM jugadores;

SELECT nombre FROM jugadores WHERE nombre_equipo='Timberwolves';

SELECT avg(peso) FROM jugadores WHERE nombre_equipo='Lakers';

SELECT jugadores.nombre FROM jugadores, equipos WHERE ciudad='Los Angeles';

SELECT j.nombre, e.nombre, e.ciudad FROM jugadores j,equipos e WHERE ciudad='Los Angeles' AND j.nombre_equipo=e.nombre;

-- jugadores conf west miden mas de 7 pies
SELECT j.nombre, e.nombre FROM jugadores j, equipos e WHERE altura>'7-0' and Conferencia='west' AND j.nombre_equipo=e.nombre;

SELECT j.nombre, e.nombre FROM jugadores j, equipos e WHERE altura>'7-0' and Conferencia='west' AND j.nombre_equipo=e.nombre ORDER BY Altura desc;

-- edit-Format-Beautify Query
SELECT 
    nombre
FROM
    jugadores
WHERE
    altura = (SELECT 
            MAX(altura)
        FROM
            jugadores);
-- +----------+
-- | nombre   |
-- +----------+
-- | Yao Ming |
-- +----------+

-- count(*) cuenta las filas 

SELECT Conferencia, COUNT(*) from equipos GROUP BY Conferencia;



SELECT Division, COUNT(*) from equipos GROUP BY Division;


SELECT Conferencia, COUNT(*) from equipos WHERE nombre LIKE 't%' GROUP BY Conferencia;

SELECT Procedencia, avg(peso) FROM jugadores WHERE Procedencia IN ('Spain','France') GROUP BY Procedencia;


select Nombre_equipo, avg(peso) from jugadores GROUP BY Nombre_equipo HAVING avg(peso)>230 ORDER BY avg(peso);


SELECT j.nombre, e.nombre FROM jugadores j, equipos e WHERE Conferencia='west' AND j.nombre_equipo=e.nombre;

SELECT nombre FROM jugadores WHERE Nombre_equipo IN(SELECT nombre FROM equipos WHERE Conferencia='West');





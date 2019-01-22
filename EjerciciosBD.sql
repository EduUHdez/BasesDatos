#1. Nombre, apellidos y email de los empleados a cargo de Alberto Soria
SELECT Nombre, Apellido1, Apellido2, Email FROM Empleados WHERE CodigoJefe =(SELECT codigoempleado FROM Empleados WHERE Nombre='Alberto' and apellido1='soria' limit 1);
#SELECT Nombre, Apellido1, Apellido2, Email FROM Empleados WHERE CodigoJefe=3;

#2. Ciudad y teléfono de las oficinas de EEUU

SELECT Ciudad, Telefono FROM Oficinas WHERE Pais='EEUU';

#3. Nombre, apellidos y cargo de aquellos que _no_ sean representantes de ventas

select nombre,apellido1, apellido2, puesto from Empleados where puesto <>'Representante Ventas';

#4. Cargo, nombre, apellidos y email del jefe de la empresa.

select nombre,apellido1, apellido2, puesto,email from Empleados where puesto ='Director General';

#5. Número de clientes que tiene la empresa.

SELECT count(CodigoCliente) FROM Clientes;

#6. Nombre de los clientes españoles.

SELECT NombreContacto FROM Clientes WHERE Pais='España' and pais='Spain';
#SELECT NombreCliente FROM Clientes WHERE Pais='España';

#7. Cuántos clientes tiene cada país.

SELECT pais,count(*) FROM Clientes group by pais;

#8. Cuántos clientes tiene Madrid.

SELECT count(nombrecontacto) FROM Clientes where ciudad='Madrid';

#9. Cuántos clientes tienen las ciudades que empiezan por M.

SELECT count(NombreContacto) FROM Clientes WHERE Ciudad LIKE 'M%';

#10. Código de empleado y número de clientes al que atiende cada representante de ventas.

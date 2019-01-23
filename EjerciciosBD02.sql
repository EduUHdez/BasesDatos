#1. Listado de clientes indicando nombre del cliente y cuántos pedidos ha efectuado.
SELECT 
    Clientes.NombreContacto, COUNT(CodigoPedido)
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
GROUP BY Clientes.NombreContacto;

#2. Listado con los nombres de los clientes y el total pagado por cada uno de ellos.
SELECT 
    Clientes.NombreContacto, sum(Pagos.Cantidad)
FROM
    Clientes
        INNER JOIN
    Pagos ON Clientes.CodigoCliente = Pagos.CodigoCliente
GROUP BY Clientes.CodigoCliente;

#3. El nombre de los clientes que hayan hecho pedidos en 2009.
SELECT 
    Clientes.NombreCliente, Pedidos.FechaPedido
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
WHERE
    Pedidos.FechaPedido LIKE '2009%';

#4. El nombre del cliente y el nombre y apellido de sus representantes de los clientes de Madrid.
SELECT 
    Clientes.NombreCliente,
    Empleados.Nombre,
    Empleados.Apellido1
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
WHERE
    Clientes.Ciudad = 'Madrid';
    
#5. Un listado de clientes con el nombre de su representante y la ciudad donde está su oficina.
SELECT 
    Clientes.NombreCliente,
    Empleados.Nombre,
    Empleados.Apellido1,
    Oficinas.Ciudad
FROM
    Clientes
        INNER JOIN
    Empleados ON Clientes.CodigoEmpleadoRepVentas = Empleados.CodigoEmpleado
        INNER JOIN
    Oficinas ON Oficinas.CodigoOficina = Empleados.CodigoOficina;

#6. Nombre, apellidos, oficina y cargo de los empleados que no son reprentantes de ventas.
SELECT 
    Empleados.Nombre,
    Empleados.Apellido1,
    Empleados.Apellido2,
    Oficinas.Ciudad
FROM
    Empleados
        INNER JOIN
    Oficinas ON Oficinas.CodigoOficina = Empleados.CodigoOficina
WHERE
    Empleados.Puesto <> 'Representante_ventas';
    
#7. Número de empleados de cada oficina y ciudad donde está situada.
SELECT 
    Oficinas.Ciudad, COUNT(CodigoEmpleado)
FROM
    Oficinas
        INNER JOIN
    Empleados ON Oficinas.CodigoOficina = Empleados.CodigoOficina
GROUP BY Oficinas.Ciudad;

#8. Listado con el nombre de los empleados y el nombre de sus jefes.


#9. Media de unidades en stock de los productos agrupados por gama de producto.
SELECT 
     avg(Productos.CantidadEnStock), Productos.Gama
FROM
    Productos
        INNER JOIN
    GamasProductos ON GamasProductos.Gama = Productos.Gama
GROUP BY Productos.Gama;

#10. Clientes que residen en ciudades donde hay oficina, indicando dirección de la oficina.
SELECT 
    Clientes.NombreCliente, Oficinas.LineaDireccion1,Oficinas.Ciudad
FROM
    Clientes
        INNER JOIN
    Oficinas ON Clientes.Ciudad = Oficinas.Ciudad;

#11. Clientes que residen en ciudades donde no hay oficina, indicando la ciudad en la que viven
SELECT 
    Clientes.NombreCliente,
    Oficinas.LineaDireccion1,
    Oficinas.Ciudad
FROM
    Clientes
        INNER JOIN
    Oficinas ON Clientes.Ciudad = Oficinas.Ciudad IS NULL;
    
#12. Número de clientes asignados a cada representante de ventas.
SELECT 
    Empleados.CodigoEmpleado,
    Empleados.Nombre,
    COUNT(Clientes.CodigoEmpleadoRepVentas) AS 'clientes'
FROM
    Empleados
        INNER JOIN
    Clientes ON Empleados.CodigoEmpleado = Clientes.CodigoEmpleadoRepVentas
GROUP BY Clientes.CodigoEmpleadoRepVentas;

#13. Listado con el precio total de cada pedido.
SELECT 
    Pedidos.CodigoPedido, Pagos.Cantidad
FROM
    Pedidos
        INNER JOIN
    Pagos ON Pedidos.CodigoCliente = Pagos.CodigoCliente;

#14. Clientes que hayan hecho pedidos en 2008 por importe superior a 2000 euros.
SELECT 
    Clientes.NombreCliente, Pagos.Cantidad, Pedidos.FechaPedido
FROM
    Clientes
        INNER JOIN
    Pagos ON Clientes.CodigoCliente = Pagos.CodigoCliente
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
WHERE
    Pagos.Cantidad > 2000
        AND Pedidos.FechaPedido LIKE '2008%';

#15. Cuántos pedidos tiene cada cliente en cada estado.
SELECT 
    COUNT(Pedidos.CodigoPedido), Clientes.CodigoCliente,Pedidos.Estado
FROM
    Clientes
        INNER JOIN
    Pedidos ON Pedidos.CodigoCliente = Clientes.CodigoCliente
ORDER BY Clientes.CodigoCliente;

#16. Los clientes que hayan pedido más de 200 unidades de cualquier producto.
SELECT 
    Clientes.NombreCliente,
    Pedidos.CodigoPedido,
    DetallePedidos.Cantidad
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
        INNER JOIN
    DetallePedidos ON DetallePedidos.CodigoPedido = Pedidos.CodigoPedido
WHERE
    DetallePedidos.Cantidad > 200;

#17. Cliente que hizo el pedido de mayor cuantía e importe.
SELECT 
    Clientes.NombreCliente,
    max(DetallePedidos.Cantidad),
    max(Pagos.Cantidad)
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
        INNER JOIN
    DetallePedidos ON DetallePedidos.CodigoPedido = Pedidos.CodigoPedido
        INNER JOIN
    Pagos ON Pagos.CodigoCliente = Pedidos.CodigoCliente
    GROUP BY Clientes.NombreCliente;

#18. Cliente que hizo el pedido de menor cuantía e importe.
SELECT 
    Clientes.NombreCliente,
    min(DetallePedidos.Cantidad),
    min(Pagos.Cantidad)
FROM
    Clientes
        INNER JOIN
    Pedidos ON Clientes.CodigoCliente = Pedidos.CodigoCliente
        INNER JOIN
    DetallePedidos ON DetallePedidos.CodigoPedido = Pedidos.CodigoPedido
        INNER JOIN
    Pagos ON Pagos.CodigoCliente = Pedidos.CodigoCliente
    GROUP BY Clientes.NombreCliente;











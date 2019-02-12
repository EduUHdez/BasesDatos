create view ejer18 as SELECT CodigoPedido, CodigoCliente, FechaEsperada FROM Pedidos WHERE fechaentrega<=fechaesperada-2;
select * from ejer18 where CodigoCliente='5';
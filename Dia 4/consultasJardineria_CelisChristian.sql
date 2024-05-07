use Jardineria;

#Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigoOficina, ciudad
from oficina;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.


select ciudad, telefono
from oficina
where pais="España";

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre, concat(apellido1," ",apellido2) as apellidos, email
from empleado
where codigoJefe=7;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select puesto,  nombre,concat(apellido1," ",apellido2) as apellidos, email
from empleado
where codigoJefe is null;

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select puesto,  nombre,concat(apellido1," ",apellido2) as apellidos, email
from empleado
where puesto <> "Representante Ventas";

-- Devuelve un listado con el nombre de los todos los clientes españoles.

select nombreCliente
from cliente
where pais="Spain";

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select distinct(estado)
from pedido;


-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

-- Utilizando la función YEAR de MySQL.

select DISTINCT(codigoCliente)
from pago
where year(fechaPago)="2008";

-- Utilizando la función DATE_FORMAT de MySQL.

select DISTINCT(codigoCliente)
from pago
where DATE_FORMAT(fechaPago,"%Y")="2008";


-- Sin utilizar ninguna de las funciones anteriores.


select DISTINCT(codigoCliente)
from pago
where fechaPago BETWEEN "2008/01/01" and "2008/12/31";


-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega
from pedido
where fechaEntrega > fechaEsperada and estado="Entregado";

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.


-- Utilizando la función ADDDATE de MySQL.

select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega
from pedido
where fechaEntrega <= ADDDATE(fechaEsperada, INTERVAL -2 DAY);


-- Utilizando la función DATEDIFF de MySQL.


-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?



---------------------------------

-- Devuelve un listado de todos los pedidos que fueron en 2009.

select *
from pedido
where year(fechaPedido)="2009";

-- Devuelve un listado de todos los pedidos que han sido  en el mes de enero de cualquier año.
select *
from pedido
where month(fechaPedido)="01";


-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

select *
from pago
where year(fechaPago)="2008" and formaPago="PayPal"
ORDER BY total desc;

-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

select distinct(formaPago)
from pago;

-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select *
from producto
where gama="Ornamentales" and cantidadStock >100
order by precioVenta desc;

-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

select *
from cliente
where ciudad="Madrid" and codigoEmpleadoRepVentas = 11 or codigoEmpleadoRepVentas = 30


--ConsultaS Multitabla


-- 
















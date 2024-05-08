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
select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega
from pedido
where datediff(fechaEntrega,fechaEsperada)>=2;


-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

select codigoPedido,codigoCliente,fechaEsperada,
fechaEntrega, (day(fechaEntrega)-day(fechaEsperada)) as diferencia
from pedido
where  day(fechaEntrega)-day(fechaEsperada) <= -2 and month(fechaEntrega) <= month(fechaEsperada) ;


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

-- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select c.nombreCliente as Cliente,  e.nombre as "Representante ventas", concat(e.apellido1," ",e.apellido2) as Apellidos
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigoEmpleado;


-- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

select c.nombreCliente, e.nombre as "Representante ventas"
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigoEmpleado
where codigoCliente in(select codigoCliente from pago);


-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select c.nombreCliente, e.nombre as "Representante ventas", ofi.ciudad as "Ubicacion OFICINA"
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigoEmpleado
inner Join oficina as ofi on ofi.codigoOficina = e.codigoOficina
where codigoCliente in(select codigoCliente from pago) ;

-- Devuelve el nombre de los clientes que  hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.


select c.nombreCliente, e.nombre as "Representante ventas",ofi.ciudad, ofi.lineaDireccion1
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigoEmpleado
inner Join oficina as ofi on ofi.codigoOficina = e.codigoOficina
where codigoCliente in(select codigoCliente from pago) and c.ciudad="Fuenlabrada";


-- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select c.nombreCliente, e.nombre as "Representante ventas",ofi.ciudad
from cliente as c
inner Join empleado as e on c.codigoEmpleadoRepVentas = e.codigoEmpleado
inner Join oficina as ofi on ofi.codigoOficina = e.codigoOficina;



-- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.


select e.nombre, e.codigoJefe, jf.nombre
from empleado as e
inner join empleado as jf on e.codigoJefe=jf.codigoEmpleado;

--  Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

select e.nombre as empleado,jf.nombre as jefe,jf2.nombre as jefedelJefe
from empleado as e
inner join empleado as jf on e.codigoJefe=jf.codigoEmpleado
inner join empleado as jf2 on jf.codigoJefe=jf2.codigoEmpleado;

-- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.


select c.nombreCliente
from cliente as c
inner join pedido as p on p.codigoCliente=c.codigoCliente
where p.fechaEntrega > p.fechaEsperada and p.estado="Entregado";

-- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

select c.nombreCliente, gp.gama, count(gp.gama) as "Numero de productos"
from cliente as c 
INNER JOIN pedido as p on p.codigoCliente = c.codigoCliente
inner join detalle_pedido as dt on dt.codigoPedido = p.codigoPedido
inner join producto as pro on pro.idProducto = dt.codigoProducto
inner join gama_producto as gp on gp.gama = pro.gama
group by c.nombreCliente, gp.gama
order by c.nombreCLiente;


---- Desarrollado por christian celis;
-- 1.***.***.441.

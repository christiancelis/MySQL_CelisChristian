
create database Jardineria;
use Jardineria;

create table gama_producto(
    gama varchar(50) primary key,
    descripcionTexto TEXT,
    descripcionHtml TEXT,
    imagen varchar(256)
);

create table producto(
    idProducto varchar(15) primary key,
    nombre varchar(70) not null,
    gama varchar(50) not null,
    dimensiones varchar(50),
    proveedor varchar(50),
    descripcion text,
    cantidadStock SMALLINT(6) not null,
    precioVenta DECIMAL(15,2) not null,
    precioProveedor decimal(15,2) not null,
    Foreign Key (gama) REFERENCES gama_producto(gama)
);

create table oficina(
   codigoOficina varchar(10) primary key,
   ciudad varchar(30) not null,
   pais varchar(50) not null,
   region varchar(50),
   codigoPostal varchar(10) not null,
   telefono varchar(20),
   lineaDireccion1 varchar(50) not null,
   lineaDireccion2 varchar(50)
);

create table empleado(
    codigoEmpleado int(11) primary key,
    nombre varchar(50) not null,
    apellido1 varchar(50) not null,
    apellido2 varchar(50),
    extension_ varchar(10) not null,
    email varchar(100) not null,
    codigoOficina varchar(10) not null,
    codigoJefe int(11),
    puesto varchar(50),
    Foreign Key (codigoOficina) REFERENCES oficina(codigoOficina),
    Foreign Key (codigoJefe) REFERENCES empleado(codigoEmpleado)
);

create table cliente(
    codigoCliente int(11) primary key,
    nombreCliente varchar(50) not null,
    nombreContacto varchar(30),
    apellidoContacto varchar(30),
    telefono varchar(15) not null,
    fax varchar(15) not null,
    lineaDireccion1 varchar(50) not null,
    lineaDireccion2 varchar(50),
    ciudad varchar(50) not null,
    region varchar(50),
    pais varchar(50),
    codigoPostal varchar(10),
    codigoEmpleadoRepVentas int(11),
    limiteCredito DECIMAL(15,2),
    Foreign Key (codigoEmpleadoRepVentas) REFERENCES empleado(codigoEmpleado)
);


create table pago(
    codigoCliente int(11) not null,
    formaPago varchar(40) not null,
    idTransaccion varchar(50) primary key,
    fechaPago date not null,
    total decimal(15,2) not null,
    Foreign Key (codigoCliente) REFERENCES cliente(codigoCliente)

);


create table pedido(
    codigoPedido int(11) primary key,
    fechaPedido date not null,
    fechaEsperada date not null,
    fechaEntrega date,
    estado Varchar(15) not null,
    comentarios text,
    codigoCliente int(11) not null,
    Foreign Key (codigoCliente) REFERENCES cliente(codigoCliente)
);

create table detalle_pedido(
    codigoPedido int(11),
    codigoProducto varchar(15),
    primary key(codigoPedido,codigoProducto),
    cantidad int(11) not null,
    precioUnidad decimal(15,2) not null,
    numeroLinea SMALLINT(6),
    Foreign Key (codigoPedido) REFERENCES pedido(codigoPedido),
    Foreign Key (codigoProducto) REFERENCES producto(idProducto)
);





create database Empresa;

use Empresa;

-- Consultas sobre una tabla

-- 1. Lista el primer apellido de todos los empleados.
delimiter //
create procedure ListarApellido()
DETERMINISTIC
BEGIN
    select apellido1
    from empleado
    order by apellido1;
END; //
delimiter ;
call ListarApellido();

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén
-- repetidos.


delimiter //
create procedure ListarApellidoUnico()
DETERMINISTIC
BEGIN
    select distinct(apellido1)
    from empleado
    order by apellido1;
END; //
delimiter ;
call ListarApellidoUnico();

-- 3. Lista todas las columnas de la tabla empleado.

delimiter //
create procedure ListarEmpleado()
DETERMINISTIC
BEGIN
    select * 
    from empleado;
END; //
delimiter ;
call ListarEmpleado();

-- 4. Lista el nombre y los apellidos de todos los empleados.

select nombre, apellido1, if(apellido2 is null," ",apellido2) as apellido2
from empleado;

-- 5 Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado.

select id_departamento as identificador
from empleado
where id_departamento is not null;

-- 6. Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado, eliminando los identificadores que aparecen repetidos.

select distinct(id_departamento) as identificador
from empleado
where id_departamento is not null;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.

select concat(nombre," ", apellido1, " ",if(apellido2 is null,"",apellido2)) as FullName
from empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.

select upper(concat(nombre," ", apellido1, " ",if(apellido2 is null,"",apellido2))) as FullName
from empleado;


-- 9. Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.

select lower(concat(nombre," ", apellido1, " ",if(apellido2 is null,"",apellido2))) as FullName
from empleado;


-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
-- otra la letra.


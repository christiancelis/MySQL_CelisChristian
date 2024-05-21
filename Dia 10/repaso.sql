show databases;
use mysql;
show tables;
select * from user;
use mysql;
select user,host from mysql.user;

create database EjemploClase;
use EjemploClase;
-- crear un usuario;
create user "pedro" @"localhost" IDENTIFIED by "pedro123";

-- revisar permisos;


show grants for pedro @"localhost";

-- dar permisos,
flush PRIVILEGES;
grant select, insert, update, delete on *.* to "pedro"@"localhost";

 -- revocar permisos 
 revoke all privileges on *.* from "pedro"@"localhost";

 -- revizar procesos

 show processList;


 -- BORRAR UN ELEMENTO DE UNA TABLA

 delete from nombre tabla where id="2";

 -- quitar proceso

-- kill y numero de proceso

-- quitar todos los privilegios;
revoke all privileges , grant options from "pedro"@"localhost";







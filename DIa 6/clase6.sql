#########################
###Ejercicio dia 6#######
###########################


-- titulo: normalizacion de datos

--pasos principales para normalizacion de datos,

-- primera forma normal (1NF)
-- en la primera forma normal se busca eliminar las repeticiones
-- y asegurar que cada columna tenga un solo valor atomico-
--"reducir"


--Ejercicio 1.
-- EL siguiente query esta normalizado?
use Jardineria;

-- Segunda forma normal (2NF)
-- "redundancia"


-- Tercera forma normal (3NF)
-- "independencia"

create database dia6;

create table estudiante(
    idestudiante int primary key,
    nombre varchar(100) not null,
    telefono varchar(25) not null
);
insert into estudiante (nombre,apellido) values("a","e");
alter table estudiante
add apellido varchar(100);

alter TABLE estudiante
modify idestudiante int AUTO_INCREMENT;

alter table estudiante
drop telefono;

describe estudiante;

select * from estudiante;


## truncate table estudiante;
## elimina los datos de una tabla
truncate estudiante;

## modificar el nombre de una tabla

-- alter table estudiante
-- rename column estudiantes_escritos to estudiante;

insert into estudiante values
(101,"Matematicas","Ana"),
(102,"Matematicas","Juan"),
(103,"Matematicas","Maria"),
(104,"Matematicas","Pedro"),
(105,"Historia","Luis"),
(106,"Historia","Ana"),
(107,"Historia","Carme"),
(108,"Fisica","Juan"),
(109,"Fisica","Carmen"),
(110,"Fisica","Beatriz");

 -- ####### Segunda Forma Normal (2NF)#######

 -- Es cuando una tabla está en la forma 1NF, donde cada atributo que no forma 
 -- parte de la clave primaria es COMPLETAMENTE DEPENDIENTE de la clave primaria;
 
 ------------------------------------------
 --------------------------------------------
 ------------------------------------


 --Dicha 2NF se aplica a las tablas que tienen claves primarias comṕuestas de dos o mas atributos,
 -- donde si una tabla está en 1NF y su clave primaria es simple (Tiene un solo atributo), entonces también está,
 -- en 2NF;

 -- lO que busca hacer la segunda normalizacion es que cada atributo no clave de una tabla deba depender completamente
 -- de la clave primaria de esta tabla,mas no ser una parte de ella;

 -- Requisito: Estar en la primera forma normal donde todos los atributos no claves deban depender totalmente de la clave primaria,
 -- en otras palabras, el nombre del curso es dependiente del id del mismo, pero estan juntan. se busca independizar dichos datos;




-- estudiante ID,NOMBRE 
-- CURSO ID CURSO , NOMBRE CURSO 
-- ESTUDIANTE CURSO ID_CURSO, ID_ESTUDIANTE ;














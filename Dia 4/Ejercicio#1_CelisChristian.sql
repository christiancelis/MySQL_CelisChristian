-- Active: 1714700953570@@172.16.101.128@3306


###############################
#######Ejercicio dia 4#########
###############################

-- crea la base de datos pais
create DATABASE Pais;


-- se usa la base de datos
use Pais;


-- se crea la tabla pais
create table Pais(
    idPais int primary key,
    nombre varchar(20),
    continente varchar(50),
    poblacion int
);


-- se crea la tabla ciudad
create table Ciudad(
    idCiudad int primary key,
    nombre varchar(20), 
    idPais int not null,
    Foreign Key (idPais) REFERENCES Pais(idPais) 
);


-- se crea la tabla idioma
create table Idioma(
    idIdioma int primary key,
    idioma varchar(50)
);

-- se crea la tabla intermedia entre idiomas y pais
create table IdiomaPais(
    idIdioma int,
    idPais int,
    esOficial TINYINT,
    primary key(idIdioma, idPais),
    Foreign Key (idPais) REFERENCES Pais(idPais),
    Foreign Key (idIdioma) REFERENCES Idioma(idIdioma) 
);

-- se insertan 10 datos para la tabla pais
insert into Pais values(1,"Australia","Oceania",300000),
(2,"España","Europa",400000),
(3,"Estados Unidos","Norte America",300000),
(4,"Marruecos","Africa",600000),
(5,"China","Asia",700000),
(6,"Japon","Asia",800000),
(7,"Colombia","Sur America",900000),
(8,"Costarica","Centro America",1000000),
(9,"Rusia","Europa",110000),
(10,"Ucrania","Europa",1200000);
-- se insertan 10 datos para la tabla Ciudad
insert into Ciudad values(1,"Cali",7),
(2,"Moscu",9),
(3,"kiev",10),
(4,"Sidney",1),
(5,"new york",3),
(6,"Barcelona",7),
(7,"Cucuta",7),
(8,"Bucaramanga",7),
(9,"Washington DC",3),
(10,"Hong Kong",5);

-- se insertan 10 datos para la tabla Idiomas;
insert into Idioma values(1,"Español"),
(2,"Ingles"),
(3,"Arabe"),
(4,"Chino Mandarin"),
(5,"Ruso"),
(6,"Catalan"),
(7,"Tailandes"),
(8,"Esperanto"),
(9,"Japones"),
(10,"Koreano");

-- se insertan 10 datos para la tabla  IdiomaPais
insert into IdiomaPais VALUES(2,1,0),
(1,2,1),
(2,3,0),
(3,4,1),
(4,5,1),
(9,6,1),
(1,7,1),
(1,8,0),
(5,9,1),
(5,10,1);

-- consulta join para mostrar las ciudades que tienen cada pais;
select p.nombre as NombrePais, c.nombre as NombreCiudad
from Pais as p
inner join Ciudad as c on c.idPais=p.idPais;


-- consulta left para mostrar las ciudades incluso si no estan asignadas a la misma;
select p.nombre as NombrePais, c.nombre as NombreCiudad
from Pais as p
left join Ciudad as c on c.idPais=p.idPais;


-- consulta right para mostrar las ciudades y paises incluso las ciudades que no tiene pais;
select p.nombre as NombrePais, c.nombre as NombreCiudad
from Pais as p
right join Ciudad as c on c.idPais=p.idPais;


-- consulta right para mostrar las ciudades y paises incluso las ciudades Y paises que no tiene pais;

(select p.nombre as NombrePais, c.nombre as NombreCiudad
from Pais as p
left join Ciudad as c on c.idPais=p.idPais)
UNION
(
select p.nombre as NombrePais, c.nombre as NombreCiudad
from Pais as p
right join Ciudad as c on c.idPais=p.idPais)



###############################
-- Desarrollado por Christian Celis C.C:1.***.***.441.
###############################

select p.nombre, count(ip.esOficial) as "Numero Idiomas Oficiales"
from Pais as p
inner join IdiomaPais as ip on ip.idPais=p.idPais
where ip.esOficial=0
GROUP BY p.nombre;





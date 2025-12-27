create database if not exists biblioteca;
use biblioteca;
create table  autores ( 
 id int auto_increment primary key,
 nombre varchar(100),
 apellido varchar(100 ));

create table libros (
    id int auto_increment primary key,
    titulo varchar(150),
    anio_publicacion int,
    id_autor int,
    foreign key (id_autor) references autores(id)
);

insert into autores (nombre, apellido) values
('Juan', 'Bosch'),
('Marcio', 'Veloz Maggiolo'),
(' Salomé', 'Ureña'),
('Pedro', 'Mir');

insert into libros (titulo, anio_publicacion, id_autor) values
('La Mañosa', 1936,1),
('El oro y la paz', 1975,1),
('La Mujer', 1933,1),
('El buen ladrón', 1960, 2),
('La vida no tiene nombre', 1965, 2),
('La gloria del progreso', 1873, 3),
('Lira de Quisqueya', 1874, 3),
('Cuando amaban las tierras comuneras', 1978, 4),
('Hay un país en el mundos', 1949, 4);

select l.titulo, l.anio_publicacion, a.nombre, a.apellido as apellido
from libros l
join autores a on l.id = a.id;

select titulo, anio_publicacion
from libros
where id = 1;  -- gabriel garcía márquez

select a.nombre, count(l.id) as cantidad_libros
from autores a
left join libros l on a.id = l.id_autor
group by a.nombre;

create database if not exists universidad;
use universidad;

create table estudiantes (
    id int auto_increment primary key,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    fecha_nacimiento date
);

create table materias (
    id int auto_increment primary key,
    materia varchar(100) not null,
    descripcion text,
    creditos int
);

create table matriculas (
    id_matricula int auto_increment primary key,
    id_estudiante int,
    id_materia int,
    fecha_matricula date,
    foreign key (id_estudiante) references estudiantes(id),
    foreign key (id_materia) references materias(id)
);

insert into estudiantes (nombre, apellido, fecha_nacimiento)
values 
('frodo', 'bolson', '2011-11-12'),
('gandalf', 'el gris', '2011-11-25'),
('jarry', 'potter', '2010-11-25');

insert into materias (materia, descripcion, creditos)
values 
('matemáticas', 'matematica discreta', 4),
('historia', 'historia dominicana', 3),
('naturales', 'las plantas y su ecosistema', 3),
('quimica', 'elementos quimicos', 5);

insert into matriculas (id_estudiante, id_materia, fecha_matricula)
values 
(1, 1, '2011-11-11'),
(1, 2, '2011-11-11'),
(2, 1, '2012-12-12'),
(2, 2, '2012-12-12');

select e.nombre, e.apellido, c.materia
from estudiantes e
join matriculas m on e.id = m.id_estudiante
join materias c on m.id_materia = c.id;



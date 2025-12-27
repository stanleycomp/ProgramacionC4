create database if not exists trabajo_final;
use trabajo_final;

create table persona (
id int auto_increment primary key,
nombre varchar (100) not null,
apellido varchar (100) not null
);
-- create table nombre (
-- id int auto_increment primary key,

-- nombre varchar (100) not null
 -- );
 -- create table nombre (
-- id int auto_increment primary key,
-- nombre varchar (100) not null
 -- );
 
create table departamento (
    id int auto_increment primary key,
    nombre varchar(100) not null
);

create table profesor (
    id int auto_increment primary key,
    id_persona int not null ,
    id_departamento int,
    foreign key (id_departamento) references departamento(id),
    foreign key (id_persona) references persona(id)
);

create table curso (
    id int auto_increment primary key,
    nombre varchar(100) not null,
    id_departamento int,
    foreign key (id_departamento) references departamento(id)
);

create table estudiante (
    id int auto_increment primary key,
	id_persona int not null,
    matricula varchar (50),
    foreign key (id_persona) references persona(id)
);

create table clase (
    id int auto_increment primary key,
    nombre_clase varchar (50),
    id_curso int,
    id_profesor int,
    horario varchar(50),
    foreign key (id_curso) references curso(id),
    foreign key (id_profesor) references profesor(id)
);

create table inscripcion (
    id int auto_increment primary key,
    id_estudiante int,
    id_clase int,
    fecha date,
    foreign key (id_estudiante) references estudiante(id),
    foreign key (id_clase) references clase(id)
);

create table calificacion (
    id_calificacion int auto_increment primary key,
    id_estudiante int,
    id_clase int,
    nota decimal(4,2),
    foreign key (id_estudiante) references estudiante(id),
    foreign key (id_clase) references clase(id)
);

insert into persona (nombre, apellido) values 
('gandalf', 'el gris'), 
('frodo','bolson'),
('harry','potter'),
('jose','urena'),
('manuel','vargas'),
('jack','sparrow'),
('jhon','constantine');

insert into departamento (nombre) values 
('turismo'), 
('mercadeo'),
('ingenieria en sistemas'), 
('telematica');

insert into profesor (id_persona, id_departamento) values 
(1, 1), 
(2, 2),
(3, 3),
(4, 4);

insert into curso (nombre, id_departamento) values 
('ccna', 4), 
('programacion phyton', 3),
('mercadeo 1', 2),
('turismo 2', 1);

insert into estudiante (id_persona, matricula) values 
(5, '2025-001'), 
(6, '2025-002'),
(7, '2025-003');

insert into clase (nombre_clase, id_curso, id_profesor, horario) values 
('swtching', 1, 1, 'lunes 5:30 pm'), 
('introduccion a python', 2, 2, 'lunes 6:15 PM'),
('ventas 1', 3, 3, 'lunes 7:00 pm'),
('hoteleria 2', 4, 4, 'lunes 7:45 pm')
;

insert into inscripcion (id_estudiante, id_clase, fecha) values
(1, 1, '2010-12-27'),
(2, 2, '2010-12-27'),
(3, 3, '2010-12-27')
;

insert into calificacion (id_estudiante, id_clase, nota) values
(1, 1, '75.5'),
(2, 2, '90.5'),
(3, 3, '95.0')
;

SELECT p.nombre AS nombre_estudiante, 
p.apellido AS apellido_estudiante,
e.matricula,
c.nombre AS curso,
cl.nombre_clase AS materia,
cl.horario As horario,
prof.nombre AS nombre_profesor,
prof.apellido AS apellido_profesor,
cal.nota AS calificacion
FROM estudiante e 
JOIN persona p ON e.id_persona = p.id 
JOIN inscripcion i ON e.id = i.id_estudiante 
JOIN clase cl ON i.id_clase = cl.id 
JOIN curso c ON cl.id_curso = c.id 
JOIN profesor pr ON cl.id_profesor = pr.id 
JOIN persona prof ON pr.id_persona = prof.id 
JOIN calificacion cal ON e.id = cal.id_estudiante 
AND cl.id = cal.id_clase;

create database if not exists ventas;
use ventas;

create table clientes (
    id int auto_increment primary key,
    nombre varchar(100) not null,
    apellido varchar(100),
    telefono varchar(20)
);

create table productos (
    id int auto_increment primary key,
    nombre varchar(100) not null,
    precio decimal(10,2) not null,
    stock int not null
);


create table facturas (
    id int auto_increment primary key,
    id_cliente int,
    fecha date not null,
    total decimal(10,2),
    foreign key (id_cliente) references clientes(id)
);


insert into clientes (nombre, apellido, telefono) values
('jose', 'urena', '8091112233'),
('frodo', 'bolson', '8092223344'),
('gandalf', 'el gris', '8093334455'),
('jarry','potther', '8094445566');


insert into productos (nombre, precio, stock) values
('madragora', 300.00, 10),
('orcos', 550.00, 100),
('hobbit', 30.00, 10),
('elfo', 10000.00, 5);

insert into facturas (id_cliente, fecha, total) values
(1, '2025-12-10', 30.00),
(1, '2025-12-11', 200.00),
(2, '2025-12-12', 1000.00);

select f.id, c.nombre as cliente, apellido, f.fecha, f.total
from facturas f
join clientes c on f.id = c.id;


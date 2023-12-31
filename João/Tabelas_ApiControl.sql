create database apicontrol;

use apicontrol;

create table cadastro (
id_cadastro int primary key auto_increment,
nome varchar (50),
cnpj char (14),
data_cadastro datetime default current_timestamp,
senha varchar (12),
email varchar (50),
telefone varchar (15),
cep varchar (30),
numero varchar (7),
complemento varchar (20)
);

insert into cadastro values 
	(null, '+Mel', '11036452844632', null, '55mel232', 'maismel@mail.com', '(11)10511-2397', '09055310', '1152', null),
    (null, 'Bee Happy', '11037776244632', null, '06happy2892', 'beehappy@mail.com', '(11)10841-1973', '07795580', '489', 'Apartamento 31'),
    (null, 'sweet honey', '81637452554432', null, 'honeY7794', 'honeysweer@mail.com', '(11)94978-8453', '71084396', '1152', null);

select * from cadastro;

create table sensor(
id_sensor int primary key auto_increment,
temperatura varchar (5),
umidade varchar (5)
);

desc sensor;

insert into sensor (temperatura, umidade) values
	('22º','87%'),
	('35º','98%'),
    ('12º','71%');

select * from sensor; 

create table colmeia(
id_colmeia int primary key auto_increment,
especie varchar (50),
sensor varchar (3),
status_colmeia varchar (15) constraint chkstatus check (status_colmeia in ('Ideal','Médio','Crítico'))
);

insert into colmeia values
	(null, 'Jataí', 1,'Ideal'),
    (null,'Mandaçaia', 2, 'Crítico'),
    (null, 'Uruçu', 3, 'Médio');
    
desc colmeia;

select * from colmeia;
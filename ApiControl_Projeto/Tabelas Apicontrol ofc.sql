create database apicontrol;

use apicontrol;

-- TABELA CADASTRO
create table cadastro (
id_cadastro int primary key auto_increment,
nome varchar (50),
cnpj char (14),
data_cadastro datetime default current_timestamp,
login varchar (50),
senha varchar (12),
email varchar (50),
telefone varchar (15),
cep varchar (30),
numero varchar (7),
complemento varchar (20)
);

desc cadastro;

insert into cadastro (nome, cnpj, login, senha, email, telefone, cep, numero, complemento) values 
	('+Mel', '11036452844632', 'melmais', '55mel232', 'maismel@mail.com', '(11)10511-2397', '09055310', '1152', null),
    ('Bee Happy', '11037776244632', 'beehappy', '06happy2892', 'beehappy@mail.com', '(11)10841-1973', '07795580', '489', 'Apartamento 31'),
    ('sweet honey', '81637452554432', 'sweethoney', 'honeY7794', 'honeysweer@mail.com', '(11)94978-8453', '71084396', '1152', null);

select * from cadastro;


-- TABELA SENSOR
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


-- TABELA COLMEIA
create table colmeia(
id_colmeia int primary key auto_increment,
especie varchar (50),
sensor varchar (3),
status_colmeia varchar (15) constraint chkstatus check (status_colmeia in ('Ideal','Médio','Crítico'))
);

desc colmeia;

insert into colmeia (especie, sensor, status_colmeia) values
	('Jataí', 1,'Ideal'),
    ('Mandaçaia', 2, 'Crítico'),
    ('Uruçu', 3, 'Médio');
    
select * from colmeia; 

-- TABELAS API CONTROL
show tables;
CREATE DATABASE apicontrol;

USE apicontrol;

CREATE TABLE empresa
(id_empresa int primary key auto_increment,
nome_empresa varchar(50),
CEP char(8),
logradouro varchar(40),
bairro varchar (40),
cidade varchar(20),
estado char(2),
pais char(2),
cnpj char(14));

insert into empresa (nome_empresa, CEP, logradouro, bairro, cidade, estado, pais, cnpj) values
('Apicultura em familia', '06784201', 'Rua Angelina', 'Jd Fernades', 'São Paulo', 'SP', 'BR', 12345678000105),
('ApiDoces', '06452410', 'Rua ferreira', 'Penha', 'São Paulo', 'SP', 'BR', 12365489000156),
('Happy bee', '02547890', 'Rua uruguai', 'Jd antonio', 'Manaus', 'AM', 'BR', '12316489000156');

select * from empresa;
drop table empresa;
DESCRIBE sensor;

CREATE TABLE usuario
(id_usuario int primary key auto_increment,
nome varchar (50),
email varchar (50),
senha varchar(40),
data_cadastro timestamp DEFAULT CURRENT_TIMESTAMP(),
telefone char(11));

insert into usuario (nome, email, senha, telefone) values
('João felipe', 'joao@gmail.com', '12345678', '11959411966'),
('Andre Carlos', 'andre.carlos@gmail.com', '12345678', '11986307524'),
('Felipe Carvalho', 'felipe@gmail.com', '12345678', '11952145887');

select * from usuario;

create table sensor 
(id int primary key auto_increment,
temperatura float,
data_hora_coleta timestamp DEFAULT CURRENT_TIMESTAMP(),
localizacao varchar(100),
status varchar(20));

insert into sensor (temperatura, localizacao, status) values
(30, "caixa1", "Bom"),
(36.1, "caixa2", "Bom"),
(33, "caixa3", "Bom");

select * from sensor;

create table colmeias
(id_colmeia int primary key auto_increment,
descricao varchar(100),
especie_abelha varchar(40),
data_intalacao DATETIME DEFAULT current_timestamp(),
status_colmeia varchar (50),
localizacao varchar (55));

insert into colmeias (descricao, especie_abelha, status_colmeia, localizacao) values
("caixa saudavel com um volume de produção auto", "Apis", "Bom", "Corredor1"),
("caixa revisada recentimente", "Apis", "Bom", "Corredor1"),
("caixa recuperada", "Apis", "Médio", "Corredor3");

drop table colmeias;

select * from colmeias;

show tables;

truncate table sensor;





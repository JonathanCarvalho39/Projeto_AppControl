create database apicontrol;
use apicontrol;

create table usuario (
	idUsuario int primary key auto_increment,
    cnpj char(11) unique,
    nomeEmpresa varchar(50),
    email varchar(30),
	senha varchar(30),
    dataCadastro datetime,
    enderecoEmpresa varchar(50),
    cep char(8),
    telefone varchar(15)
);

create table sensor (
	idSensor int primary key auto_increment,
    temperatura varchar(5),
    umidade varchar(5)
);

create table colmeia (
	idColmeia int primary key auto_increment,
    especie varchar(50),
    sensor varchar(3)
);
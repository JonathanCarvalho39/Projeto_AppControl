create database apicontrol;

use apicontrol;

-- TABELA CADASTRO
create table usuario(
id_usuario int primary key auto_increment,
nome varchar(50),
email varchar(100) unique,
senha varchar(50),
cnpj char (14),
data_cadastro datetime default current_timestamp,
telefone varchar (9)) auto_increment = 1000;

-- Adicionado a coluna fk_endereco para receber a chave estrangeira da tabela endereco
alter table usuario add column fk_endereco int;

-- Determinando a coluna fk_endereco como a cheve estrangeria da minha tabela usuario
alter table usuario add constraint fkEnd 
	foreign key (fk_endereco)
		references endereco  (id_endereco);

desc usuario;

insert into usuario(nome, email, senha, cnpj, telefone, fk_endereco) values 
('Apiario Caminho do Sol', 'caminhodosol@gmail.com', '123456789', '12345678965412', '71956478922', 50),
('Familia do mel', 'caminho@gmail.com', '123456788', '12345678965XXX', '71952418677', 51),
('Mel e companhia', 'companhia@gmail.com', '1234569878','56412698745215', '11956325475', 52);

select * from usuario;

create table endereco (
id_endereco int primary key auto_increment,
estado char(2),
cidade varchar (40),
cep char(8),
bairro varchar (40),
logradouro varchar (100),
numero varchar (10),
complemento varchar (20)
) auto_increment = 50;
 

insert into endereco (estado, cidade, cep, bairro, logradouro, numero, complemento) values
	('BA', 'Salvador', '40015110', 'Rua Julio Carreira', 'Comércio', '55', null),
    ('BA', 'Salvador', '40015035', 'Comércio',' Avenida Jequitaia', 45, null ),
    ('SP', ' Araras', '13607730', 'Jardim Santa Olívia II', 'Rua 7', 103, null);
  
select * from endereco;

create table sensor(
id_sensor int primary key auto_increment,
temperatura float,
data_instalacao date,
data_hora_coleta datetime default current_timestamp
) auto_increment = 100;

insert into sensor (data_instalacao) values
	('2023-09-14'),
	('2023-09-14'),
    ('2023-09-14');
    
desc sensor;

select * from sensor;

-- TABELA COLMEIA
create table colmeia(
id_colmeia int primary key auto_increment,
especie varchar (50),
descricao varchar(200));

-- Adicionando uma coluna localizacao na tabela colmeia
alter table colmeia add column localizacao varchar(20);

-- Adicionar valores a coluna localização da tabela colmeia
update colmeia set localizacao = 'corredor 1'
	where id_colmeia = 1;
update colmeia set localizacao = 'corredor 2'
	where id_colmeia = 2;
update colmeia set localizacao = 'corredor 3'
	where id_colmeia = 3;
update sensor set temperatura = 38.5
	where id_sensor = 103;
    
    
-- adicionando uma constrain na colmeia
Alter table colmeia add column status_colmeia varchar(15)
	constraint chkstatus check (status_colmeia in ('Ideal','Médio','Crítico'));

-- Adicionando a coluna para receber a chave estrangeira da tabela colmeia
Alter table colmeia add column fksensor_id int;

-- Definido a coluna fksensor para ser a chave estrangeira, com referencia no idSensor da tabela sensor
alter table colmeia add constraint fk_sensor
	foreign key (fksensor_id)
		references  sensor(id_sensor);
        
-- Adicionado outra coluna para chave estrageira onde vai ligar o usuario ao enxame, detectando que ele é o dono daquele enxame
alter table colmeia add column fk_usuario int;

-- definindo a coluna que criei para ser a chave estrangerio para a chave de fato buscando a referencia do ID da tabela usuario
alter table colmeia add constraint fkUsuario
	foreign key (fk_usuario)
		references usuario(id_usuario);

desc colmeia;

insert into colmeia (especie, descricao, status_colmeia, fksensor_id) values
	('Jataí', 'Colmeia Revisada recentemente','Ideal', 103),
    ('Mandaçaia', 'Colmeia Revisada no ano de 2023 ', 'Crítico', 104),
    ('Uruçu', 'esta colmeia produziu bem ano passado', 'Médio', 105);
    
update colmeia set fk_usuario = 1000
	where id_colmeia = 1;
update colmeia set fk_usuario = 1000
	where id_colmeia = 2;
update colmeia set fk_usuario = 1001
	where id_colmeia = 3;

select * from colmeia;



-- TABELAS API CONTROL
show tables;

-- Exibindo a especie da abela a localizaçãoe e o sensor associado a essa colmeia
select colmeia.especie as ESPECIE_ABELHA, colmeia.localizacao as CORREDOR_COLMEIA, sensor.id_sensor as ID_SENSOR
	from sensor join colmeia
		on id_sensor = fksensor_id;

-- Exibindo a colmeia e a temperatura do sensor de temperatura associado a cada colmeia
select colmeia.especie as ESPECIE_ABELHA, sensor.temperatura as TEMPERATURA_ENXAME 
	from sensor join colmeia
		on id_sensor = fksensor_id;
        
-- Exibindo o a quantidade de enxames que o usuario com o id 1000 tem e o status dessas colmeis
select status_colmeia as STATUS_DA_COLMEIA, usuario.nome as NOME_DO_APIARIO, colmeia.especie as ESPECIE_ABELHA, endereco.estado as ESTADO_EMPRESA
	from usuario join colmeia
		on id_usuario = fk_usuario
			join endereco 
				on id_endereco = fk_endereco
					where id_usuario = 1000;
					
select * from usuario;

truncate table colmeia;

create database Estacionamento;
use Estacionamento;

/*================================================================================================================================================================================*/
create table cliente(
idcliente int primary key auto_increment,
nome varchar(30) not null,
cpf varchar(11) not null unique,
sexo char(1) not null);

create table telefone(
idtelefone int primary key auto_increment,
tipo enum ('res','cel','com'),
numero varchar(30),
id_cliente int);

create table carro(
idcarro int primary key auto_increment,
placa varchar(7) not null,
id_cliente int);

create table marca(
idmodelo int primary key auto_increment,
tipo_modelo varchar(30) not null,
id_carro int);

create table cores(
idcor int primary key auto_increment,
tipo_cor varchar(30) not null,
id_carro int);

/*================================================================================================================================================================================*/

alter table telefone add constraint FK_CLIENTE_TELEFONE foreign key(id_cliente)
references cliente(idcliente);

alter table carro add constraint FK_CLIENTE_CARRO foreign key(id_cliente) 
references cliente(idcliente);

alter table marca add constraint FK_CARRO_MODELO foreign key(id_carro)
references carro(idcarro);

alter table cores add constraint FK_CARRO_COR foreign key(id_carro)
references carro(idcarro);

/*================================================================================================================================================================================*/

insert into cliente values(null, 'João', '57438323395','M');
insert into cliente values(null, 'Maria', '38323574332','F');
insert into cliente values(null, 'Paula', '43268974395','F');

insert into telefone values(null,'cel','11223344',1);
insert into telefone values(null,'res','22113344',1);
insert into telefone values(null,'cel','66554499',2);
insert into telefone values(null,'com','88443377',3);

insert into carro values(null,'QBZ9A23',1);
insert into carro values(null,'XYZ4A92',2);
insert into carro values(null,'OPU8E45',3);

insert into marca values(null,'Ford',1);
insert into marca values(null,'Nissan',2);
insert into marca values(null,'Chevrolet',3);

insert into cores values(null,'Vermelho',1);
insert into cores values(null,'Preto',1);
insert into cores values(null,'Prata',2);
insert into cores values(null,'Preto',3);
insert into cores values(null,'Branco',3);

/*================================================================================================================================================================================*/

select cl.idcliente
	  ,cl.nome
      ,cl.sexo
      ,cl.cpf
      ,te.tipo
      ,te.numero
      ,ma.tipo_modelo as modelo
      ,ca.placa
      ,co.tipo_cor as cor

from cliente cl 
	,telefone te 
    ,carro ca 
    ,marca ma 
    ,cores co

where cl.idcliente = te.id_cliente 
and cl.idcliente = ca.id_cliente 
and ca.idcarro = ma.id_carro
and ca.idcarro = co.id_carro;








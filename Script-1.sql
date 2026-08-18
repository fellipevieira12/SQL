create table empresa(
  id integer primary key,
  nome varchar(255),
  cnpj varchar(255),
  email varchar(255),
  telefone varchar(255),
  endereco varchar(255)
);

create table entregador(
  id integer primary key,
  id_empresa integer,
  nome varchar(255),
  cpf varchar(255),
  rg varchar(255),
  celular varchar(255)
);

create table cliente(
  telefone varchar(255) primary key,
  nome varchar(255),
  endereco varchar(255),
  pontoreferencia varchar(255),
  nascimento date 
);

create table login(
  id integer primary key,
  email varchar(255),
  senha varchar(255),
  nivel_acesso integer
);

insert into login(id, email, senha, nivel_acesso)
  values(1, 'l1@l1.com', '1234');
  
select *
from login

select id, email from login

update login
  set nivel_acesso = 0

create table marmita(
  id integer primary key,
  nome varchar(255),
  descricao mediumtext,
  tamanho varchar(255),
  valor varchar(255)
);

create table pedido(
  id integer primary key,
  status varchar (255),
  taxa_entrega varchar(255),
  data datetime
);

create table item_pedido(
  id integer primary key,
  nome varchar(255),
  descricao mediumtext,
  tamanho varchar(255),
  valor varchar(255)
);

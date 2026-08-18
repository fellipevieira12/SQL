create table cliente(
  cod_cliente int primary key comment "código do cliente",
  nome varchar(30) not null default 'ni' comment "nome",
  empresa varchar(255) not null default 'ni' comment "empresa",
  telefone varchar(255) not null default 0 comment "telefone"
)

create table tecnico(
  cod_tecnico int primary key comment "código do tecnico",
  nome varchar(30) not null default 'ni' comment "nome"
)

create table servico(
  cod_servico int primary key comment "código do servico",
  atividade varchar(30) not null default 'ni' comment "atividade"
)

create table finalizacao(
  cod_final int primary key comment "código final",
  valor_total decimal(10,2) not null default 'ni' comment "valor total",
  data datetime comment "data",
  data_entrega datetime comment "data entrega"
)

create table ordem_de_servico(
  cod_ordem int primary key comment "código da ordem",
  data datetime comment "data",
  defeito varchar(255) not null default 'ni' comment "defeito",
  equipamento varchar(255) not null default 'ni' comment "equipamento"
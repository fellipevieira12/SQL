create table cliente(
  cod_cliente int primary key comment "código do cliente",
  nome varchar(30) not null default 'ni' comment "nome",
  empresa varchar(255) not null default 'ni' comment "empresa",
  telefone varchar(255) not null default 0 comment "telefone"
);

create table tecnico(
  cod_tecnico int primary key comment "código do tecnico",
  nome varchar(30) not null default 'ni' comment "nome"
);

create table servico(
  cod_servico int primary key comment "código do servico",
  atividade varchar(30) not null default 'ni' comment "atividade"
);

create table finalizacao(
  cod_final int primary key comment "código final",
  valor_total decimal(10,2) not null default 'ni' comment "valor total",
  data datetime comment "data",
  data_entrega datetime comment "data entrega"
);

create table ordem_de_servico(
  cod_ordem int primary key comment "código da ordem",
  data datetime comment "data",
  defeito varchar(255) not null default 'ni' comment "defeito",
  equipamento varchar(255) not null default 'ni' comment "equipamento",
  cod_cliente int not null default 0 comment "código do cliente",
  cod_tecnico int not null default 0 comment "código do tecnico",
  cod_final int not null default 0 comment "código final"
);

create table relacao_3(
  cod_ordem int comment "código da ordem",
  cod_servico int comment "código do servico"
);

alter table relacao_3
  add constraint fk_servico foreign key (cod_servico)
  references servico(cod_servico)
  on delete cascade
  on update cascade;

alter table relacao_3
  add constraint fk_ordem_de_servico foreign key (cod_ordem)
  references ordem_de_servico(cod_ordem) 
  on delete cascade
  on update cascade;

alter table ordem_de_servico
  add constraint fk_cliente foreign key (cod_cliente)
  references cliente(cod_cliente)
  on delete cascade
  on update cascade;

alter table ordem_de_servico
  add constraint fk_tecnico foreign key (cod_tecnico)
  references tecnico(cod_tecnico)
  on delete cascade
  on update cascade;

alter table ordem_de_servico
  add constraint fk_finalizacao foreign key (cod_final)
  references finalizacao(cod_final)
  on delete cascade
  on update cascade;

insert into cliente(cod_cliente, nome, empresa, telefone)
values
  (1, 'jose', 'empresa a', '11 1111 1111'),
  (2, 'joao', 'empresa b', '22 2222 2222'),
  (3, 'maria', 'empresa c', '33 3333 3333');


insert into tecnico(cod_tecnico, nome)
  values
  (11, 't jose'),
  (22, 't joao'),
  (33, 't maria');

insert into servico(cod_servico, atividade)
  values
  (111, 'colocar'),
  (222, 'tirar'),
  (333, 'formatar');

insert into finalizacao(cod_final, valor_total, data, data_entrega)
values
  (5555, 10, '2001-01-01', '2001-01-01'),
  (6666, 20, '2002-02-02', '2002-02-02'),
  (7777, 30, '2003-03-03', '2003-03-03');

insert into ordem_de_servico(cod_ordem, data, defeito, equipamento, cod_cliente, cod_tecnico, cod_final)
  values
  (11111, '2001-01-01', 'falha 1', 'maquina 1', 1, 11, 5555),
  (22222, '2002-02-02', 'falha 2', 'maquina 2', 2, 22, 6666),
  (33333, '2003-03-03', 'falha 3', 'maquina 3', 3, 33, 7777);

insert into relacao_3(cod_servico, cod_ordem)
  values
  (111, 11111),
  (222, 22222),
  (333, 33333);

select nome, telefone
  from cliente;

update finalizacao
  set data_entrega = '1899-12-31';

select *
  from finalizacao;

































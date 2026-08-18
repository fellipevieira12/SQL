create table cliente(
  cod_cliente int primary key comment "Id do cliente",
  nome varchar(30) not null default 'ni' comment "nome",
  empresa varchar(30) not null default 'ni' comment "empresa",
  telefone varchar(255) not null default 'ni' comment "telefone"
)

create table tecnico(
  cod_tecnico int primary key comment "Id do tecnico",
  nome varchar(30) not null default 'ni' comment "nome"
)

create table finalizacao(
  cod_final int primary key comment "Codigo",
  valor_total numeric(10,2) not null default 0 comment "valor total",
  data datetime,
  data_entrega datetime
)

create table ordemdeservico(
  cod_ordem int primary key comment "Id da ordem",
  data datetime,
  defeito varchar(255) default 'ni' comment "defeito",
  equipamento varchar(255) not null default 'ni' comment "equipamento",
  cod_cliente int not null default 0 comment "Id do cliente",
  cod_tecnico int not null default 0 comment "Id do tecnico",
  cod_final int not null default 0 comment "Id codigo final"
)

create table servico(
  cod_servico int primary key comment "Codigo do serviço",
  atividade varchar(255) not null default 'ni' comment "atividade"
)

create table relacao_3(
  cod_servico int not null default 0 comment "Id codigo servico",
  cod_ordem int not null default 0 comment "Id codigo ordem"
)

-- Chaves estrangeiras
-- Relacionamento entre serviço e ordem de serviço

alter table relacao_3
add constraint fk_servico
foreign key(cod_servico)
references servico(cod_servico)
on delete cascade
on update cascade

alter table relacao_3
add constraint fk_ordem
foreign key(cod_ordem)
references ordemdeservico(cod_ordem)
on delete cascade
on update cascade

-- Chaves estrangeiras
-- Relacionamento da ordem de serviço

alter table ordemdeservico
add constraint fk_cod_cliente
foreign key(cod_cliente)
references cliente(cod_cliente)
on delete cascade
on update cascade

alter table ordemdeservico
add constraint fk_cod_tecnico
foreign key(cod_tecnico)
references tecnico(cod_tecnico)
on delete cascade
on update cascade

alter table ordemdeservico
add constraint fk_cod_final
foreign key(cod_final)
references finalizacao(cod_final)
on delete cascade
on update cascade
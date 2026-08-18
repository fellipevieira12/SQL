create table produto(
  cod int,
  nome varchar(20),
  id_categoria int,
  primary key(cod)
)

create table categoria(
  id int,
  nome varchar(20)
)

-- Chave primária
-- Define a chave primária da tabela categoria

alter table categoria
add primary key(id)

-- Exclusão de tabela
-- Remove a tabela categoria

drop table categoria

-- Criação da tabela categoria
-- Recria a tabela com restrições

create table categoria(
  id int primary key comment "id da categoria",
  nome varchar(20) not null default 'NI' comment "nome da categoria"
)

-- Alteração de estrutura
-- Modifica a coluna nome da tabela produto

alter table produto
modify nome varchar(30)
not null
default 'NI'
comment "Nome do produto"

-- Chave estrangeira
-- Relacionamento entre produto e categoria

alter table produto
add constraint fk_categoria
foreign key(id_categoria)
references categoria(id)
on delete cascade
on update cascade
create table cliente(
  id_cliente int not null primary key auto_increment,
  nome varchar(255) not null,
  cpf varchar(11) not null unique,
  telefone varchar(15) not null,
  email varchar(255) not null unique,
  endereco varchar(255) not null
)

create table autor(
  id_autor int not null primary key auto_increment,
  nome_autor varchar(255) not null
)

create table categoria(
  id_categoria int not null primary key auto_increment,
  nome_categoria varchar(255) not null
)

create table livro(
  id_livro int not null primary key auto_increment,
  titulo varchar(255) not null,
  ano_publicacao int not null
)

create table reserva(
  id_reserva int not null primary key auto_increment,
  data_reserva date not null,
  status varchar(20),
  id_cliente int not null,
  constraint fk_id_cliente_cliente
    foreign key(id_cliente)
    references cliente(id_cliente)
)

create table emprestimo(
  id_emprestimo int not null primary key auto_increment,
  data_emprestimo date not null,
  data_devolucao date not null,
  status varchar(20) not null,
  id_cliente int not null,
  constraint fk_id_cliente_emprestimo
    foreign key(id_cliente)
    references cliente(id_cliente)
)

-- Relacionamento N:N
-- Empréstimos e livros

create table livro_emprestimo(
  id_emprestimo int not null,
  id_livro int not null,
  primary key(id_emprestimo,id_livro),
  constraint fk_id_emprestimo_livro_emprestimo
    foreign key(id_emprestimo)
    references emprestimo(id_emprestimo)
    on delete cascade,
  constraint fk_id_livro_livro_emprestimo
    foreign key(id_livro)
    references livro(id_livro)
    on delete cascade
)

-- Relacionamento N:N
-- Livros e categorias

create table livro_categoria(
  id_livro int not null,
  id_categoria int not null,
  primary key(id_livro,id_categoria),
  constraint fk_id_livro_livro_categoria
    foreign key(id_livro)
    references livro(id_livro)
    on delete cascade,
  constraint fk_id_categoria_livro_categoria
    foreign key(id_categoria)
    references categoria(id_categoria)
    on delete cascade
)

-- Relacionamento N:N
-- Livros e autores

create table livro_autor(
  id_livro int not null,
  id_autor int not null,
  primary key(id_livro,id_autor),
  constraint fk_id_livro_livro_autor
    foreign key(id_livro)
    references livro(id_livro)
    on delete cascade,
  constraint fk_id_autor_livro_autor
    foreign key(id_autor)
    references autor(id_autor)
    on delete cascade
)

-- Relacionamento N:N
-- Reservas e livros

create table livro_reserva(
  id_reserva int not null,
  id_livro int not null,
  primary key(id_reserva,id_livro),
  constraint fk_id_reserva_livro_reserva
    foreign key(id_reserva)
    references reserva(id_reserva)
    on delete cascade,
  constraint fk_id_livro_livro_reserva
    foreign key(id_livro)
    references livro(id_livro)
    on delete cascade
)

-- Inserção de dados
-- Cadastro de clientes

insert into cliente(nome,cpf,telefone,email,endereco)
  values ('Felipe Vieira','12345678901','35999999999','felipe@email.com','Rua A, 123'),
         ('Maria Souza','98765432100','35988888888','maria@email.com','Rua B, 456')

-- Inserção de dados
-- Cadastro de autores

insert into autor(nome_autor)
  values ('Machado de Assis'),
         ('Clarice Lispector'),
         ('Paulo Coelho')

-- Inserção de dados
-- Cadastro de categorias

insert into categoria(nome_categoria)
  values ('Romance'),
         ('Ficção'),
         ('Drama')

-- Inserção de dados
-- Cadastro de livros

insert into livro(titulo,ano_publicacao)
  values ('Dom Casmurro',1899),
         ('A Hora da Estrela',1977),
         ('O Alquimista',1988),
         ('Memórias Póstumas de Brás Cubas',1881),
         ('Laços de Família',1960)

-- Inserção de dados
-- Relacionamento entre livros e autores

insert into livro_autor(id_livro,id_autor)
  values (1,1),
         (2,2),
         (3,3),
         (4,1),
         (5,2)

-- Inserção de dados
-- Relacionamento entre livros e categorias

insert into livro_categoria(id_livro,id_categoria)
  values (1,1),
         (2,3),
         (3,2),
         (4,1),
         (5,3)

-- Inserção de dados
-- Cadastro de empréstimos

insert into emprestimo(
  data_emprestimo,
  data_devolucao,
  status,
  id_cliente
)
  values ('2026-06-01','2026-06-10','ATIVO',7),
         ('2026-06-02','2026-06-12','FINALIZADO',8)

-- Inserção de dados
-- Relacionamento entre empréstimos e livros

insert into livro_emprestimo(id_emprestimo,id_livro)
  values (5,1),
         (5,3),
         (6,2),
         (6,4)

-- Inserção de dados
-- Cadastro de reservas

insert into reserva(data_reserva,status,id_cliente)
  values ('2026-06-05','ATIVA',1),
         ('2026-06-06','CANCELADA',2)

-- Inserção de dados
-- Relacionamento entre reservas e livros

insert into livro_reserva(id_reserva,id_livro)
  values (1,2),
         (1,5),
         (2,1),
         (2,3)

-- Consulta de dados
-- Exibe todos os clientes

select *
from cliente

-- Consulta de dados
-- Exibe nome e CPF dos clientes

select nome,
  cpf
from cliente

-- Filtro de dados
-- Busca cliente pelo CPF

select cpf
from cliente
where cpf = '12345678901'

-- Filtro de dados
-- Livros publicados antes de 2000

select *
from livro
where ano_publicacao < 2000

-- Ordenação
-- Clientes em ordem decrescente de nome

select *
from cliente
order by nome desc

-- Inserção de dados
-- Cadastro de novo cliente

insert into cliente(nome,cpf,telefone,email,endereco)
  values ('João Silva','11122233344','35977777777','joao@email.com','Rua C')

-- Consulta de dados
-- Exibe todos os clientes

select *
from cliente

-- Atualização de dados
-- Atualiza telefone do cliente

update cliente
set telefone = '35911111111'
where id_cliente = 1

-- Exclusão de dados
-- Remove cliente pelo código

delete from cliente
where id_cliente = 2

-- Junção de tabelas
-- Exibe empréstimos e seus clientes

select *
from emprestimo
join cliente
  on emprestimo.id_cliente = cliente.id_cliente
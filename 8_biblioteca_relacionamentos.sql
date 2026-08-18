create table cliente(
  id_cliente int auto_increment primary key,
  nome varchar(255) not null,
  cpf varchar(14) not null unique,
  telefone varchar(15),
  email varchar(255),
  endereco varchar(255)
)

create table autor(
  id_autor int auto_increment primary key,
  nome_autor varchar(255) not null
)

create table categoria(
  id_categoria int auto_increment primary key,
  nome_categoria varchar(255) not null
)

create table livro(
  id_livro int auto_increment primary key,
  titulo varchar(255) not null,
  ano_publicacao int not null
)

-- Relacionamento N:N
-- Livros e autores

create table livro_autor(
  id_livro int not null,
  id_autor int not null,
  primary key(id_livro,id_autor),
  foreign key(id_livro)
    references livro(id_livro)
    on delete cascade,
  foreign key(id_autor)
    references autor(id_autor)
    on delete cascade
)

-- Relacionamento N:N
-- Livros e categorias

create table livro_categoria(
  id_livro int not null,
  id_categoria int not null,
  primary key(id_livro,id_categoria),
  foreign key(id_livro)
    references livro(id_livro)
    on delete cascade,
  foreign key(id_categoria)
    references categoria(id_categoria)
    on delete cascade
)

create table reserva(
  id_reserva int auto_increment primary key,
  data_reserva date not null,
  status varchar(20),
  id_cliente int not null,
  foreign key(id_cliente)
    references cliente(id_cliente)
)

-- Relacionamento N:N
-- Reservas e livros

create table livro_reserva(
  id_reserva int not null,
  id_livro int not null,
  primary key(id_reserva,id_livro),
  foreign key(id_reserva)
    references reserva(id_reserva)
    on delete cascade,
  foreign key(id_livro)
    references livro(id_livro)
    on delete cascade
)

create table emprestimo(
  id_emprestimo int auto_increment primary key,
  data_emprestimo date not null,
  data_devolucao date,
  status varchar(20) not null,
  id_cliente int not null,
  foreign key(id_cliente)
    references cliente(id_cliente)
)

-- Relacionamento N:N
-- Empréstimos e livros

create table livro_emprestimo(
  id_emprestimo int not null,
  id_livro int not null,
  primary key(id_emprestimo,id_livro),
  foreign key(id_emprestimo)
    references emprestimo(id_emprestimo)
    on delete cascade,
  foreign key(id_livro)
    references livro(id_livro)
    on delete cascade
)

-- Inserção de dados
-- Cadastro de cliente

insert into cliente(
  id_cliente,
  nome,
  cpf,
  telefone,
  endereco,
  email
)
  values (1,'joao','12345678900','35999999999','ruaarvore','joaoemailcom')
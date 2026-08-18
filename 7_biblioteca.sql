create table cliente(
  id_cliente int not null primary key auto_increment,
  nome varchar(255) not null,
  cpf varchar(12) not null unique,
  telefone varchar(11) not null,
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
  status varchar(255),
  id_cliente int not null
)

create table emprestimo(
  id_emprestimo int not null primary key auto_increment,
  data_emprestimo date not null,
  data_devolucao date not null,
  status varchar(255) not null,
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
  constraint fk_id_emprestimo_livro_emprestimo
    foreign key(id_emprestimo)
    references emprestimo(id_emprestimo),
  constraint fk_id_livro_livro_emprestimo
    foreign key(id_livro)
    references livro(id_livro)
)

-- Relacionamento N:N
-- Livros e categorias

create table livro_categoria(
  id_livro int not null,
  id_categoria int not null,
  constraint fk_id_livro_livro_categoria
    foreign key(id_livro)
    references livro(id_livro),
  constraint fk_id_categoria_livro_categoria
    foreign key(id_categoria)
    references categoria(id_categoria)
)

-- Relacionamento N:N
-- Livros e autores

create table livro_autor(
  id_livro int not null,
  id_autor int not null,
  constraint fk_id_livro_livro_autor
    foreign key(id_livro)
    references livro(id_livro),
  constraint fk_id_autor_livro_autor
    foreign key(id_autor)
    references autor(id_autor)
)

-- Relacionamento N:N
-- Reservas e livros

create table livro_reserva(
  id_reserva int not null,
  id_livro int not null,
  constraint fk_id_reserva_livro_reserva
    foreign key(id_reserva)
    references reserva(id_reserva),
  constraint fk_id_livro_livro_reserva
    foreign key(id_livro)
    references livro(id_livro)
)
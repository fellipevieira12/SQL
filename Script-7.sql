CREATE TABLE cliente(
    `id_cliente` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `cpf` VARCHAR(11) NOT NULL UNIQUE,
    `telefone` VARCHAR(15) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `endereco` VARCHAR(255) NOT NULL
);

CREATE TABLE autor (
    `id_autor` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome_autor` VARCHAR(255) NOT NULL
);

CREATE TABLE categoria (
    `id_categoria` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome_categoria` VARCHAR(255) NOT NULL
);

CREATE TABLE livro(
    `id_livro` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `titulo` VARCHAR(255) NOT NULL,
    `ano_publicacao` INT NOT NULL
);

CREATE TABLE reserva(
    `id_reserva` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `data_reserva` DATE NOT NULL,
    `status` VARCHAR(20),
    `id_cliente` INT NOT null,
    CONSTRAINT `fk_id_cliente_cliente` FOREIGN KEY (`id_cliente`) REFERENCES cliente (`id_cliente`)
);

CREATE TABLE emprestimo (
    `id_emprestimo` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `data_emprestimo` DATE NOT NULL,
    `data_devolucao` DATE NOT NULL,
    `status` VARCHAR(20) NOT NULL,
    `id_cliente` INT NOT NULL,
    CONSTRAINT `fk_id_cliente_emprestimo` FOREIGN KEY (`id_cliente`) REFERENCES cliente (`id_cliente`)
);

CREATE TABLE livro_emprestimo (
    `id_emprestimo` INT NOT NULL,
    `id_livro` INT NOT NULL,
    PRIMARY KEY (id_emprestimo, id_livro),
    CONSTRAINT `fk_id_emprestimo_livro_emprestimo` FOREIGN KEY (`id_emprestimo`) REFERENCES emprestimo (`id_emprestimo`) ON DELETE CASCADE,
    CONSTRAINT `fk_id_livro_livro_emprestimo` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`) ON DELETE CASCADE
);

CREATE TABLE livro_categoria (
    `id_livro` INT NOT NULL,
    `id_categoria` INT NOT NULL,
    PRIMARY KEY (id_livro, id_categoria),
    CONSTRAINT `fk_id_livro_livro_categoria` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`) ON DELETE CASCADE,
    CONSTRAINT `fk_id_categoria_livro_categoria` FOREIGN KEY (`id_categoria`) REFERENCES categoria (`id_categoria`) ON DELETE CASCADE
);

CREATE TABLE livro_autor (
    `id_livro` INT NOT NULL,
    `id_autor` INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    CONSTRAINT `fk_id_livro_livro_autor` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`) ON DELETE CASCADE,
    CONSTRAINT `fk_id_autor_livro_autor` FOREIGN KEY (`id_autor`) REFERENCES autor (`id_autor`) ON DELETE CASCADE
);

CREATE TABLE livro_reserva (
    `id_reserva` INT NOT NULL,
    `id_livro` INT NOT NULL,
    PRIMARY KEY (id_reserva, id_livro),
    CONSTRAINT `fk_id_reserva_livro_reserva` FOREIGN KEY (`id_reserva`) REFERENCES reserva (`id_reserva`) ON DELETE CASCADE,
    CONSTRAINT `fk_id_livro_livro_reserva` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`) ON DELETE CASCADE
);

INSERT INTO cliente (nome, cpf, telefone, email, endereco) VALUES
('Felipe Vieira', '12345678901', '35999999999', 'felipe@email.com', 'Rua A, 123'),
('Maria Souza', '98765432100', '35988888888', 'maria@email.com', 'Rua B, 456');

INSERT INTO autor (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Paulo Coelho');

INSERT INTO categoria (nome_categoria) VALUES
('Romance'),
('Ficção'),
('Drama');

INSERT INTO livro (titulo, ano_publicacao) VALUES
('Dom Casmurro', 1899),
('A Hora da Estrela', 1977),
('O Alquimista', 1988),
('Memórias Póstumas de Brás Cubas', 1881),
('Laços de Família', 1960);

INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);

INSERT INTO livro_categoria (id_livro, id_categoria) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 1),
(5, 3);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, status, id_cliente) VALUES
('2026-06-01', '2026-06-10', 'ATIVO', 7),
('2026-06-02', '2026-06-12', 'FINALIZADO', 8);

INSERT INTO livro_emprestimo (id_emprestimo, id_livro) VALUES
(5, 1),
(5, 3),
(6, 2),
(6, 4);

INSERT INTO reserva (data_reserva, status, id_cliente) VALUES
('2026-06-05', 'ATIVA', 1),
('2026-06-06', 'CANCELADA', 2);

INSERT INTO livro_reserva (id_reserva, id_livro) VALUES
(1, 2),
(1, 5),
(2, 1),
(2, 3);

select * from cliente;

select nome, cpf from cliente;

select cpf from cliente
where cpf = '12345678901';

select * from livro
where ano_publicacao < 2000;

select * from cliente
order by nome desc;

insert into cliente(nome, cpf, telefone, email, endereco)
values ('João Silva', 11122233344, 35977777777, 'joao@email.com', 'Rua C');

select * from cliente;

update cliente
set telefone = '35911111111'
where id_cliente=1;

delete from cliente
where id_cliente = 2;

select *
from emprestimo
join cliente on emprestimo.id_cliente = cliente.id_cliente;


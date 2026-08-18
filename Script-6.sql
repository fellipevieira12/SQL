
-- =========================
-- CLIENTE
-- =========================
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(255),
    endereco VARCHAR(255)
);

-- =========================
-- AUTOR
-- =========================
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(255) NOT NULL
);

-- =========================
-- CATEGORIA
-- =========================
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL
);

-- =========================
-- LIVRO
-- (SEM autor e categoria direto)
-- =========================
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT NOT NULL
);

-- =========================
-- LIVRO_AUTOR (N:N)
-- =========================
CREATE TABLE livro_autor (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON DELETE CASCADE
);

-- =========================
-- LIVRO_CATEGORIA (N:N)
-- =========================
CREATE TABLE livro_categoria (
    id_livro INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_livro, id_categoria),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON DELETE CASCADE
);

-- =========================
-- RESERVA
-- =========================
CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE NOT NULL,
    status VARCHAR(20),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- =========================
-- LIVRO_RESERVA (N:N)
-- =========================
CREATE TABLE livro_reserva (
    id_reserva INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_reserva, id_livro),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE
);

-- =========================
-- EMPRESTIMO
-- =========================
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- =========================
-- LIVRO_EMPRESTIMO (N:N)
-- =========================
CREATE TABLE livro_emprestimo (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_emprestimo, id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo) ON DELETE CASCADE,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE
);

insert into cliente (id_cliente, nome, cpf, telefone, endereco, email)
values (001, joao, 12345678900, 35999999999, ruaarvore, joaoemailcom)

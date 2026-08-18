CREATE TABLE cliente(
    `id_cliente` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(255) NOT NULL,
    `cpf` VARCHAR(12) NOT NULL UNIQUE,
    `telefone` VARCHAR(11) NOT NULL,
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
    `status` VARCHAR(255),
    `id_cliente` INT NOT NULL
);

CREATE TABLE emprestimo (
    `id_emprestimo` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `data_emprestimo` DATE NOT NULL,
    `data_devolucao` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `id_cliente` INT NOT NULL,
    CONSTRAINT `fk_id_cliente_emprestimo` FOREIGN KEY (`id_cliente`) REFERENCES cliente (`id_cliente`)
);

CREATE TABLE livro_emprestimo (
    `id_emprestimo` INT NOT NULL,
    `id_livro` INT NOT NULL,
    CONSTRAINT `fk_id_emprestimo_livro_emprestimo` FOREIGN KEY (`id_emprestimo`) REFERENCES emprestimo (`id_emprestimo`),
    CONSTRAINT `fk_id_livro_livro_emprestimo` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`)
);

CREATE TABLE livro_categoria (
    `id_livro` INT NOT NULL,
    `id_categoria` INT NOT NULL,
    CONSTRAINT `fk_id_livro_livro_categoria` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`),
    CONSTRAINT `fk_id_categoria_livro_categoria` FOREIGN KEY (`id_categoria`) REFERENCES categoria (`id_categoria`)
);

CREATE TABLE livro_autor (
    `id_livro` INT NOT NULL,
    `id_autor` INT NOT NULL,
    CONSTRAINT `fk_id_livro_livro_autor` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`),
    CONSTRAINT `fk_id_autor_livro_autor` FOREIGN KEY (`id_autor`) REFERENCES autor (`id_autor`)
);

CREATE TABLE livro_reserva (
    `id_reserva` INT NOT NULL,
    `id_livro` INT NOT NULL,
    CONSTRAINT `fk_id_reserva_livro_reserva` FOREIGN KEY (`id_reserva`) REFERENCES reserva (`id_reserva`),
    CONSTRAINT `fk_id_livro_livro_reserva` FOREIGN KEY (`id_livro`) REFERENCES livro (`id_livro`)
);
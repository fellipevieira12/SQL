-- Criação das tabelas
-- Antes de estruturar uma consulta SQL com uso de JOIN, é preciso entender como o banco de dados foi modelado para ter noção de como as tabelas se relacionam.
create table produto (
	cod int primary key,
	nome varchar(50),
	qtde int,
	cod_categoria int,
	vlr_unitario numeric (12,2)
);

create table categoria(
	cod int primary key,
	nome varchar(20)
);

-- Inserção de categorias
insert into categoria values
	(1, 'Mercearia'),
	(2, 'Bebidas'),
	(3, 'Açougue');

update categoria
	set cod = 4
	where nome = 'Açougue';

-- Adiciona a chave estrangeira (relacionamento entre produto e categoria)
alter table produto add constraint fk_categoria
	foreign key (cod_categoria)
	references categoria (cod)
-- Apaga ou atualiza os produtos automaticamente se a categoria for alterada
	on delete cascade
	on update cascade;

-- Remove a restrição para permitir inserir produtos com categorias inexistentes
alter table produto drop constraint fk_categoria;

-- Inserção de produtos
insert into produto values
	(1, 'Arroz tipo 1 5kg', 150, 1, 22.50),
	(2, 'Feijão Carioca 2kg', 120, 1, 6.50),
	(3, 'Sabão em Pó Omo 1kg', 110, 3, 19.50),
	(4, 'Pepsi Black 2L', 340, 2, 5.99);

-- Consultas simples
select * from produto;
select * from categoria;

-- Consulta com junção de tabelas
-- O relacionamento entre tabelas proporciona a combinação de dados distintos para promover análises mais complexas usando a cláusula JOIN.
-- Esses métodos de junção são baseados na Teoria dos Conjuntos.

-- INNER JOIN: Este é o método de junção mais comum e tem a função de retornar os valores em comum de ambas as tabelas.
select p.nome as produto, c.nome as categoria
	from produto as p
	inner join categoria as c
	on p.cod_categoria = c.cod;
	
-- LEFT JOIN: Usado para retornar todos os registros da tabela à esquerda, além dos registros da tabela à direita que tem valores em comum com a tabela da esquerda.
select p.nome as produto, c.nome as categoria
	from produto as p
	left join categoria as c
	on p.cod_categoria = c.cod;

-- RIGHT JOIN: Usado para retornar todos os registros da tabela à direita, além dos registros da tabela à esquerda que tem valores em comum com a tabela da direita.
select p.nome as produto, c.nome as categoria
	from produto as p
	right join categoria as c
	on p.cod_categoria = c.cod;

select c.nome as categoria,
    	count(p.cod) as total_produtos
	from produto p
	inner join categoria c
   		on p.cod_categoria = c.cod
	group by c.nome
	order by c.nome;
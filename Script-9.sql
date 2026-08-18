create table vendas (
	nf int not null primary key,
	cod_produto int,
	nome_produto varchar(50),
	qtd_vendida int,
	vlr_desconto numeric(12,2),
	vlr_total numeric (12,2)
)

insert into vendas values
(1, 101, 'camisa', 2, 40, 260),
(2, 102, 'calça', 3, 90, 699),
(3, 103, 'jaqueta', 1, 40, 499),
(4, 104, 'sapato', 1, 30, 389)

select max(vlr_total) as "maior valor quantidade vendido"
from vendas 

select max(qtd_vendida) as "maior quantidade vendida"
from vendas 

select max(vlr_desconto) as "maior quantidade de desconto"
from vendas 



select min(vlr_total) as "valor quantidade vendido"
from vendas 

select min(qtd_vendida) as "menor quantidade vendida"
from vendas 

select min(vlr_desconto) as "menor quantidade de desconto"
from vendas 



select sum(vlr_total) as "quantidade total das vendas"
from vendas 

select sum(qtd_vendida) as "quantidade total vendida"
from vendas 

select sum(vlr_desconto) as "quantidade total de desconto"
from vendas 



select avg(vlr_total) as "valor medio das vendas"
from vendas 

select avg(qtd_vendida) as "quantidade medio vendida"
from vendas 

select avg(vlr_desconto) as "valor medio de desconto"
from vendas 


insert into vendas 
	values (5, NULL, 'camisa', 2, 40, 260)

select count(cod_produto) "contagem de linhas"
from vendas

select * from vendas

select nome_produto,
	(vlr_total / qtd_vendida) as "valor unitario"
	from vendas
	
select (sum(vlr_total)) / (sum(qtd_vendida)) as "valor medio"
	from vendas


select nome_produto,
	sum(vlr_total) as "valor total por produto",
	sum(qtd_vendida) as "quantidade total por produto",
	sum(vlr_desconto) as "valor total de desconto"
	from vendas
	group by 1

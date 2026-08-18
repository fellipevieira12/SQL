/*
 * Consulta SQL Avançado
 * Prof. Gustavo Dias
 * 2026-08-17
 * Agregação, Operações e Agrupamento
 */

create table vendas(
  nf int not null primary key,
  cod_produto int,
  nome_produto varchar(50),
  qtd_vendida int,
  vlr_desconto numeric(12,2),
  vlr_total numeric(12,2)
)

insert into vendas
  values (1,101,'camisa',2,40,260),
         (2,102,'calça',3,90,699),
         (3,103,'jaqueta',1,40,499),
         (4,104,'sapato',1,30,389)

-- Função MAX
-- Retorna o maior valor numérico em uma coluna

select max(vlr_total) as "Maior Valor Quantidade Vendido"
from vendas

select max(qtd_vendida) as "Maior Quantidade Vendida"
from vendas

select max(vlr_desconto) as "Maior Quantidade de Desconto"
from vendas

-- Função MIN
-- Retorna o menor valor numérico em uma coluna

select min(vlr_total) as "Menor Valor Quantidade Vendido"
from vendas

select min(qtd_vendida) as "Menor Quantidade Vendida"
from vendas

select min(vlr_desconto) as "Menor Quantidade de Desconto"
from vendas

-- Função SUM
-- Retorna o somatório dos valores de uma coluna

select sum(vlr_total) as "Quantidade Total das Vendas"
from vendas

select sum(qtd_vendida) as "Quantidade Total Vendida"
from vendas

select sum(vlr_desconto) as "Quantidade Total de Desconto"
from vendas

-- Função AVG
-- Retorna o cálculo da média dos valores de uma coluna

select avg(vlr_total) as "Valor Médio das Vendas"
from vendas

select avg(qtd_vendida) as "Quantidade Média Vendida"
from vendas

select avg(vlr_desconto) as "Valor Médio de Desconto"
from vendas

-- Função COUNT
-- Retorna a contagem de linhas não nulas

insert into vendas
  values (5,null,'camisa',2,40,260)

select count(cod_produto) "Contagem de Linhas"
from vendas

select * from vendas

-- Operações
-- Cálculos matemáticos simples ou complexos

select nome_produto,
  (vlr_total / qtd_vendida) as "Valor Unitário"
from vendas

select (sum(vlr_total) / sum(qtd_vendida)) as "Valor Médio"
from vendas

-- Agrupamento GROUP BY
-- Agrupa valores agregados extratificando os dados

select nome_produto,
  sum(vlr_total) as "Valor Total por Produto",
  sum(qtd_vendida) as "Quantidade Total por Produto",
  sum(vlr_desconto) as "Valor Total de Desconto"
from vendas
group by 1
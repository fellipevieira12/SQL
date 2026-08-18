create table alunos(
  id_aluno int not null default 0 comment "Id do Aluno",
  nome varchar(100) not null default 'ni' comment "Nome do Aluno",
  cidade varchar(50) not null default 'ni' comment "Cidade",
  idade int not null default 0 comment "Idade",
  status varchar(20) not null default 'ni' comment "Status"
)

create table professores(
  id_professor int not null default 0 comment "Id do professor",
  nome varchar(100) not null default 'ni' comment "Nome do professor",
  especialidade varchar(50) not null default 'ni' comment "Especialidade",
  salario decimal(10,2) not null default 0 comment "Salario"
)

create table cursos(
  id_curso int not null default 0 comment "Id do curso",
  nome_curso varchar(100) not null default 'ni' comment "Nome do curso",
  carga_horaria int not null default 0 comment "Carga horario",
  id_professor int not null default 0 comment "Id do professor"
)

create table matriculas(
  id_matricula int not null default 0 comment "Id da matricula",
  id_aluno int not null default 0 comment "Id do Aluno",
  id_curso int not null default 0 comment "Id do curso",
  data_matricula date comment "Data da matricula",
  situacao varchar(20) not null default 'ni' comment "Situação"
)

-- Chaves primárias

alter table alunos
add primary key(id_aluno)

alter table professores
add primary key(id_professor)

alter table cursos
add primary key(id_curso)

-- Chaves estrangeiras
-- Relacionamento entre cursos e professores

alter table cursos
add constraint fk_professores
foreign key(id_professor)
references professores(id_professor)
on update cascade
on delete cascade

-- Chaves estrangeiras
-- Relacionamento entre matrículas, alunos e cursos

alter table matriculas
add constraint fk_alunos
foreign key(id_aluno)
references alunos(id_aluno)
on update cascade
on delete cascade

alter table matriculas
add constraint fk_cursos
foreign key(id_curso)
references cursos(id_curso)
on update cascade
on delete cascade

-- Inserção de dados
-- Cadastro de alunos

insert into alunos(id_aluno,nome,cidade,idade,status)
  values (1,'João Silva','Pouso Alegre',18,'Ativo'),
         (2,'Maria Oliveira','Santa Rita do Sapucaí',19,'Ativo'),
         (3,'Carlos Souza','Itajubá',20,'Inativo'),
         (4,'Ana Pereira','Varginha',17,'Ativo'),
         (5,'Lucas Ferreira','Poços de Caldas',21,'Ativo'),
         (6,'Juliana Costa','Extrema',22,'Inativo'),
         (7,'Rafael Gomes','Lavras',18,'Ativo'),
         (8,'Fernanda Lima','Pouso Alegre',19,'Ativo'),
         (9,'Bruno Martins','Três Corações',20,'Ativo'),
         (10,'Camila Rocha','Passos',23,'Inativo')

-- Inserção de dados
-- Cadastro de professores

insert into professores(id_professor,nome,especialidade,salario)
  values (1,'Carlos Mendes','Matemática',4500.00),
         (2,'Fernanda Alves','História',4200.00),
         (3,'Ricardo Lima','Programação',5500.00),
         (4,'Juliana Rocha','Biologia',4700.00),
         (5,'Marcos Silva','Física',5000.00)

-- Inserção de dados
-- Cadastro de cursos

insert into cursos(id_curso,nome_curso,carga_horaria,id_professor)
  values (1,'Banco de Dados',80,3),
         (2,'Matemática Básica',160,1),
         (3,'História do Brasil',140,2),
         (4,'Biologia Geral',70,4),
         (5,'Física Aplicada',90,5),
         (6,'Programação Java',100,3)

-- Inserção de dados
-- Cadastro de matrículas

insert into matriculas(
  id_matricula,
  id_aluno,
  id_curso,
  data_matricula,
  situacao
)
  values (1,1,1,'2026-05-01','Ativa'),
         (2,2,2,'2026-05-02','Ativa'),
         (3,3,3,'2026-05-03','Concluída'),
         (4,4,4,'2026-05-04','Ativa'),
         (5,5,5,'2026-05-05','Cancelada'),
         (6,6,6,'2026-05-06','Ativa'),
         (7,7,1,'2026-05-07','Ativa'),
         (8,8,2,'2026-05-08','Concluída'),
         (9,9,3,'2026-05-09','Ativa'),
         (10,10,4,'2026-05-10','Cancelada'),
         (11,1,5,'2026-05-11','Ativa'),
         (12,2,6,'2026-05-12','Ativa'),
         (13,3,1,'2026-05-13','Concluída'),
         (14,4,2,'2026-05-14','Ativa'),
         (15,5,3,'2026-05-15','Ativa')

-- Filtro de dados
-- Alunos com status ativo

select *
from alunos
where status = 'Ativo'

-- Ordenação
-- Alunos em ordem alfabética

select *
from alunos
order by nome

-- Ordenação
-- Professores por salário decrescente

select *
from professores
order by salario desc

-- Filtro de dados
-- Cursos com carga horária superior a 100 horas

select *
from cursos
where carga_horaria > 100
order by carga_horaria desc

-- Alias
-- Exibe cidade e idade dos alunos

select cidade as cidade_aluno,
  idade as idade_aluno
from alunos

-- Filtro de dados
-- Professores com salário acima de 5000

select *
from professores
where salario > 5000

-- Operador BETWEEN
-- Alunos com idade entre 18 e 25 anos

select *
from alunos
where idade between 18 and 25

-- Operador LIKE
-- Cursos iniciados pela letra B

select *
from cursos
where nome_curso like 'B%'

-- Operador AND
-- Alunos ativos de Pouso Alegre

select *
from alunos
where status = 'Ativo'
and cidade = 'Pouso Alegre'
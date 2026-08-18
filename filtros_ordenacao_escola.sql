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

alter
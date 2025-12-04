-- data: 28/10/2025

-- dropando (excluindo) tabelas

drop table pagamentos;

drop table matriculas_treinos;

-- alterando tabela

alter table matriculas
rename column matricula to numero_matricula;

-- data: 30/10/2025
 
-- corrigindo nome tabela
alter table planos
rename column nomr to nome;

-- data: 31/10/2025

-- alterando nome tabela
alter table pagamentos
rename column data_inicio to data_pagamento;

alter table treinos_detalhes 
add codigo_treino int;

alter table treinos_detalhes
add constraint fk_treinos_detalhes_treinos
foreign key (codigo_treino) references treinos(codigo);

-- data: 10/11/2025
alter table alunos
add column numero_matricula integer;

alter table alunos
add constraint fk_alunos_matriculas
foreign key (numero_matricula) references matriculas(numero_matricula);

alter table alunos
drop foreign key fk_alunos_matriculas;

alter table alunos
drop column numero_matricula;

alter table alunos
add column codigo_plano integer;

alter table alunos
add constraint fk_alunos_planos
foreign key (codigo_plano) references planos(codigo);

alter table alunos
drop foreign key fk_alunos_planos;

alter table alunos
drop column codigo_plano;

-- 13/11/2025
alter table alunos
add column nome_plano varchar(100) not null;
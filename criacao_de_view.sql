-- data: 27/11/2025

-- create or replace view

use fitlife;

create view 
	vw_alunos_matricula as
select 
	al.nome, al.data_nascimento, mt.numero_matricula, mt.status_matricula
from 
	alunos al
inner join 
	matriculas mt on al.codigo = mt.codigo_aluno; 
    
-- select * from vw_alunos_matricula;

create view 
	vw_alunos_matricula as
select 
	al.cpf, al.nome, al.data_nascimento, mt.numero_matricula, mt.status_matricula
from 
	alunos al
inner join 
	matriculas mt on al.codigo = mt.codigo_aluno;
    
-- select * from vw_alunos_matricula;

create or replace view
	vw_alunos_matricula as
select 
	al.email, al.cpf, al.nome, al.data_nascimento, mt.numero_matricula, mt.status_matricula
from 
	alunos al
inner join 
	matriculas mt on al.codigo = mt.codigo_aluno;
    
-- select * from vw_alunos_matricula;
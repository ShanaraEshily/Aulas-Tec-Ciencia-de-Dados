-- data: 28/10/2025

select *
from alunos;

select 	
	nome, 
    codigo
from 
	alunos;

select *
from 
	alunos
where 
	codigo <= 10;

select *
from 
	alunos
where 
	codigo <= 30
order by nome;

-- na consulta, acabou priorizando a ordem alfabética à data de nascimento
select *
from 
	alunos
where 
	codigo <= 30
order by nome, data_nascimento;

select *
from 
	alunos
where 
	codigo <= 30
order by nome desc;

select *
from 
	alunos
where 
	codigo <= 30
order by nome asc;

select *
from alunos
where 
	codigo <= 30 and
    data_nascimento <= '2000-01-01'
order by nome desc;

select *
from alunos
where 
	codigo <= 30 and
    data_nascimento <= '2000-01-01' and
    data_cadastro <= '2025-05-01'
order by nome asc;

select *
from 
	alunos
where 
	codigo <= 30 or
    data_nascimento <= '2000-01-01' or
    data_cadastro <= '2025-05-01'
order by nome asc;

select *
from
	alunos
where
    year(data_nascimento) <= '2000'
order by nome asc;

select *
from 
	alunos
where
    year(data_nascimento) <= '2000' and
    month(data_nascimento) <= '02'
order by nome asc;

select *
from alunos
where
    year(data_nascimento) <= '2000' and
    month(data_nascimento) <= '02' and
    day(data_nascimento) <= '03'
order by nome asc;

-- Data: 30/10/2025

update alunos set telefone = '(91) 99811-1587'
where codigo = 87;

update alunos set email = 'alan.campos@email.com'
where codigo = 87;

update alunos set telefone = '(91) 99811-1587',
email = 'alan.campos@email.com'
where codigo = 87;

update alunos set data_cadastro = '2025-10-10'
where year(data_nascimento) = '2000';

delete from alunos
where codigo = 92;

delete from alunos
where codigo = 91 and codigo = 92;

delete from alunos
where codigo in (91, 92, 93, 94);

delete from alunos
where codigo >= 20 and codigo <= 30;

-- adicionando o campo cpf
alter table alunos
add column cpf varchar(14);

-- tabela auxiliar para atualizar os dados dos alunos
create table cpf_alunos (
	codigo integer,
    cpf varchar(14)
);

-- 1a forma de atualizar dados
update 
	alunos
set 
	cpf = (select cpf from cpf_alunos where alunos.codigo = cpf_alunos.codigo);

-- 2a forma de atualizar dados
update alunos
inner join
	cpf_alunos on alunos.codigo = cpf_alunos.codigo
set
	alunos.cpf = cpf_aluno.cpf;
    
-- remover tabela auxiliar
drop table cpf_alunos;

--  mt.numero_matricula,
--  al.nome as nome_completo,
--  pl.nome as nome_plano,
--  ins.nome as nome_instrutor
-- count(*) as qnt_alunos_contrataram
    
select 
	al.codigo, 
	al.nome,
    mt.numero_matricula
from 
	matriculas mt
inner join alunos al on al.codigo = mt.codigo_aluno;

select
    mt.numero_matricula,
    al.nome as nome_completo,
    pl.nome as nome_plano
from 
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano;
    
select
    mt.numero_matricula,
    al.nome as nome_completo,
    pl.nome as nome_plano
from 
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano 
where
	pl.nome = 'Plano Família';
    
select
    mt.numero_matricula,
    al.nome as nome_completo,
    pl.nome as nome_plano
from 
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano -- ;    
where
	pl.nome = 'Plano Família' and
    year(mt.data_inicio) = '2025' and 
    month(mt.data_inicio) = '02';
    
select
    mt.numero_matricula,
    al.nome as nome_completo,
    pl.nome as nome_plano,
    ins.nome as nome_instrutor
from 
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
where
	pl.nome = 'Plano Família' and
    year(mt.data_inicio) = '2025' and 
    month(mt.data_inicio) = '02';
    
select
    count(*) as qnt_alunos_contrataram
from 
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
where
	pl.nome = 'Plano Família' and
    year(mt.data_inicio) = '2025' and 
    month(mt.data_inicio) = '02';
    
-- data: 31/10/2025

SELECT numero_matricula FROM matriculas;

-- lista nome e plano contratado popr cada aluno
select 
	mt.numero_matricula,
    al.nome as nome_completo,
    pl.nome as nome_plano
from 
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on al.codigo = mt.codigo_plano;
  
  -- atividade query sistema fitlife
  
-- lista com nome dos instrutores, com numero de alunos
select
    ins.nome as nome_instrutor,
    count(distinct mt.numero_matricula) as total_alunos
from
	instrutores ins
inner join
	treinos tr on tr.codigo_instrutor = ins.codigo
inner join
    matriculas_treinos mt on mt.codigo_treino  = tr.codigo
group by
	ins.codigo, 
    ins.nome
order by
	total_alunos desc;
    
-- lista de pagamentos via PIX
select
	pg.metodo_pagamento,
    al.nome as nome_completo
from
	matriculas mt
inner join
	pagamentos pg on pg.numero_matricula = mt.numero_matricula
inner join
	alunos al on al.codigo = mt.codigo_aluno
where
	pg.metodo_pagamento = 'PIX';
    
-- treinos cadastrados junto com quantidade de exercícios
select
	tr.codigo as codigo_treino,
    tr.nome as nome_treino,
    count(dt.codigo) as quantidade_exercicios
from 
	treinos tr
inner join
	treinos_detalhes dt on tr.codigo = dt.codigo_treino -- data: 04/11/2025
group by
	tr.codigo, tr.nome;
    
-- lista com nome de alunos, instrutor responsável e data de início, mostrando somente as ativas
select
	mt.status_matricula,
    al.nome as nome_completo,
    ins.nome as nome_instrutor,
    mt.data_inicio as data_inicio
from
	matriculas mt
inner join
	alunos al on al.codigo = mt.codigo_aluno
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
where
	mt.status_matricula = 'TRUE';
    
-- cálculo de total pago por cada aluno
select
	pg.codigo,
    al.nome as nome_completo,
    count(pg.valor_pago) as total_pago
from
	pagamentos pg
inner join
	alunos al on al.codigo = pg.codigo_aluno
group by
	pg.codigo, pg.nome;
    
select 
      al.nome,
      pl.nome,
      mt.numero_matricula,
      al.cpf,
      al.data_nascimento
from 
	matriculas mt 
inner join 
	alunos al on mt.codigo_aluno = al.codigo
inner join 
	planos pl on mt.codigo_plano = pl.codigo;

-- data: 10/11/2025

select 
	upper(al.nome), 
	mt.numero_matricula, 
    pl.nome 
from matriculas mt 
inner join alunos al on mt.codigo_aluno = al.codigo 
inner join planos pl on mt.codigo_plano = pl.codigo;

select 
	al.nome,
	mt.numero_matricula
from
	matriculas mt
inner join
	alunos al on mt.codigo_aluno = al.codigo;
    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join
	alunos al on mt.codigo_aluno = al.codigo
inner join  
	planos pl on mt.codigo_plano = pl.codigo;

-- 11/11/2025
select
	pl.nome,
    pl.valor_mensal as valor_mensal,
    pl.duracao_meses as duracao_meses
from
	planos pl
order by
	nome;
    
show columns from planos;

select 
      al.nome,
      pl.nome,
      mt.numero_matricula,
      al.cpf,
      al.data_nascimento
from 
	matriculas mt
inner join 
	alunos al on mt.codigo_aluno = al.codigo
inner join 
	planos pl on mt.codigo_plano = pl.codigo;
    
-- 13/11/2025
SELECT codigo_treino, COUNT(numero_matricula) AS total_matriculas
FROM matriculas_treinos
GROUP BY codigo_treino
ORDER BY codigo_treino;

UPDATE alunos al
INNER JOIN matriculas mt ON mt.codigo_aluno = al.codigo
INNER JOIN planos pl ON mt.codigo_plano = pl.codigo
SET 
    al.numero_matricula = mt.numero_matricula,
    al.nome_plano = pl.nome
WHERE al.numero_matricula IS NULL;

UPDATE alunos al
JOIN planos pl ON pl.codigo = al.codigo
SET al.codigo_plano = pl.codigo;

-- teste q não deu certo
UPDATE alunos al
JOIN planos pl ON al.codigo_plano = pl.codigo
SET al.nome_plano = pl.nome;

UPDATE alunos
SET codigo_plano = ((codigo - 1) % 12) + 1
WHERE codigo_plano IS NULL;

update matriculas_treinos
set;

SELECT	 
  codigo_treino, 
  COUNT(numero_matricula) AS total_matriculas 
FROM matriculas_treinos 
GROUP BY codigo_treino 
ORDER BY codigo_treino;
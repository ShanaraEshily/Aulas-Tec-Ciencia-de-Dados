-- Data: 05/11/2025

use fitlife;

-- forma errada de se fazer uma querry ()
select
	alunos.nome as nome_alunos,
    planos.nome as nome_planos
from
	alunos
cross join
	planos;

-- forma correta e mais prática
select
	al.nome,
    pl.nome
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano;

-- questão 1    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano;

-- juntou todos os nomes que comecem com a letra A    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
where
	al.nome like 'A%';
    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
order by
	al.nome asc;

-- traz os nomes iniciados com a letra A de forma alfabética    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
where
	al.nome like 'A%'
order by
	al.nome asc;
    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
where
	al.nome like 'A%' and al.nome like 'B%'
order by
	al.nome asc;
    
select
	al.nome as nome_aluno,
    pl.nome as nome_plano
from
	matriculas mt
inner join 
	alunos al on al.codigo = mt.codigo_aluno
inner join
	planos pl on pl.codigo = mt.codigo_plano
where
	al.nome like 'A%' and pl.nome like 'Plano ouro'
order by
	al.nome asc;
    
select
	ins.nome as nome_instrutor,
    count(m.codigo_aluno) as total_alunos
from
	instrutores ins
left join
	matriculas m on ins.codigo = codigo_instrutor
group by
	ins.codigo, ins.nome
order by
	total_alunos desc;

-- forma errada, não tem a agregação
select
	ins.nome,
    count(mt.codigo_aluno)
from
	matriculas mt
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
inner join
	alunos al on al.codigo = mt.codigo_aluno;
    
select
	ins.nome,
    count(mt.codigo_aluno) as quantidade_alunos
from
	matriculas mt
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
inner join
	alunos al on al.codigo = mt.codigo_aluno
group by 
	ins.nome;
    
select
	max(mt.numero_matricula)
from 
	matriculas mt
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor;

select
	min(mt.numero_matricula)
from 
	matriculas mt
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor;

-- questão 2    
select
	ins.nome,
    count(mt.numero_matricula) as quantidade_alunos
from 
	matriculas mt
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
group by
	ins.nome;
    
select
	ins.nome,
    count(mt.numero_matricula) as quantidade_alunos
from 
	matriculas mt
inner join
	instrutores ins on ins.codigo = mt.codigo_instrutor
where
	year(mt.data_inicio) = '2025' and month(mt.data_inicio) = '02'
group by
	ins.nome;

-- questão 3
select
	al.nome,
    pg.metodo_pagamento
from
	matriculas mt
inner join
	alunos al on al.codigo = mt.codigo_aluno
inner join
	pagamentos pg on pg.numero_matricula = mt.numero_matricula
where
	pg.metodo_pagamento = 'PIX';
    
select
	al.nome,
    pg.metodo_pagamento
from
	matriculas mt
inner join
	alunos al on al.codigo = mt.codigo_aluno
inner join
	pagamentos pg on pg.numero_matricula = mt.numero_matricula
where
	pg.metodo_pagamento like 'PIX';
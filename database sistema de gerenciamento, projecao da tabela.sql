-- Data: 22/10/2025

-- projeção da tabela Eventos
-- consulta básica
select * from
eventos;

select * from
locais;

select codigo, nome, data_inicio, data_termino, tipo_evento
from eventos;

select * from
locais;

-- filtrar dados em uma consulta
select codigo, nome
from eventos
where
codigo = 1;

select codigo, nome
from eventos
where
codigo = 8 or nome = 'evento de culinária';

-- projeção que realiza JOIN entre as tabelas
select eventos.nome, eventos.tipo_evento, locais.nome, locais.capacidade_total
from eventos
inner join eventos_locais on eventos.codigo = codigo_evento
inner join locais on local_codigo = locais.codigo;
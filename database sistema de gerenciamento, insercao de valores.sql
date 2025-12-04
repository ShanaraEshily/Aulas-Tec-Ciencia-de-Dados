-- Data: 21/10/2025
use eventos_culturais;

-- TABELA EVENTOS

-- insere valores
insert into eventos(nome, data_inicio, data_termino, tipo_evento) 
values('evento de TI', '2025-10-21', '2025-10-25', 'tecnologia');

insert into eventos(nome, data_inicio, data_termino, tipo_evento)
values('animação.com', '2026-02-11', '2026-03-01', 'convenção');

insert into eventos(nome, data_inicio, data_termino, tipo_evento)
values('Tech Summit 2024', '2024-03-10', '2024-03-12', 'Conferência'),
('Festival de Cinema Independente', '2024-05-20', '2024-05-25', 'Festival'),
('Feira de Inovação Agrícola', '2024-08-01', '2024-08-03', 'Feira'),
('Maratona de Programação', '2024-06-15', '2024-06-16', 'Competição'),
('Encontro Nacional de Startups', '2024-04-05', '2024-04-07', 'Encontro'),
('Exposição de Arte Contemporânea', '2024-09-10', '2024-09-15', 'Exposição'),
('Simpósio Internacional de Sustentabilidade', '2024-10-01', '2024-10-04', 'Simpósio'),
('Workshop de Design de Interação', '2024-07-18', '2024-07-19', 'Workshop'),
('Mesa Redonda sobre Inteligência Artificial', '2024-11-22', '2024-11-28', 'Mesa Redonda'),
('Palestra: Futuro da Energia Renovável', '2024-12-03', '2024-12-07', 'Palestra');

-- insere valores DEFAULT
insert into eventos (nome, data_termino)
values ('evento de culinaria', '2025-10-30');

-- esta inserção de dados está incorreta data_termino < data_inicio
insert into eventos(nome, data_inicio, data_termino, tipo_evento)
values('evento de automoveis', '2025-10-21', '2025-10-10', 'automoveis');

-- TABELA LOCAIS

-- inserção de local
insert into locais(nome, capacidade_total, endereco_completo, tipo_local)
values('teatro SENAC', 400, 'Brasília DF, Numero 1234', 'teatro');

insert into locais(nome, capacidade_total, endereco_completo, tipo_local)
values('animação.com', 300, 'Manaus AM, Rua dos Coqueiros', 'museu');

-- inserção com valor DEFAULT para tipo_local
insert into locais (nome, capacidade_total, endereco_completo)
values('centro de conveções', 1000, 'Brasília DF, Setor Central');

-- tentativa de inserir com valor NULL
insert into locais (nome, capacidade_total, endereco_completo)
values (null, 200, 'Brasília DF, Setor Central');

insert into locais (nome, capacidade_total, endereco_completo)
values ('teatro de artes', null, 'Brasília DF, Setor Central');

-- RELACIONAMENTO ENTRE EVENTO E LOCAL

insert into eventos_locais (codigo_evento, codigo_local)
values(1,1);

insert into eventos_locais (codigo_evento, codigo_local)
values(2,2);

insert into eventos_locais (codigo_evento, codigo_local)
values(3,3);

-- integridade referencial - chave estrangeira não existe
insert into eventos_locais (codigo_evento, codigo_local)
values (3,1);

-- exemplo de consulta de Eventos e Locais
select evt.nome, evt.data_inicio, l.nome as nome_local, l.capacidade_total as capacidade_local, l.endereco_completo from
eventos evt
inner join eventos_locais evtl on evt.codigo = evtl.codigo_evento
inner join locais l on l.codigo = evtl.codigo_local;
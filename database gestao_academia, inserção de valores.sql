-- Data: 24/10/2025

use gestao_academia;

-- TABELA ALUNO

insert into matricula (data_inicio, status_matricula)
values('2025-10-24', 'Ativa'),
('2025-09-10', 'Ativa'),
('2025-08-05', 'Ativa'),
('2025-07-20', 'Inativa'),
('2025-06-15', 'Ativa');

insert into aluno(nome, data_nascimento, telefone, email, data_cadastro, matricula)
values ('Mariana Silva', '2005-08-12', '(11) 98845-2301', 'mariana.silva@email.com', '2025-10-24', 1),
('Lucas Almeida', '2008-03-27', '(11) 97584-9932', 'lucas.almeida@email.com', '2025-10-24', 2),
('Beatriz Souza', '2006-11-05', '(21) 98214-7610', 'beatriz.souza@email.com', '2025-10-24', 3),
('João Pedro Santos', '2007-06-19', '(31) 98765-4210', 'joao.pedro@email.com', '2025-10-24', 4),
('Ana Carolina Lima', '2004-09-02', '(41) 99658-3774', 'ana.lima@email.com', '2025-10-24', 5);

insert into instrutor (nome, especialidade, salario)
values ('Paulo Andrade', 'Musculação', 3500.00),
('Fernanda Costa', 'Pilates', 4200.50),
('Ricardo Lima', 'Natação', 3800.00),
('Juliana Martins', 'Crossfit', 4000.00),
('Camila Souza', 'Alongamento', 3200.00);

select id_aluno, nome, matricula from aluno;

insert into planos (nome, tipo_servico, valor_mensal, duracao, id_aluno, id_instrutor)
values('Plano Fitness', 'Musculação', 149.90, 3, 1, 1),
('Plano Premium', 'Musculação e Pilates', 249.90, 6, 2, 2),
('Plano Aqua', 'Natação', 199.90, 4, 3, 3),
('Plano Cross', 'Crossfit', 229.90, 6, 4, 4),
('Plano Essencial', 'Alongamento e Funcional', 129.90, 2, 5, 5);

insert into pagamento(valor_pago, data_pagamento, metodo_pagamento, id_matricula)
values(149.90, '2025-10-24', 'Cartão de Crédito', 1),
(249.90, '2025-10-24', 'Pix', 2),
(199.90, '2025-10-24', 'Dinheiro', 3),
(229.90, '2025-10-24', 'Cartão de Débito', 4),
(129.90, '2025-10-24', 'Pix', 5);

insert into treino (nome, data_criacao, id_matricula, id_instrutor)
values ('Treino de Musculação', '2025-10-24', 1, 1),
('Treino de Pilates', '2025-10-24', 2, 2),
('Treino de Natação', '2025-10-24', 3, 3),
('Treino de Crossfit', '2025-10-24', 4, 4),
('Treino Funcional', '2025-10-24', 5, 5);

insert into treino_detalhe (nome, numero_serie, repeticao, carga_utilizada, id_treino)
values('Supino Reto', 'Série 1', 12, '30kg', 1),
('Supino Reto', 'Série 2', 10, '35kg', 1),
('Agachamento', 'Série 2', 12, '50kg', 2),
('Remada Curvada', 'Série 2', 8, '30kg', 3),
('Flexão de Braço', 'Série 1', 15, 'Sem carga', 4),
('Abdominal', 'Série 1', 20, 'Sem carga', 5);

SELECT 
    a.nome AS nome_aluno,
    a.matricula AS id_matricula,
    p.nome AS plano_contratado,
    p.tipo_servico,
    p.valor_mensal
FROM aluno a
JOIN planos p ON a.id_aluno = p.id_aluno
JOIN matricula m ON a.matricula = m.id_matricula;

SELECT 
    i.nome AS nome_instrutor,
    a.nome AS nome_aluno
FROM instrutor i
JOIN planos p ON i.id_instrutor = p.id_instrutor
JOIN aluno a ON p.id_aluno = a.id_aluno
ORDER BY i.nome;

SELECT 
    valor_pago,
    data_pagamento,
    metodo_pagamento
FROM pagamento
WHERE valor_pago > 100;

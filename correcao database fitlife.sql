-- Data: 28/10/2025

create database fitlife; -- correção atividade

use fitlife;

create table alunos (
	codigo integer auto_increment primary key,
    nome varchar(100) not null,
    data_nascimento date not null,
    telefone varchar(150) not null,
    email varchar(50) not null unique,
    data_cadastro date not null,
    nome_plano varchar(100) not null
);

create table instrutores (
	codigo integer auto_increment primary key,
    nome varchar(100)  not null,
	especialidade varchar(100) not null,
    salario decimal(10,2) not null
);

create table planos (
	codigo integer auto_increment primary key,
    nome varchar(200) not null,
    valor_mensal decimal(10,2) not null,
    duracao_meses integer not null
);

create table matriculas (
	numero_matricula integer auto_increment primary key,
    data_inicio date not null,
    status_matricula boolean default(true),
    codigo_aluno integer,
    codigo_instrutor integer,
    codigo_plano integer,
    
    foreign key (codigo_aluno) references alunos(codigo),
    foreign key (codigo_instrutor) references instrutores(codigo),
    foreign key (codigo_plano) references planos(codigo)
);

create table pagamentos (
	codigo integer auto_increment primary key,
    valor_pago decimal(10,2) not null,
    data_pagamento date not null,
    metodo_pagamento varchar(50) not null,
    numero_matricula integer,
    
    foreign key (numero_matricula) references matriculas(numero_matricula)
);

create table treinos (
	codigo integer auto_increment primary key,
    nome varchar(100) not null,
    data_criacao date not null,
    codigo_instrutor integer,
    
    foreign key (codigo_instrutor) references instrutores(codigo)
);

create table matriculas_treinos (
	codigo integer auto_increment primary key,
	numero_matricula integer,     
	codigo_treino integer,
			
	foreign key (numero_matricula) references matriculas(numero_matricula),
	foreign key (codigo_treino) references treinos(codigo)
);

create table treinos_detalhes (
	codigo integer auto_increment primary key,
    nome_exercicio varchar(100) not null,
    numero_serie integer not null,
    repeticoes integer not null,
    carga_utilizada float not null,
    codigo_treino integer,
    
    foreign key (codigo_treino) references treinos(codigo)
);
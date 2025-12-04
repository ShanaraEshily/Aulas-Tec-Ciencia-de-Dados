-- Data: 24/10/2025

create database gestao_academia;

use gestao_academia;

create table aluno (
	id_aluno integer auto_increment primary key, 
    nome varchar (200) not null,
    data_nascimento date not null,
    telefone varchar (100) not null,
    email varchar (100) not null,
    data_cadastro date not null,
    matricula integer,
    
    foreign key (matricula) references matricula(id_matricula)
);
    
create table instrutor (
	id_instrutor integer auto_increment primary key,
    nome varchar (150) not null,
    especialidade varchar (150) not null,
    salario float not null);
    
create table planos (
	id_planos integer auto_increment primary key,
    nome varchar (100) not null,
    tipo_servico varchar (200) not null,
    valor_mensal float not null,
    duracao varchar (200) default "Não informado",
    matricula_aluno integer,
    
    foreign key (matricula_aluno) references aluno(id_aluno),
    foreign key (matricula_aluno) references matricula(id_matricula)
);

create table matricula (
	id_matricula integer auto_increment primary key,
    data_inicio date,
    status_matricula varchar (200) not null
);

create table pagamento (
	id_pagamento integer auto_increment primary key,
    valor_pago float not null,
    data_pagamento date not null,
    metodo_pagamento varchar (150) not null,
    matricula_aluno integer,
    
    foreign key (matricula_aluno) references matricula(id_matricula)
);

create table treino (
	id_treino integer auto_increment primary key,
    nome varchar(100) not null,
    data_criacao date not null,
    matricula_aluno integer,
    
    foreign key (matricula_aluno) references matricula(id_matricula)
);

create table treino_detalhe (
	id_treino_detalhe integer auto_increment primary key,
    nome varchar (200) not null,
    numero_serie varchar (200) not null,
    repeticao float not null,
    carga_utilizada varchar (200) default "Não informado",
    treino_aluno integer,

	foreign key (treino_aluno) references treino(id_treino) 
);

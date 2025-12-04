-- Data: 24/11/2025

create database loja_virtual;

use loja_virtual;

create table clientes(
	codigo integer auto_increment primary key,
    nome varchar (100),
    cidade varchar (50),
    idade integer
);
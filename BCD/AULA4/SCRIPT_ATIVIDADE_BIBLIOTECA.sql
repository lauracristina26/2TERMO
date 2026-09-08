-- COMANDOS PARA CRIAR BANCO DE DADOS
CREATE DATABASE BIBLIOTECA_LAURACRISTINA;

CREATE DATABASE BIBLIOTECA_LAURACRISTINA2;

-- COMANDOS PARA APAGAR BANCO DE DADOS
DROP DATABASE BIBLIOTECA_LAURACRISTINA2;

-- COMANDOS PARA ATIVAR BANCO DE DADOS
USE BIBLIOTECA_LAURACRISTINA;

-- MOSTRAR TABELAS NO BANCO DE DADOS
SHOW TABLES;

-- COMANDO PARA CRIAR TABELAS
CREATE TABLE Leitores(
ID_Leitores INT auto_increment primary key,
Nome varchar(60) not null, 
Telefone INT,
CPF varchar(40) not null,
Email varchar(40) not null,
Historico datetime
);

CREATE TABLE Pedidos(
ID_Pedidos INT auto_increment primary key,
Código INT not null,
Valor_Calculado Decimal(5,2),
Forma_Pagamento varchar(60) not null,
Identificacao_Leitor varchar(40) not null,
Identificacao_Livro INT not null
);

CREATE TABLE Estoque(
ID_Estoque INT auto_increment primary key,
Quantidade_Livos INT not null,
Editoras varchar(14) not null,
Localizacao char(14) not null,
Autores varchar(20) not null,
Organizacao varchar(20) not null
);

-- COMANDO PARA ALTERAR INFORMAÇÕES
ALTER TABLE Leitores ADD Localizacao varchar(15);

-- ALTERAR O TIPO DE DADOS E TAMANHO DO ATRIBUTO
ALTER TABLE Leitores MODIFY Telefone varchar(15);

-- RENOMAR O NOME DO ATRIBUTO
-- ALTER TABLE Leitores CHANGE Telefone Celular(15);

-- RENOMEAR TABELAS
ALTER TABLE Leitores RENAME TO Leitor;

-- EXCLUIR ATRIBUTO
ALTER TABLE Leitores DROP COLUMN Telefone;

-- LIMPAR DADOS DA TABELA
TRUNCATE TABLE Leitores;
-- Active: 1794917650052@@127.0.0.1@3306@recuperativa_retrogame_lauracristina
DROP DATABASE recuperativa_retrogame_lauracristina;
-- Criação do Banco de Dados 
CREATE DATABASE IF NOT EXISTS recuperativa_retrogame_lauracristina;
USE recuperativa_retrogame_lauracristina;

-- Fase 1: DDL
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT PK_id_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_email UNIQUE (email)
);

CREATE TABLE plataforma (
    id_plataforma INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE,
    id_jogo INT NOT NULL,

    CONSTRAINT PK_id_plataforma PRIMARY KEY (id_plataforma),
    CONSTRAINT UQ_nome UNIQUE (nome),
    CONSTRAINT FK_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    CONSTRAINT FK_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT PK_id_categoria PRIMARY KEY (id_categoria),
    CONSTRAINT UQ_descricao UNIQUE (descricao),
    CONSTRAINT FK_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    CONSTRAINT FK_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);

CREATE TABLE jogo (
    id_jogo INT AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT PK_id_jogo PRIMARY KEY (id_jogo),
    CONSTRAINT UQ_codigo UNIQUE (codigo),
    CONSTRAINT FK_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    CONSTRAINT FK_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE locacao (
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'ABERTA' CHECK (status_locacao in ('ABERTA', 'DEVOLVIDA', 'ATRASADA')), 
    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,

    CONSTRAINT PK_id_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT FK_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);

SELECT * FROM categoria;
ALTER TABLE jogo ADD desenvolvedora VARCHAR(100);

-- Fase 2: DML
INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES 
('Laura', 'laurad@gmail.com', '123456798', TRUE),
('Cassandra', 'cassandrfa@gmail.com', '21434723', TRUE),
('Isabeli', 'isabelii@gmail.com', 'NULL', TRUE),
('Michael', 'michaell@gmail.com', '123483274', TRUE);

INSERT INTO plataforma (NOME, ID_JOGO) VALUES
('PlaySctiion', 1),
('XBoxxx', 2);

INSERT INTO categoria (descricao) VALUES
('Terrror'),
('Aventuraa');

INSERT INTO jogo (TITULO, CODIGO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL, id_plataforma, id_categoria) VALUES
('Call of Duty: Modern Warfare', '8410', 2016, 65, 6, 1),
('Devil May Cry 4', '3232', 2019, 23, 5, 2),
('GTA 3', '34334', 2016, 78, 4, 3),
('The Last Of Us', '83230', 2017, 45, 3, 4),
('God Of War: Ragnarok', '2323', 2022, 78, 2, 5),
('Call of Duty: Modern Warfare 4', '2310', 2026, 80, 1, 6);

SELECT * FROM cliente;
UPDATE cliente
SET TELEFONE = '00000'
WHERE id_cliente = 2;

UPDATE jogo
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ano_lancamento >= 2000;
SELECT * FROM jogo;

INSERT INTO cliente (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('sophieTEMPORARIO', 'sophieTEMPORARIO@GMAIL.COM', NULL, TRUE);
SELECT * FROM cliente;
DELETE FROM cliente
WHERE id_cliente = 5; -- A chave estrangeira está restringindo

-- Fase 3: DML
SELECT TITULO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL
FROM cliente;

SELECT * FROM jogo
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;

SELECT TITULO FROM JOGO
WHERE TITULO LIKE '%LAST%';

SELECT ANO_LANCAMENTO FROM JOGO 
WHERE ANO_LANCAMENTO BETWEEN 1990 AND 2005;

SELECT COUNT(*) AS Total_Quantidade
FROM JOGO;
SELECT AVG(quantidade_disponivel) AS quantidade_media
FROM JOGO;
SELECT MAX(quantidade_disponivel) AS quantidade_maxima
FROM JOGO;
SELECT MIN(quantidade_disponivel) AS quantidade_minima
FROM JOGO;

SELECT 

SELECT c.nome, l.id_locacao
FROM cliente AS c
LEFT JOIN locacao AS l
ON c.id_cliente = l.id_locacao
ORDER BY c.nome;

-- Fase 4: TCL
-- Transação de locação
START TRANSACTION;
UPDATE locacao
SET data_prevista = '2026-09-24'
WHERE id_locacao = 1;
SELECT * FROM locacao WHERE id_locacao = 1;
COMMIT;

-- ROLLLBACK
START TRANSACTION;
UPDATE jogo
SET quantidade_disponivel = 25
WHERE id_jogo = 43;
SELECT * FROM jogo;
ROLLBACK;

-- SAVEPOINT
START TRANSACTION;
UPDATE jogo
SET quantidade_disponivel = 34
WHERE id_jogo = 24;
UPDATE jogo
SET quantidade_disponivel = 54
WHERE id_jogo = 19;

SAVEPOINT Resjutes_estoque;

-- Transação de devolução
SELECT status_locacao FROM locacao;
START TRANSACTION;
UPDATE locacao
SET status_locacao = 'DEVOLVIDO'
WHERE id_locacao = 1;
COMMIT

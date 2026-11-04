-- Active: 1788267989003@@127.0.0.1@3306@biblioteca_som2_lauracristina

-- Fase 1: Criação e Estruturas

-- 1. Criação do banco
CREATE DATABASE biblioteca_som2_lauracristina;
USE biblioteca_som2_lauracristina;
DROP DATABASE biblioteca_som2_lauracristina;
-- Criação das tabelas
CREATE TABLE USUARIO (
    id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE LIVRO (
    id_livro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(120) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    CONSTRAINT CK_LIVRO CHECK (quantidade_disponivel >= 0)
);

CREATE TABLE EMPRESTIMO (
    id_emprestimo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20),
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_usuario, id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES EMPRESTIMO(id_emprestimo),
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    CONSTRAINT CK_EMPRESTIMO_STATUS CHECK (status_emprestimo >= 0)
);

CREATE TABLE AUTORES (
    id_autores INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_autores VARCHAR(120) NOT NULL,
    nacionalidade VARCHAR(120),
    email_autores VARCHAR(120) NOT NULL UNIQUE,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE CATEGORIA (
    id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(120) NOT NULL
);

-- SELECT * FROM usuario;
ALTER TABLE LIVRO ADD editora VARCHAR(100);

-- Fase 2: Manipulação de dados
-- 6. insert de usuario

INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Laura Cristina', 'lauracristina@gmail.com', '1999990926002', TRUE),
('Livia Rodrigues', 'liviarodrigues@gmail.com', '199999030452', TRUE),
('Felipe Silva', 'felipesilva@gmail.com', NULL , TRUE),
('Taylor Swift', 'taylorswift@gmail.com', '1999990131313', TRUE);

-- 7. Inserts de livro
INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES
('O Principe Cruel', 'Holly Black', '97885013', '2019', '12'),
('A Cidade da Lua Cresente', 'Sarah J Mass', '97119599', '2019', '10'),
('A Dança dos Dragões', 'George RR Martin', '91117753', '2011', '3'),
('A Guerra da Papoula', 'RF Kuang', '973325553', '2019', '13'),
('A Rainha do Nada', 'Holly Black', '97115553', '2022', '12'),
('Percy Jackson e o ladrão de raio', 'Rick Riordan', '974355553', '2005', '14');

-- 8. inserts de emprestimos
INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES
('2026-08-26', '2026-09-02', NULL, 'ABERTO'),
('2026-08-26', '2026-09-02', NULL, 'ABERTO'),
('2026-08-26', '2026-09-02', NULL, 'ABERTO');

-- 9. update
SELECT * FROM usuario

UPDATE usuario
SET telefone  = '19998202602'
WHERE id_usuario = 3;

-- 10. atualização de lote
SELECT * FROM livro

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES
('A Viuva de Ferro', 'Xiran Jay Zhao', '1873272', '2021', '8'),
('O Calice Dos Deuses', 'Rick Riordan', '1776726', '2023', '4');

-- DELETE
-- Crie e exclua um usuário sem empréstimos. Depois tente excluir um usuário que possua empréstimo e explique o resultado.
INSERT INTO usuario (nome, email, telefone, ativo) VALUES
('Anne Hatway', 'annehatway@gmail.com', '199998202', TRUE);

DELETE FROM usuario
WHERE id_usuario = 37;

-- Fase 3: Consultas e Analise
-- 12. SELECT basico
-- Liste título, autor e quantidade disponível de todos os livros.
SELECT * FROM livro;

-- 13. where + onder by
-- Liste livros com quantidade maior que 2, do maior para o menor estoque.
SELECT titulo, quantidade_disponivel
FROM livro
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel ASC;

-- 14. like
-- Pesquise livros cujo título contenha uma palavra escolhida por você.
SELECT titulo  
FROM livro 
WHERE titulo LIKE '%guerra%';

-- 15. BETWEEN
-- Liste livros publicados entre 2015 e 2025.
SELECT titulo, ano_publicacao
FROM livro
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16. Funções Agregadas
-- Mostre COUNT, SUM, AVG, MIN e MAX sobre a quantidade disponível.
SELECT COUNT(*) AS Total_Quantidade
FROM livro;

SELECT AVG(quantidade_disponivel) AS quantidade_media
FROM livro;

SELECT MAX(quantidade_disponivel) AS quantidade_maxima
FROM livro;

SELECT MIN(quantidade_disponivel) AS quantidade_minima
FROM livro;

-- 17. INNER JOIN
-- Liste ID do empréstimo, usuário, livro, data e status.

-- 18: WHERE + JOIN
-- Mostre apenas os empréstimos ABERTOS.

-- 19: GROUP BY
-- Mostre cada usuário e sua quantidade de empréstimos, do maior para o menor.

-- 20: LEFT JOIN
-- Liste todos os usuários, inclusive os que nunca fizeram empréstimo, com a quantidade de empréstimos de cada um.
SELECT U.nome, E.id_emprestimo
FROM usuario AS U
LEFT JOIN emprestimo AS E
ON U.id_usuario = E.id_emprestimo
ORDER BY U.nome;

-- Fase 4: TCL, TRANSAÇÕES E INTEGRIDADE
-- 21. Transação de empréstimo
-- START TRANSACTION; registre novo empréstimo; reduza o estoque em 1; consulte para conferir; finalize com COMMIT.
START TRANSACTION;
UPDATE emprestimo 
SET data_emprestimo = '2026-09-24'
WHERE id_emprestimo = 1;
SELECT * FROM emprestimo WHERE id_emprestimo = 1;
COMMIT;

-- 22. ROLLBACK
-- Altere propositalmente a quantidade de um livro dentro de uma transação, consulte, execute ROLLBACK e comprove o retorno do valor anterior.
START TRANSACTION;
UPDATE livro
SET quantidade_disponivel = 25
WHERE id_livro = 23;
SELECT * FROM livro;
ROLLBACK;

-- 23. SAVEPOINT
-- Faça duas alterações em livros diferentes; após a primeira, crie um SAVEPOINT. Desfaça apenas a segunda e confirme a primeira.
START TRANSACTION;
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 4
WHERE id_livro = 24;
SAVEPOINT Reajuste_Livros;
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 5
WHERE id_livro = 19;

RELEASE TO SAVEPOINT Reajuste_Livros;
COMMIT;
SELECT * FROM livro;


-- 24. Transição de devolução 
-- Localize empréstimo ABERTO, marque DEVOLVIDO, registre data de devolução, aumente estoque em 1 e execute COMMIT.
SELECT status_emprestimo FROM emprestimo;
START TRANSACTION;
UPDATE emprestimo
SET status_emprestimo = 'DEVOLVIDO'
WHERE id_emprestimo = 1;
SELECT * FROM emprestimo WHERE id_emprestimo + 1;
COMMIT

-- 8. Desafio Final
-- 25. Análise técnica
-- Para cada situação abaixo, identifique o mecanismo mais adequado entre constraint, integridade referencial, transação ou regra da aplicação, e justifique tecnicamente sua escolha.

-- Cadastrar dois usuários com o mesmo e-mail. É uma integridade referencial e constraint, pois a situação descrita dá erro, pois não seria possivel pois é definido anteriomento como UNIQUE (que é uma constraint). OU seja, o email dos usuários DEVEM ser unicos, e se dois ou mais usuários tentarem cadastrar com o mesmo e-mail vai dar erro para preservar a organização e regras definidas no banco de dados. 

-- Cadastrar dois livros com o mesmo ISBN. É uma integridade referencial e constraint, pois a situação descrita dá erro, pois não seria possivel pois é definido anteriomento como UNIQUE (que é uma constraint). OU seja, o email dos usuários DEVEM ser unicos, e se dois ou mais usuários tentarem cadastrar com o mesmo e-mail vai dar erro para preservar a organização e regras definidas no banco de dados. 

-- Permitir quantidade disponível negativa. É uma regra de aplicação, pois tem uma rega definida sobre a quantidade que está disponível, que no caso é negativa.

-- Criar empréstimo para usuário inexistente. É uma integridade referencial, pois ao fazer isso, vai houver o reconhecimento que é um usuário inexistente, e vai dar erro pois não consegue achar o caminho que necessita fazer para criar o empréstimo.

-- Excluir livro com histórico de empréstimos. É uma transação, pois vai ser excluido um livro de forma consciente, e se deletado definitivamente vai ser um commit, porém há a possibilidade de ser deltado temporariamente utilizando savepoint/realease. 

-- Gravar empréstimo e falhar na redução do estoque. 

-- Emprestar livro cuja quantidade disponível seja zero. 
-- Active: 1788267989003@@127.0.0.1@3306@smartcoffe_dml_lauracristina
-- Revisão de DML - Aula 08

-- REVISAO DE INSERT5 / O INSERT SERVE PARA INSERIR INFORMAÇÕES NO BCD
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Kauan R','kauan@email.com','1999999900','Limeira', TRUE),
('Laura C', 'laura@email.com', '1999999901', 'Limeira', TRUE),
('Laura N', 'lauran@email.com', '1999999902', 'Limeira', TRUE),
('Laura R', 'laurar@email.com', '1999999903', 'Limeira', TRUE),
('Leonardo B', 'leonardob@email.com', '1999999904', 'Limeira', TRUE),
('Leonardo BT', 'leonardobt@email.com', '1999999905', 'Americana', TRUE),
('Lídia M', 'lidia@email.com', '1999999906', 'Belem', TRUE),
('Livia V', 'livia@email.com', NULL, 'Limeira', TRUE),
('Marcos V', 'marcos@email.com', '1999999907', 'Campo Mourão', TRUE),
('Nicolas N', 'nicolasn@email.com', '1999999908', '', FALSE),
('Nicolas F', 'nicolasf@email.com', '1999999909', 'Campinas', TRUE),
('Pablo H', 'pablo@email.com', '1999999910', 'Indaiatuba', TRUE),
('Sophie A', 'sophie@email.com', '1999999911', 'Campinas', TRUE),
('Vinicius H', 'vinicius@email.com', NULL, 'Limeira', TRUE),
('Vitoria S', 'vitoria@email.com', '1999999912', 'Limeira', TRUE),
('Virginia S', 'virginia@email.com', NULL, 'Boston', TRUE);

INSERT INTO categoria (nome_categoria) VALUES
('Combos Especiais'), ('Nutella');

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO',0.00,1);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO',0.00,24);

SET @pedido = LAST_INSERT_ID(); --Sempre que for inserir um valor novo ele vai ser inserido apartir do ultimo 

SELECT @pedido;
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Nutella');

----------------------------------------------------------------

-- ATUALIZANDO DADOS NO BD
UPDATE cliente -- qual tabela quer atualizar
SET telefone = '199999988801' -- o que vai ser atualizado
WHERE id_cliente = 5; -- o codigo do que vai ser atualizado

UPDATE cliente
SET telefone = '1999777701',
    cidade = 'Piracicaba',
    ativo = FALSE
WHERE id_cliente = 5;

------- TOMAR MUITO CUIDADO --- NÃO ESQUECER :( ---- DE COLOCAR O WHERE PARA TODOS OS UPDATE
UPDATE cliente
SET ativo = FALSE; 

UPDATE pedido
SET valor_total = 1.00;

----------------------------------------------------------------------

-- DICAS DE OURO
-- EXECURTAR O SELECT SEMPRE ANTES DE ATUALIZAR
-- SELECT * FROM TABELA_QUE_DESEJO;

----------------------------------------------------------------

-- CONDICIONAIS
UPDATE produto
SET preco =  
CASE
    WHEN preco < 30 THEN preco* 1.50
    ELSE preco * 1.25
END
WHERE ativo = TRUE;

UPDATE cliente
SET telefone = NULL
WHERE id_cliente = 23;

-- APAGANDO DADOS DO BD
DELETE FROM cliente
WHERE id_cliente = 16; 

-- TRUNCATE TABLE cliente; 

-- EXCLUINDO DADOS DE FORMA LÓGICA
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 23;

------------------------------------

-- CADASTRANDO UM PROCEDIMENTO DE COMPRA
-- PASSO 1: ADICIONANDO NOVO CLIENTE
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Bruno M', 'brunom@email.com', '19999999913', 'Piracicaba', TRUE);
SET @cliente = LAST_INSERT_ID();

-- PASSO 2: ADICIONANDO UM NOVO PEDIDO
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO',0.00,@cliente);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: ADICIONANDO ITENS AO PEDIDO
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Mel'),
(@pedido, 5, 1, 15.50, '');

-- PASSO 4: ATUALIZANDO O VALOR TOTAL DO PEDIDO
UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'Preparando'
WHERE id_pedido = @pedido;

-- PASSO 5: REGISTRANDO PAGAMENTO
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido, 2, 22.00, NOW());

--- CONSULTA DE FORMA COMPLETA
SELECT p.id_pedido,
     c.nome AS cliente,
     p.status_pedido,
     p.valor_total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido;

-------------------------------------------------------------------------
-- CONSULTAS PARA OS DADOS DE BD
SELECT * FROM pedido;
SELECT * FROM cliente
where id_cliente = 23; 

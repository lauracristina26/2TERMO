-- Active: 1788267989003@@127.0.0.1@3306@smartcoffe_dml_lauracristina

USE smartcoffe_dml_lauracristina;

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Anthony C', 'anthony@email.com', '1999988913', 'Limeira', TRUE),
('Alice', 'alice@email.com', '1999988914', 'Limeira', TRUE)

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome_categoria) VALUES
('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
INSERT INTO produto (nome_produto, preco, ativo, id_categoria) VALUES
('Biscotos Recheados', 5.50, TRUE, 12),
('Brigadeiro', 2.50, TRUE, 12),
('Morango do Amor', 5.50, TRUE, 12);


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Rapunzel', 'rapunzel@email.com', NULL, 'Campinas', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'Preparando', 3.50, 27);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade e insira pelo menos dois itens nesse pedido.
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 23, 13, 2.50, 'Nutella');

SELECT * FROM cliente; 


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:
UPDATE cliente
SET telefone = '1999927832'
WHERE id_cliente = 28
SELECT telefone FROM cliente;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET cidade = 'Campinas'
    telefone = '1999998816'
WHERE id_cliente = 2;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
SELECT 

-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados. Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
SELECT 


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
SELECT nome_produto
FROM produto
WHERE ativo = FALSE;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos. Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Jude Duarte', 'juded@email.com', '199999999135', 'Elfheme', TRUE);
SET @cliente = LAST_INSERT_ID();
DELETE FROM cliente
WHERE id_cliente = 35;

-- 14. Tente excluir um cliente da base original que possua pedidos. Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Ana Clara', 'ana@email.com', '199999999123', 'Americana', TRUE);
-- A retrição que impediu a operação foi que tem uma entry duplicada que seria o email pois já foi usado antes


-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO',0.00,9999);

-- 20. Escreva em comentários a diferença entre os três erros anteriores.


-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.
INSERT INTO clientes (nome, email, telefone, cidade, ativo) 
VALUES ('Fernanda Lima', 'fernanda.lima@email.com', '19955554444', 'Rio Claro', TRUE);
SET @id_cliente = LAST_INSERT_ID();
INSERT INTO pedidos (id_cliente, data_pedido, status, valor_total) 
VALUES (@id_cliente, NOW(), 'PENDENTE', 35.00);
SET @id_pedido = LAST_INSERT_ID();
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES 
    (@id_pedido, 1, 1, 15.00),
    (@id_pedido, 2, 1, 20.00);


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.
SELECT 
    c.nome AS cliente,
    p.id_pedido,
    p.status_pedido,
    i.id_produto,
    i.quantidade,
    i.preco_unitario
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN itens_pedido i ON p.id_pedido = i.id_pedido
WHERE c.id_cliente = @id_cliente;

-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT. Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.
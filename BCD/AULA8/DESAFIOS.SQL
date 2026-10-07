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


-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

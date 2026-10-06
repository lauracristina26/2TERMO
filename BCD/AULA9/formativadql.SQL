-- Active: 1788267989003@@127.0.0.1@3306@smartcoffe_dml_lauracristina
USE smartcoffee_dml_lauracristina;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome_produto, preco 
FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome_produto, preco 
FROM produto
ORDER BY preco DESC
LIMIT 5;


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome_produto, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Americana';


-- 8. Localize os produtos cujo nome contém a palavra “Café”.


-- 9. Liste os clientes que não informaram telefone.


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.


-- 13. Informe quantos clientes existem em cada cidade.


-- 14. Mostre somente as cidades que possuem dois ou mais clientes.


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.



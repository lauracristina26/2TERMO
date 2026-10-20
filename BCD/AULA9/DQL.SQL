-- Active: 1788267989003@@127.0.0.1@3306@smartcoffe_dml_lauracristina
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Manuella Rossatt', 'manuella@email.com', '1999812131', 'Limeira', TRUE);

-- CONSULTAS COM SELECT
-- ESTRUTURA DE CONSTRUÇÃO DO SELECT
-- SELECT coluna
-- FROM tabela;

-- EX 1: SELECT PARA TODAS AS COLUNAS
SELECT * FROM cliente;

-- EX 2: SELECT POR COLUNAS
SELECT nome, email,ativo FROM cliente;  --Sempre que for adicionar uma coluna tem que colocar a vírgula no final da linha, exceto na última coluna.

-- EX 3: ALIAS É UM APELIDO PARA O RESULTADO
SELECT nome AS Cliente, 
       telefone AS Contato
FROM cliente;

SELECT nome AS Cliente,
        ativo AS Status
FROM cliente;

SELECT nome AS Cliente,
        cidade AS Local
FROM cliente;

SELECT nome_produto, preco, preco * 0.80 AS preco_promocao
FROM produto;

-- EX 4: ELIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;

SELECT cidade FROM cliente;

-- SEM DISTINCT - Aparece várias vezes 
-- COM DISTINCT - Aparece apenas uma vez

-- EX 5: FILTROS EM REGISTROS
SELECT nome_produto, preco 
FROM produto
WHERE preco > 10;

SELECT nome_produto, preco 
FROM produto
WHERE preco <> 10; -- ou != e <> são diferentes formas de escrever sendo alicado da mesma forma. 

SELECT nome_produto, preco
FROM produto
WHERE ativo = TRUE; 

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- OUTROS OPERADORES as condições SEMPRE estarão dentro do WHERE
-- = igual
-- <> != diferente
-- > maior
-- >= maior igual
-- < menor
-- <= menos igual

-- EX 6: AND, OR E NOT
-- EXEMPLO COM AND
SELECT nome_produto, preco
FROM produto
WHERE preco > 8 AND ativo <= 20;

-- EXEMPLO COM OR
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

-- EXEMPLO COM NOT
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- EXEMPLO COM AND E OR JUNTOS UTILIZAR ()
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Americana'); 

-- EX 7: BETWEEN - PESQUISA POR INTERVALOS
SELECT nome_produto, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59';

-- EX 8: IN - VÁRIAS POSSIBILIDADES
-- USAR PARA ELIMINAR A QUANTIDADE DE OR
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Piracicaba', 'Americana');

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Americana');

-- EX 9: LIKE - PESQUISANDO POR TEXTOS
SELECT nome_produto
FROM produto
WHERE nome_produto LIKE 'Bolo%';
-- começa com a palavra desejada

SELECT nome_produto
FROM produto
WHERE nome_produto LIKE '%chocolate%';
-- possui a palavra desejada em qualquer posição

SELECT nome_produto
FROM produto
WHERE nome_produto LIKE '&brigadeiro%';
-- utilizando o % como coringa para pesquisar por nomes que começam com Silva

SELECT nome_produto
FROM produto
WHERE nome_produto LIKE '_ilva';

SELECT nome 
FROM cliente
WHERE nome LIKE 'ra_';
-- utilizando o _ como coringa

-- EX 10: NULL - AUSÊNCIA DE VALOR
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- EX 11: ORDER BY - ORDENANDO RESULTADOS
-- ASC É CRESCENTE E DESC É DECRESCENTE
SELECT nome_produto, preco 
FROM produto 
ORDER BY preco ASC;

SELECT nome_produto, preco 
FROM produto 
ORDER BY preco DESC;

SELECT cidade, nome 
FROM cliente
ORDER BY cidade ASC, nome DESC;

-- EX 12: LIMIT - LIMITANDO A QUANTIDADE DE RESULTADOS
SELECT nome_produto, preco
FROM produto
ORDER BY preco DESC
LIMIT 8; -- define a quantidade de registros que serão exibidos

SELECT nome_produto, preco
FROM produto
ORDER BY nome_produto
LIMIT 8 OFFSET 8; 

-- EX 13: COLUNAS COM CÁLCULOS
SELECT nome_produto, preco, preco * 1.10 AS preco_com_reajuste
FROM produto;

-- CALCULO COM SUBTOTAL
SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS subtotal
FROM item_pedido;

-- EX 14: FUNÇÕES ÚTEIS EM CONSULTAS
SELECT UPPER(nome) AS Nome_Maiusculo,
        LOWER(email) AS Email_Minusculo
FROM cliente;
-- deixar em maiusculo e minusculo

SELECT CONCAT(nome, ' - ', cidade) AS Cliente_Cidade
FROM cliente;
-- juntar infarmações entre campos

SELECT nome_produto, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;
-- arredondar casas decimais

SELECT id_pedido, data_pedido, DATE(data_pedido) AS Data_Pedido, YEAR(data_pedido) AS Ano_Pedido, MONTH(data_pedido) AS Mes_Pedido
FROM pedido;
-- formatação de resultado por data, mes e ano

-- SUBSTITUINDO NULL PARA TEXTO DESEJADO
SELECT nome,
        COALESCE(telefone, 'Não Informado') AS Telefone
FROM cliente;

-- FUNÇÕES DE AGREGAÇÕES
-- EX 15: FUNÇÕES DE CÁLCULOS AGREGADAS
-- COUNT() - Contar registros
-- SUM() - Somar valores
-- AVG() - Média de valores
-- MIN() - Valor mínimo
-- MAX() - Valor máximo

SELECT COUNT(*) AS Total_Clientes
FROM cliente;
-- quantos clientes temos em nossa tabela cliente? 28 clientes.Tudo que for trabalhar com contagem de registros, utilizar o COUNT(*)

SELECT AVG(preco) AS Preço_Médio
FROM produto;
-- calcule o preço médio dos produtos cadastrados na tabela produto. O resultado será 7,95.

SELECT MIN(preco) AS Preço_Mínimo,
       MAX(preco) AS Preço_Máximo,
       AVG(preco) AS Preço_Médio
FROM produto;
-- Resumo dos preços. Trazendo todos os valores de preço mínimo, máximo e médio da tabela produto.

SELECT SUM(valor_total) AS Faturamento_Total
FROM pedido
WHERE status_pedido = 'Finalizado';
-- total de pedidos que foram finalizados. 

-- EX 16: GROUP BY - AGRUPAR DADOS
SELECT cidade,
         COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade;
-- quantidades de clientes por cidade. Agrupando os clientes por cidade e contando a quantidade de clientes em cada cidade.

SELECT id_categoria,
         COUNT(*) AS quantidade_produtos
FROM produto
GROUP BY id_categoria;
-- quantidade de produtos por categoria.  

-- EX 17: HAVING - FILTRAR GRUPOS
-- WHERE: filtra linhas antes do agrupamento 
-- HAVING: filtra grupos depois do group by

SELECT cidade,
            COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 3;
-- cidades com pelo menos dois clientes

-- EX 18: RESUMO E ORDEM DE UMA CONSULTA COMPLETA
SELECT colunas
FROM tabela
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao_agrupar
ORDER BY colunas
LIMIT quantidade;
-- EXEMPLO DE CONSTRUÇÃO DE UMA CONSULTA

SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
WHERE cidade = 'Limeira'
GROUP BY cidade 
HAVING COUNT (*) >=3
LIMIT 5;

-- PARTE II - RELACIONAMENTO ENTRE TABELAS
-- USO DE JOINS
-- INNER JOIN - INNER JOIN ENTRE DUAS TABELAS (JUNTANDO DUAS TABELAS)

-- EX 19: PEDIDOS COM O NOME DO CLIENTE 
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE, P.VALOR_TOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C 
ON C.ID_CLIENTE = P.ID_CLIENTE

-- OBS: RELACIONE O CLIENTE CUJO ID_CLIENTE É IGUAL ID_CLIENTE GRAVADO NO PEDIDO
-- ALIASES- SÃO COMO ATRIBUIÇÃO DE PEDIDO PARA CONSULTAS DE VÁRIAS TABELAS MAIS CURTAS E LEGÍVEIS

-- LEFT JOIN - MANTEM TODOS OS REGISTROS DA TABELA DA ESQUUERDA MESMO QUANDO NÃO POSSUI CORRESPONDÊNCIA
-- EX 20: TODOS OS CLIENTES INCLUSIVE QUEM COMPROU 
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C 
LEFT JOIN PEDIDO AS P 
ON C.ID_CLIENTE = P.ID_CLIENTE
ORDER BY C.NOME;

-- EX 21: CLIENTES SEM PEDIDO
SELECT C.ID_CLIENTE, C.NOME 
FROM CLIENTE AS C 
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- JOIN COM TRÊS TABELAS
-- EX 22: ITENS DE PEDIDO COM NOME DO PRODUTO
SELECT P.ID_PEDIDO, PR.NOME_PRODUTO AS NOME_PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL 
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP 
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR 
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO;

-- EX 23: JOIN COM CATEGORIA - PRODUTO E NOME DE SUA CATEGORIA
SELECT PR.NOME_PRODUTO AS PRODUTO, CA.NOME_CATEGORIA AS CATEGORIA, PR.PRECO 
FROM PRODUTO AS PR 
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME_CATEGORIA, PR.NOME_PRODUTO;

-- AGREGANDO JOINS
-- EX 24: QUANTIDADE DE PRODUTOS POR CATEGORIA
SELECT CA.NOME_CATEGORIA AS CATEGORISA, COUNT(PR.ID_PRODUTO) AS QTDE_PRODUTOS
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR 
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME_CATEGORIA
ORDER BY QTDE_PRODUTO DESC;

-- EX 25:TOTAL COMPRADO POR CLIENTE
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDO, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C 
INNER JOIN PEDIDO AS P 
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'ABERTO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- RELATORIO COMPLETO DO PEDIDO
-- EX 26: COMBINAÇÃO DE VÁRIAS TABELAS PARA UM CONSULTA COMPLETA
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i') AS DATA, C.NOME AS CLIENTE, PR.NOME_PRODUTO AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C 
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR 
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO

-- OBS: DATE_FORMAT(P.DATA_PEDIDO, 'd %m %Y %H:%i') - FORMATAÇÃO PADRÃO BRASIL

-- CASE - CRIANDO CLASSIFICAÇÕES 
-- EX 27: CLASSFICANDO POR REGRAS
SELECT NOME_PRODUTO, PRECO,
CASE 
WHEN PRECO < 8.00 THEN 'Econômico'
WHEN PRECO < 15.00 THEN 'Intermediário'
ELSE 'Premium'
END AS Classificação_Precos
FROM produto
ORDER BY PRECO;

-- SUBCONSULTA
-- INSERIR UM CONSULTA DENTRO DE UMA CONSULTA
-- EX 28: PRODUTOS ACIMA DO PREÇO MÉDIO
SELECT NOME_PRODUTO, PRECO 
FROM PRODUTO 
WHERE PRECO > (SELECT AVG(PRECO)
FROM PRODUTO)
ORDER BY PRECO DESC;
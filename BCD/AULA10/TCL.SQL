-- Active: 1788267989003@@127.0.0.1@3306@smartcoffe_dml_lauracristina
-- TCL: Transações e Integridades
-- EX 1: Transação para resolver problemas
-- SEM TRANSAÇÃO: Parte pode permanecer gravada
-- COM TRANSAÇÃO: Pode confirmar tudo ou desfazer tudo

-- Estrutura do conceito
START TRANSACTION
    -- Comandos SQL
    -- INSERT, UPDATE, DALETE, SELECT
    COMMIT; -- Confirma todas as alterações
    ROLLBACK; -- Desfaz todas as alterações

-- EX 2: COMMIT - Confirmando alterações realizadas
START TRANSACTION;
SELECT * FROM PRODUTO WHERE ID_PRODUTO = 1;
UPDATE produto
SET PRECO = 8.50
WHERE ID_PRODUTO = 1;
COMMIT;

-- EX 3: ROLLBACK - Desfazer alteração ainda não confirmadas
START TRANSACTION;
SELECT * FROM PRODUTO WHERE ID_PRODUTO = 1;
UPDATE produto
SET PRECO = 5000.00
WHERE ID_PRODUTO = 1;
ROLLBACK;

-- EX 4: SAVEPOINT - Criar um ponto de salvamento ou checkpoint de uma transação
START TRANSACTION;
UPDATE produto
SET PRECO = PRECO * 1.05
WHERE ID_CATEGORIA = 1

SAVEPOINT Reajuste_Cafes;

SELECT * FROM PRODUTO WHERE ID_CATEGORIA = 1;
UPDATE produto
SET PRECO = PRECO * 1.50
WHERE ID_CATEGORIA = 1;

ROLLBACK TO SAVEPOINT Reajuste_Cafes;
COMMIT;

-- EX 5: RELEASE SAVEPOINT - Remover o SAVEPOINT criado anteriormente
RELEASE SAVEPOINT Reajuste_Cafes;

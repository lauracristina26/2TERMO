-- Active: 1794917650052@@127.0.0.1@3306@projeto_assistencia_tecnica
DROP DATABASE projeto_assistencia_tecnica;
-- Criação do Banco de Dados 
CREATE DATABASE IF NOT EXISTS projeto_assistencia_tecnica;
USE projeto_assistencia_tecnica;


CREATE TABLE clientes (
    id_clientes INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    CONSTRAINT pk_clientes PRIMARY KEY (id_clientes),
    CONSTRAINT uq_clientes_email UNIQUE (email),
    CONSTRAINT uq_clientes_telefone UNIQUE (telefone),
    CONSTRAINT uq_clientes_cpf UNIQUE (cpf)
);

CREATE TABLE tecnicos (
    id_tecnicos INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    setor VARCHAR(60),
    especialidade VARCHAR(40) NOT NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'ATIVO',
    CONSTRAINT pk_tecnicos PRIMARY KEY (id_tecnicos),
    CONSTRAINT chk_tecnicos_status CHECK (status IN ('ATIVO', 'INATIVO'))
);

CREATE TABLE pecas (
    id_pecas INT AUTO_INCREMENT,
    descricao_pecas VARCHAR(120) NOT NULL,
    fabricante VARCHAR(60),
    valor_peca DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_pecas PRIMARY KEY (id_pecas),
    CONSTRAINT chk_pecas_estoque CHECK (quantidade_estoque >= 0)
);


CREATE TABLE equipamentos (
    id_equipamentos INT AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    numero_serie VARCHAR(60) NOT NULL,
    marca VARCHAR(60),
    modelo VARCHAR(60) NOT NULL,
    estado_entrada VARCHAR(60),
    id_clientes INT NOT NULL,
    CONSTRAINT pk_equipamentos PRIMARY KEY (id_equipamentos),
    CONSTRAINT uq_equipamentos_serie UNIQUE (numero_serie),
    CONSTRAINT fk_equipamentos_clientes FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes)
);

CREATE TABLE chamados (
    id_chamados INT AUTO_INCREMENT,
    data_atendimento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    defeito_relatado VARCHAR(120) NOT NULL,
    diagnostico VARCHAR(120),
    valor_servico DECIMAL(10,2) DEFAULT 0.00,
    status_chamados VARCHAR(20) NOT NULL DEFAULT 'ABERTO',
    id_equipamentos INT NOT NULL,
    id_tecnicos INT,
    CONSTRAINT pk_chamados PRIMARY KEY (id_chamados),
    CONSTRAINT chk_chamados_status CHECK (status_chamados IN ('ABERTO', 'EM_ATENDIMENTO', 'FINALIZADO')),
    CONSTRAINT fk_chamados_equipamentos FOREIGN KEY (id_equipamentos) REFERENCES equipamentos(id_equipamentos),
    CONSTRAINT fk_chamados_tecnicos FOREIGN KEY (id_tecnicos) REFERENCES tecnicos(id_tecnicos)
);


CREATE TABLE chamados_pecas (
    id_chamados INT NOT NULL,
    id_pecas INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    valor_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_chamados_pecas PRIMARY KEY (id_chamados, id_pecas),
    CONSTRAINT chk_chamados_pecas_qtd CHECK (quantidade > 0),
    CONSTRAINT fk_cp_chamados FOREIGN KEY (id_chamados) REFERENCES chamados(id_chamados),
    CONSTRAINT fk_cp_pecas FOREIGN KEY (id_pecas) REFERENCES pecas(id_pecas)
);

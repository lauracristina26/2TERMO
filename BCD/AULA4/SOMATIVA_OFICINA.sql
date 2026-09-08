CREATE DATABASE OFICINA_VEÍCULO_LauraCristina;
 
USE OFICINA_VEÍCULO_LauraCristina;

SHOW TABLES;

CREATE TABLE Clientes(
ID_Clientes INT auto_increment primary key,
Nome varchar(60) not null, 
Telefone varchar(14) not null,
CPF varchar(40) not null,
Email varchar(40) not null,
Endereco varchar(40) not null
);

CREATE TABLE Veiculos(
ID_Veiculos INT auto_increment primary key,
Placa varchar(20) not null,
Tipo_Veiculo varchar(14) not null,
Modelo_Veiculo varchar(14) not null,
Marca_Veiculo varchar(14) not null,
Preço_Veiculo decimal(10,2) not null
);

CREATE TABLE Marcas(
ID_Marcas INT auto_increment primary key,
Nome_Marcas varchar(20) not null,
Cor varchar(14),
Tipo_Modelo varchar(20) not null,
Data_Fabricação datetime not null,
Observação varchar(40) not null
);

CREATE TABLE Modelos(
ID_Modelos INT auto_increment primary key,
Nome varchar(60) not null, 
Tamanho_Modelo INT not null,
Data_Fabricação datetime not null,
Composição varchar(40) not null,
Identificação char(20) not null
);

CREATE TABLE Funcionários(
ID_Funcionários INT auto_increment primary key,
Nome varchar(60) not null,
Telefone varchar(14) not null,
CPF varchar(14) not null,
Turno varchar(40) not null,
Cargo varchar(40) not null
);

CREATE TABLE Serviços(
ID_Serviços INT auto_increment primary key,
Formas_Serviços varchar(40) not null,
Informações_Serviços varchar(40) not null,
Setor_Serviços varchar(40) not null,
Máquina varchar(20) not null,
Preço_Serviço decimal(10,2) not null
);
CREATE TABLE Peças(
ID_Peças INT auto_increment primary key,
Nome_Peças varchar(40) not null, 
Quantidade_Peças INT not null,
Tamanho_Peças INT not null,
Tipo_Peças varchar(20) not null,
Preço_Peças dECIMAL(10,3) not null
);

CREATE TABLE Ordens_Serviços(
ID_Ordens INT auto_increment primary key,
Tipo_Serviços varchar(20) not null,
Nome_Clientes varchar(60) not null,
Nome_Atendente varchar(60) not null,
Data_Entrega datetime not null
);

CREATE TABLE Pagamentos(
ID_Pagamentos INT auto_increment primary key,
Valor_Pagamento decimal(10,2) not null,
Forma_Pagamento varchar(20) not null,
Comprovante varchar(40) not null,
Registro_Compra varchar(40) not null,
Historico varchar(40) not null
);

CREATE TABLE Fornecedores(
ID_Fornecedores INT auto_increment primary key,
Nome varchar(60) not null,
Produtos_Fornecidos varchar(60) not null,
Quantidade_Produtos int not null,
Valor_Produtos decimal(10,3) not null,
Modelos_Produtos varchar(14) not null
);

ALTER TABLE clientes ADD Localizacao varchar(15);

ALTER TABLE veiculos ADD Categoria varchar(20) not null;

ALTER TABLE marcas ADD Slogan char(40);

ALTER TABLE modelos ADD equipamentos_veiculos varchar(60) not null;

ALTER TABLE funcionários ADD comissao varchar(20) not null;

ALTER TABLE serviços ADD util_veiculo varchar(60) not null;

ALTER TABLE peças ADD garantia_tempo datetime not null;

ALTER TABLE ordens_serviços ADD relatorio_tecnico varchar(60) not null;

ALTER TABLE pagamentos ADD IPVA_Veiculo int not null;

ALTER TABLE fornecedores ADD CNPJ INT not null;

ALTER TABLE modelos DROP COLUMN equipamentos_veiculos;


ALTER TABLE modelos RENAME TO modelos_fab;

CREATE DATABASE SMARTCOFFE_Laura; 
USE SMARTCOFFE_Laura;

CREATE TABLE Fidelidade (
ID_Fidelidade int primary key auto_increment PRIMARY KEY,
Forma_Pagamento varchar(20) not null,
Pedidos varchar(40) not null,
Saldo_Ponto varchar(60) not null,
Data_ultima_atualização datetime not null
)

CREATE TABLE Delivery (
ID_Delivery int primary key auto_increment PRIMARY KEY,
Taxa_Entrega decimal (10,2) not null,
Endereço_Entrega varchar(60) not null,
Status_Entrega varchar(40) not null ,
Data_Hora_Saida datetime not null 
)

CREATE TABLE Pagamentos (
ID_Pagamentos int primary key auto_increment PRIMARY KEY,
Data_Hora_Pagamento datetime not null,
Forma_Pagamento varchar(20) not null,
Status_Pagamento varchar(20) not null,
Valor_Pago decimal(10,2) not null
)

CREATE TABLE Pedidos (
Quantidade int not null,
ID_Pedidos int primary key auto_increment PRIMARY KEY,
Nome_Pedido varchar(20) not null,
Data_Pedidos datetime not null,
Valor_Total decimal(5.2) not null,
Tipo_Pedido varchar(14) not null,
ID_Pagamentos int,
FOREIGN KEY(ID_Pagamentos) REFERENCES Pagamentos (ID_Pagamentos)
)

CREATE TABLE Clientes (
CPF varchar(14) not null,
Nome varchar(60) not null,
Telefone varchar(14),
Email varchar(60) not null,
Endereço varchar(40) not null,
ID_Cliente int primary key auto_increment PRIMARY KEY,
Data_Cadastro datetime not null,
ID_Fidelidade int ,
ID_Produtos int primary key auto_increment,
FOREIGN KEY(ID_Fidelidade) REFERENCES Fidelidade (ID_Fidelidade)
)

CREATE TABLE Produtos (
ID_Produtos int primary key auto_increment PRIMARY KEY,
Preço_Unitário decimal(10,2) not null,
Categoria varchar(20) not null,
Nome_Produto varchar(20) not null,
Descrição varchar(60),
Peso decimal (3,1)
)

CREATE TABLE Funcionários (
ID_Funcionários int primary key auto_increment PRIMARY KEY,
Cargo varchar(60) not null,
CPF varchar(40) not null,
Nome varchar (60) not null,
Turno varchar(40) not null,
Data_Admissão datetime not null,
Salário decimal(10,3) not null
)

CREATE TABLE Estoque (
ID_Estoque int primary key auto_increment PRIMARY KEY,
Unidade_Medida decimal (3,1) not null,
Quantidade_Atual int not null,
Quantidade_Minima int not null,
Nome_Insumo varchar(20) not null
)

CREATE TABLE Utiliza (
ID_Delivery int ,
ID_Estoque int ,
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery),
FOREIGN KEY(ID_Estoque) REFERENCES Estoque (ID_Estoque)
)

CREATE TABLE Faz (
ID_Pagamentos int ,
ID_Cliente int ,
FOREIGN KEY(ID_Pagamentos) REFERENCES Pagamentos (ID_Pagamentos),
FOREIGN KEY(ID_Cliente) REFERENCES Clientes (ID_Cliente)
)

CREATE TABLE Realiza (
ID_Cliente int,
ID_Pedidos int ,
FOREIGN KEY(ID_Cliente) REFERENCES Clientes (ID_Cliente),
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos)
)

CREATE TABLE Atende (
ID_Pedidos int ,
ID_Funcionários int ,
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY(ID_Funcionários) REFERENCES Funcionários (ID_Funcionários)
)

CREATE TABLE Entrega (
ID_Funcionários int ,
ID_Delivery int ,
FOREIGN KEY(ID_Funcionários) REFERENCES Funcionários (ID_Funcionários),
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery)
)

CREATE TABLE Contém (
ID_Pedidos int ,
ID_Produtos int ,
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos),
FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos)
)

CREATE TABLE Gera (
ID_Delivery int ,
ID_Pedidos int ,
FOREIGN KEY(ID_Delivery) REFERENCES Delivery (ID_Delivery),
FOREIGN KEY(ID_Pedidos) REFERENCES Pedidos (ID_Pedidos)
)

CREATE TABLE Verifica (
ID_Funcionários int ,
ID_Estoque int ,
FOREIGN KEY(ID_Funcionários) REFERENCES Funcionários (ID_Funcionários),
FOREIGN KEY(ID_Estoque) REFERENCES Estoque (ID_Estoque)
)

CREATE TABLE Consome (
ID_Produtos int ,
ID_Estoque int ,
FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos),
FOREIGN KEY(ID_Estoque) REFERENCES Estoque (ID_Estoque)
)

ALTER TABLE Clientes ADD FOREIGN KEY(ID_Produtos) REFERENCES Produtos (ID_Produtos)
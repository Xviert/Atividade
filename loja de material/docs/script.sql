DROP DATABASE IF EXISTS loja_de_materiais;
CREATE DATABASE loja_de_materiais CHARSET=UTF8 COLLATE utf8_general_ci;
USE loja_de_materiais;
-- DDL Criação da estrutura da tabela
CREATE TABLE Produto(
    id varchar(5) not null ,
    nome varchar(50) not null,
    descricao text,
    valor decimal(10,2) not null,
    quantidade int not null
);
-- DML Popular a tabela com dados de teste
INSERT INTO Produto VALUES
('i001','Tábua de madeira','Tábua de madeira de reflorestamento',30.00,3),
('i002','Parafuso','Parafuso de aço inoxidável',0.50,1),
('i003','Lixa','Lixa para madeira grão 120',2.00,2),
('i004','Furadeira','Furadeira de impacto 700W',250.00,1),
('i005','Tinta','Lata de tinta branca fosca 3,6L',100.00,4),
('i006','Martelo','Martelo de aço com cabo de madeira',20.00,1);
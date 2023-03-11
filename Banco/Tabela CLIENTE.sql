DROP DATABASE IF EXISTS pizzaria;
CREATE DATABASE pizzaria CHARSET=UTF8 COLLATE utf8_general_ci;
USE pizzaria;

CREATE TABLE Cliente (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 telefone VARCHAR(10),
 nome VARCHAR(30) NOT NULL,
 logradouro VARCHAR(30) NOT NULL,
 numero DECIMAL(5,0),
 complemento VARCHAR(30) NOT NULL,
 bairro VARCHAR(30) NOT NULL,
 referencia VARCHAR(30) NOT NULL
);

-- Tabela PIZZA
CREATE TABLE pizza (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(30) NOT NULL,
 descricao VARCHAR(30) NOT NULL,
 valor DECIMAL(4 , 2 )
);
-- Tabela PEDIDO
CREATE TABLE pedido (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 cliente_id INT NOT NULL,
 data DATETIME,
 valor DECIMAL(4 , 2 ),
 FOREIGN KEY (cliente_id) REFERENCES Cliente (id)
);
-- Tabela ITEM_PEDIDO
CREATE TABLE item_pedido (
 pedido_id INT NOT NULL,
 pizza_id INT NOT NULL,
 quantidade DECIMAL(2 , 0 ),
 valor DECIMAL(5 , 2 ),
 FOREIGN KEY (pizza_id) REFERENCES Pizza (id),
 FOREIGN KEY (pedido_id) REFERENCES Pedido (id)
);
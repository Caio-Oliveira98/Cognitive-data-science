CREATE DATABASE papelaria;

USE papelaria;

-------------------------------
-- Tabela de clientes
-------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  PRIMARY KEY (`idCliente`)
);

-------------------------------
-- Dados de clientes
-------------------------------
INSERT INTO `cliente` VALUES (1,'Júlia','São Paulo'),(2,'Amanda','Belo Horizonte'),(3,'Roberto','Porto Alegre'),(4,'Mariana','Minas Gerais'),(5,'Miguel','São Paulo');

-------------------------------
-- Tabela de fornecedores
-------------------------------

DROP TABLE IF EXISTS `fornecedor`;

CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  PRIMARY KEY (`idFornecedor`)
);

-------------------------------
-- Dados de fornecedores
-------------------------------

INSERT INTO `fornecedor` VALUES (1,'Acme','São Paulo'),(2,'Northwind','Rio de Janeiro'),(3,'Atlas','Salvador');

-------------------------------
-- Tabela de produtos
-------------------------------

DROP TABLE IF EXISTS `produto`;

CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `dscProduto` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `idFornecedor` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `idFornecedor` (`idFornecedor`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
); 

-------------------------------
-- Dados de produtos
-------------------------------

INSERT INTO `produto` VALUES (1,'Caderno',10.00,1),(2,'Lápis',5.00,1),(3,'Estojo',20.00,2),(4,'Borracha',10.00,2),(5,'Régua',15.00,3);

-------------------------------
-- Tabela de pedidos
-------------------------------

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `Data` datetime DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `fk_pedido_cliente_idcliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
);


-------------------------------
-- Dados de pedidos
-------------------------------

INSERT INTO `pedido` VALUES (1,1,'2022-01-18 17:20:24'),(2,2,'2022-01-23 17:20:24'),(3,1,'2022-01-28 17:20:24'),(4,2,'2022-02-01 17:20:24');


-------------------------------
-- Tabela de itens pedidos
-------------------------------

DROP TABLE IF EXISTS `itempedido`;

CREATE TABLE `itempedido` (
  `idItemPedido` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idProduto` int NOT NULL,
  `quantidade` int NOT NULL,
  `valorUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idItemPedido`),
  KEY `idPedido` (`idPedido`),
  KEY `idProduto` (`idProduto`),
  CONSTRAINT `itempedido_pedido_idpedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `itempedido_produto_idproduto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
);

-----------------------------------
-- Dados de itens pedidos
-----------------------------------

INSERT INTO `itempedido` VALUES (1,1,1,1,10.00),(2,1,2,2,5.00),(3,2,3,1,20.00),(4,3,4,2,10.00),(5,4,1,1,10.00),(6,4,2,1,5.00);
select*from produto;
select*from fornecedor;

-- juntando a tabela produto e fornecedor, exibindo o nome dos fornecedores para cada produto
select P.idProduto,
	   F.IDfornecedor,
       F.Nome,
       P.dscProduto
from fornecedor F
inner join produto P
on F.idfornecedor = P.idfornecedor;

-- fazendo um left join para juntar a tabela cliente e pedido e me dar o nome dos clientes com os pedidos.
select*from cliente;
select*from pedido;
select P.idpedido,
	   c.idcliente,
       c.nome
from cliente as c
left join pedido as p
on P.idCliente = c.idCliente;

select P.idpedido,
       c.idcliente,
       c.nome
from pedido as p
right join cliente as c
on c.idcliente = p.idcliente;

select P.idPedido, p.data,
	   c.nome,
       PR.dscProduto,
       IP.quantidade,
       IP.valorUnitario
from Pedido P
inner join ItemPedido IP ON P.idPedido = IP.idPedido
inner join Cliente C on P.idCliente = C.idCliente
inner join Produto PR on IP.idProduto = PR.idProduto;








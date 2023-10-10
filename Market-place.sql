-----------------------------------------------------CABEÇALHO-----------------------------------------------------------------------

--DSI04
--BANCO DE DADOS 1
--GRUPO
--Lucas
--Gustavo
--Deyvison
--João

---------------------------------------------- Reset do banco de dados---------------------------------------------------------------
-- DROP TABLE Usuario;
-- DROP TABLE Comprador;
-- DROP TABLE Vendedor;
-- DROP TABLE Pedido;
-- DROP TABLE Transportadora;
-- DROP TABLE Pagamento;
-- DROP TABLE ItensNoEstoque;

-----------------------------------ESTRUTURA DO BANCO DE DADOS DO NOSSO MARKETPLACE--------------------------------------------------

CREATE TABLE Usuario(
    Id NUMBER NOT NULL,
    CONSTRAINT usuario_pk PRIMARY KEY (Id),
    NomeCompleto VARCHAR2(40),
    NomeDeUsuario VARCHAR2(40),
    Senha VARCHAR2(40),
    Endereco VARCHAR2(40),
    Email VARCHAR2(40),
    DadosBancarios VARCHAR2(40),
    CONSTRAINT dados_bancarios_ck CHECK(DadosBancarios LIKE ('______-_'))
);

CREATE TABLE Comprador (
    CPF VARCHAR(14) NOT NULL,
    CONSTRAINT comprador_pk PRIMARY KEY (CPF),
    CONSTRAINT comprador_cpf_ck CHECK(CPF LIKE ('___.___.___-__')),
    Id_Usuario NUMBER,
    CONSTRAINT comprador_id_usuario_fk FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id)
);

CREATE TABLE Vendedor (
    CNPJ VARCHAR2(18),
    CONSTRAINT vendedor_pk PRIMARY KEY(CNPJ),
    CONSTRAINT vendedor_cnpj_ck CHECK(CNPJ LIKE ('__.___.___/____-__')),
    Id_Usuario NUMBER,
    CONSTRAINT vendedor_id_usuario_fk FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id)
);

CREATE TABLE Pedido (
    CodigoDoPedido VARCHAR2(16) NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (CodigoDoPedido),
    CPF_Comprador VARCHAR(14),
    CONSTRAINT pedido_cpf_comprador_fk FOREIGN KEY (CPF_Comprador) REFERENCES Comprador(CPF)
);

CREATE TABLE Transportadora(
    CodigoDeRastreamento VARCHAR2(20) NOT NULL,
    CONSTRAINT transportadora_pk PRIMARY KEY(CodigoDeRastreamento),
    StatusTransportadora VARCHAR2(40),
    TaxaDeEnvio NUMBER(5,2),
    CodigoDoPedido_Pedido VARCHAR2(16),
    CONSTRAINT transportadora_codigodopedido_pedido_fk FOREIGN KEY (CodigoDoPedido_Pedido) REFERENCES Pedido(CodigoDoPedido)
);

CREATE TABLE Pagamento (
    Id NUMBER NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (Id),
    FormaDePagamento VARCHAR2(20),
    CodigoDoPedido_Pedido VARCHAR2(16),
    CONSTRAINT pagamento_codigodopedido_pedido_fk FOREIGN KEY (CodigoDoPedido_Pedido) REFERENCES Pedido(CodigoDoPedido),
    CNPJ_Vendedor VARCHAR2(18),
    CONSTRAINT pagamento_cnpj_vendedor_fk FOREIGN KEY (CNPJ_Vendedor) REFERENCES Vendedor(CNPJ)
);

CREATE TABLE ItensNoEstoque (
    CodigoDoProduto VARCHAR2(16) NOT NULL,
    CONSTRAINT itensnoestoque_pk PRIMARY KEY(CodigoDoProduto),
    Preco NUMBER(5,2),
    Quantidade NUMBER,
    Descricao VARCHAR2(100),
    NomeDoProduto VARCHAR2(45),
    CNPJ_Vendedor VARCHAR2(18),
    CONSTRAINT itensnoestoque_cnpj_vendedor_fk FOREIGN KEY (CNPJ_Vendedor) REFERENCES Vendedor(CNPJ),
    CodigoDoPedido_Pedido VARCHAR2(16),
    CONSTRAINT itensnoestoque_codigodopedido_pedido_fk FOREIGN KEY (CodigoDoPedido_Pedido) REFERENCES Pedido(CodigoDoPedido)
);

--------------------------------------------------POVOAMENTO--------------------------------------------------

--PARA USUARIO
  
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) values (1,'Homem Sereia','HomemSereia123','33535455', 'Av. Hidelbrando de Vasconcelos, 254' , 'homemsereia@gemail.com','000001-7');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (2, 'Gustavo Guanabara', 'Gustavo123', '40028922', 'Av. Hidelbrando de Vasconcelos, 254' , 'hadolfo@email.com', '123452-6');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (3, 'Natobelão Bonaspartes', 'Natobelão123', '863215456', 'Av. Hidelbrando de Vasconcelos, 254' , 'natob@email.com', '122353-2');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (4, 'Tanjirou Akamado', 'Kamado123', '526215456', 'Av. Hidelbrando de Vasconcelos, 254' , 'tjkamado@email.com', '125484-9');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (5, 'Saitama Calvo', 'SuperCalvo123', '726452686', 'Av. Hidelbrando de Vasconcelos, 254' , 'supercalvo@email.com', '254865-1');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (6, 'Master Chief', 'Chief123', '526582436', 'Av. Hidelbrando de Vasconcelos, 254' , 'masterchief@email.com', '568526-3');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (7, 'Loro José', 'lorojose123', '526215456', 'Av. Hidelbrando de Vasconcelos, 254' , 'lorojose@email.com', '526457-1');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (8, 'Celso Portioli', 'portioli123', '11092001', 'Av. Hidelbrando de Vasconcelos, 254' , 'portioli@email.com', '147885-6');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (9, 'Hombre Calça Rasgada', 'PikaSônica', '04102005', 'Av. Hidelbrando de Vasconcelos, 254' , 'pikasonica@email.com', '452897-9');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (10, 'Villager', 'Villager123', '456848793', 'Av. Hidelbrando de Vasconcelos, 254' , 'villager@email.com', '562481-9');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (11, 'Osvaldo Villa Pinto', 'VillaPinto123', 'Av. Hidelbrando de Vasconcelos, 254' , '40015862', 'villapinto@email.com', '561128-5');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (12, 'Otavio Villa Pinto', 'VillaPinto321', 'Av. Hidelbrando de Vasconcelos, 254' , '40115862', 'villapintou@email.com', '154318-6');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (13, 'Osmar Villa Pinto', 'VillaPinto456', 'Av. Hidelbrando de Vasconcelos, 254' , '42215862', 'villapintol@email.com', '561518-7');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (14, 'Oscar Villa Pinto', 'VillaPinto789', 'Av. Hidelbrando de Vasconcelos, 254' , '11015862', 'villapintosa@email.com', '522148-8');
INSERT INTO Usuario (Id,NomeCompleto,NomedeUsuario,Senha,Endereco,Email,DadosBancarios) VALUES (15, 'Olivia Villa Pinto', 'VillaPinto654', 'Av. Hidelbrando de Vasconcelos, 254' , '433015862', 'villapintos@email.com', '556118-4');

-- PARA COMPRADOR

INSERT INTO Comprador (CPF,Id_Usuario) values ('123.456.789-01',1);
INSERT INTO Comprador (CPF,Id_Usuario) values ('526.487.263-58',2);
INSERT INTO Comprador (CPF,Id_Usuario) values ('526.478.958-49',3);
INSERT INTO Comprador (CPF,Id_Usuario) values ('704.333.694-26',4);
INSERT INTO Comprador (CPF,Id_Usuario) values ('094.554.884-27',5);
INSERT INTO Comprador (CPF,Id_Usuario) values ('445.678.245-56',6);
INSERT INTO Comprador (CPF,Id_Usuario) values ('586.479.265-96',7);
INSERT INTO Comprador (CPF,Id_Usuario) values ('568.456.255-82',8);
INSERT INTO Comprador (CPF,Id_Usuario) values ('566.586.524-91',9);
INSERT INTO Comprador (CPF,Id_Usuario) values ('562.321.478-99',10);


-- PARA COMPRADOR


INSERT INTO Vendedor (CNPJ,Id_Usuario) values ('02.566.224/0001-91',11);
INSERT INTO Vendedor (CNPJ,Id_Usuario) values ('05.125.432/0001-60',12);
INSERT INTO Vendedor (CNPJ,Id_Usuario) values ('05.123.544/0001-61',13);
INSERT INTO Vendedor (CNPJ,Id_Usuario) values ('10.601.351/0001-54',14);
INSERT INTO Vendedor (CNPJ,Id_Usuario) values ('90.841.779/0001-13',15);

-- PARA PEDIDO

INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('A2bF9cH4eR7iP8qL', '123.456.789-01');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('X5yZ3wK1jM6vN0p', '526.487.263-58');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('S7tRfU2iGhE4oD9', '526.478.958-49');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('L1mN5oP8kY2jT6u', '704.333.694-26');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('I3oQ7rZxV9wF4pA', '094.554.884-27');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('E8gHsK2dCfR1tWn', '445.678.245-56');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('M6bVzX7qL0yA4oP', '586.479.265-96');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('W3uFjN5eZ9rYxT2', '568.456.255-82');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('G4iKpH8tR7wJmF3', '566.586.524-91');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('D9sU1vO5nLcA2eQ', '562.321.478-99');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('C0oVrHwXzYbMlK9', '123.456.789-01');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('P8eRmGqT3hS1nZ0', '526.478.958-49');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('B7fJ6xNtKlO2pV5', '094.554.884-27');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('U9aDvGwH1iRzY8o', '445.678.245-56');
INSERT INTO Pedido(CodigoDoPedido,CPF_Comprador)VALUES('Q2sE5lM3jRcN6hV', '566.586.524-91');

--PARA TRANSPORTADORA

INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('3K9B7F2P8R5J6N1Q0M4S','Verificando','100.25','A2bF9cH4eR7iP8qL'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('X7T2V1H5L0A6O3E8R9C','Aprovado','250.15','X5yZ3wK1jM6vN0p'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('6W2I8Z0Y4U3Q1O7P5T','Enviado','100.25','S7tRfU2iGhE4oD9'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('9D2R8G6F1E5B0C7A3K','Verificando','100.56','L1mN5oP8kY2jT6u'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('J1X7V2M8L0O6P4R5T9','Verificando','58.90','I3oQ7rZxV9wF4pA'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('2B8N6M1V0C4X7Z3I5','Enviado','65.75','E8gHsK2dCfR1tWn'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('5F2G1H8J6K0L7M3P','Aprovado','95.80','M6bVzX7qL0yA4oP'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('1Q9W2E8R0T4Y6U3I5','Verificando','60.32','W3uFjN5eZ9rYxT2'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('A2S8D6F1G0H4J7K3L','Aprovado','75.60','G4iKpH8tR7wJmF3'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('6Z2X8C0V4B7N1M5Q','Enviado','97.95','D9sU1vO5nLcA2eQ'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('T3R9E2W8Q0U4Y6I5','Enviado','105.90','C0oVrHwXzYbMlK9'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('O1P7L2M8N0J6H4G5','Aprovado','215.90','P8eRmGqT3hS1nZ0'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('8A2S6D0F4G7H1J3K','Verificando','121.15','B7fJ6xNtKlO2pV5'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('2Z8X6C1V0B4N7M3P','Verificando','45.50','U9aDvGwH1iRzY8o'); 
INSERT INTO Transportadora (CodigoDeRastreamento,StatusTransportadora,TaxaDeEnvio,CodigoDoPedido_Pedido)VALUES('5Q2W8E0R4T7Y1U3I','Enviado','65.75','Q2sE5lM3jRcN6hV'); 

--PARA PAGAMENTO

INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (1, 'boleto', 'P8eRmGqT3hS1nZ0', '02.566.224/0001-91');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (2, 'dinheiro', 'L1mN5oP8kY2jT6u', '05.125.432/0001-60');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (3, 'pix', 'G4iKpH8tR7wJmF3', '05.123.544/0001-61');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (4, 'debito', 'B7fJ6xNtKlO2pV5', '10.601.351/0001-54');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (5, 'credito', 'Q2sE5lM3jRcN6hV', '90.841.779/0001-13');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (6, 'credito', 'X5yZ3wK1jM6vN0p', '02.566.224/0001-91');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (7, 'debito', 'S7tRfU2iGhE4oD9', '05.125.432/0001-60');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (8, 'pix', 'D9sU1vO5nLcA2eQ', '05.123.544/0001-61');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (9, 'dinheiro', 'A2bF9cH4eR7iP8qL', '10.601.351/0001-54');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (10, 'boleto', 'I3oQ7rZxV9wF4pA', '90.841.779/0001-13');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (11, 'pix', 'C0oVrHwXzYbMlK9', '02.566.224/0001-91');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (12, 'dinheiro', 'W3uFjN5eZ9rYxT2', '05.125.432/0001-60');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (13, 'dinheiro', 'M6bVzX7qL0yA4oP', '05.123.544/0001-61');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (14, 'boleto', 'E8gHsK2dCfR1tWn', '10.601.351/0001-54');
INSERT INTO Pagamento (Id, FormaDePagamento, CodigoDoPedido_Pedido, CNPJ_Vendedor) VALUES (15, 'pix', 'U9aDvGwH1iRzY8o', '90.841.779/0001-13');

--PARA ITENS NO ESTOQUE

INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido) 
VALUES ('K9P4T7R3E6W8Q0U',499.50,2,'Produto Bacana','PC-Gamer','02.566.224/0001-91','A2bF9cH4eR7iP8qL');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('Lg9Jk5cE4h3X7pRv',699.20,2,'Celular Perfeito para Tirar foto da lua','IPhone 180 Pro Max','05.125.432/0001-60','X5yZ3wK1jM6vN0p');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('sT6dWnZ1rYq8xHvP',100.40,2,'Feito de pena de ganso','Travesseiro','05.123.544/0001-61','S7tRfU2iGhE4oD9');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('G2bFmN7oQl4aXeVz',230.10,2,'Playstation 5  PROMO - Desconto de 85%','Ps5 com Controle+jogos','10.601.351/0001-54','L1mN5oP8kY2jT6u');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('KpDcR8fMw6nYsVxL',100.90,2,'Console Massa','Xbox Series XX','90.841.779/0001-13','I3oQ7rZxV9wF4pA');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('Q3aBzW1oPvRlMnXe',400.15,2,'TV samsung 3000 polegadas full HD4k com inteligêcia artificial.','Tv Samsung 3000 Polegadas Full Hd 4K','02.566.224/0001-91','E8gHsK2dCfR1tWn');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('tV6sZx4qHj7NpKfE',500.20,2,'Da melhor qualidade possivel!','Carregador para IPhone 180 Pro Max','05.123.544/0001-61','M6bVzX7qL0yA4oP');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('A9yUcXw2Lp3dRnTg',150.20,2,'Use essa cueca box com led para ganhar mais fps.','Cueca Box Gamer','05.123.544/0001-61','W3uFjN5eZ9rYxT2');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('eS5kHxWmF4nQrVzL',250.99,2,'Molhe seu ar seco ','Humidificador de Ar','05.123.544/0001-61','G4iKpH8tR7wJmF3');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido)
 VALUES ('iG8oNw2lMzYxTqJr',135.20,2,'Este é o produto perfeito pra acabar com uma briga séria','Bomba Nuclear','10.601.351/0001-54','D9sU1vO5nLcA2eQ');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido) 
VALUES ('vE1sXpRmYc7oHwZ2',200.20,2,'Produto para enfiar na casa do amigo e ativar','Míssil','10.601.351/0001-54','C0oVrHwXzYbMlK9');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido) 
VALUES ('Z9xKfPqVc7TgEwLr',400.20,2,'Para explodir tudo','Bomba','10.601.351/0001-54','P8eRmGqT3hS1nZ0');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido) 
VALUES ('dA1sYpWvMzXoHnQr',199.90,2,'Para camperar no combate','Sniper','90.841.779/0001-13','B7fJ6xNtKlO2pV5');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido) 
VALUES ('R8tVwNl4eXcGzHmQ',299.99,2,'Jogue em qualquer lugar','Nintendo ds','90.841.779/0001-13','U9aDvGwH1iRzY8o');
INSERT INTO ItensNoEstoque (CodigoDoProduto, Preco, Quantidade, Descricao, NomeDoProduto, CNPJ_Vendedor, CodigoDoPedido_Pedido) 
VALUES ('I7pKxQs3cHwTlVnE',444.20,2,'Versão mais evoluida do Nintendo Ds','Nintendo 3ds','90.841.779/0001-13','Q2sE5lM3jRcN6hV');

-------------------------------------------------------Consultas com select ----------------------------------------------------------

--Todos compradores
select NomeCompleto, NomeDeUsuario, CPF from Usuario us inner join Comprador co on us.Id = co.Id_Usuario;
--Quantidade de compradores
select count(*) as NumeroComprador from Comprador;

--Todos vendedores
select NomeCompleto, NomeDeUsuario, CNPJ from Usuario us inner join Vendedor ve on us.Id = ve.Id_Usuario;

--Quantidade de vendedores
select count(*) as NumeroVendedor from Vendedor;

--Quantidade de pedidos por comprador
select count(CodigoDoPedido) as Quantidade_De_Compras_Por_Comprador, CPF_Comprador from Pedido group by CPF_Comprador;

--Pedido por Comprador
SELECT
    u.NomeCompleto AS Nome_Comprador,
    p.CPF_Comprador,
    ie.NomeDoProduto AS Nome_Do_Produto,
    ie.Quantidade AS Quantidade,
    p.CodigoDoPedido
FROM
    Usuario u
INNER JOIN
    Comprador c ON u.Id = c.Id_Usuario
INNER JOIN
    Pedido p ON c.CPF = p.CPF_Comprador
INNER JOIN
    ItensNoEstoque ie ON p.CodigoDoPedido = ie.CodigoDoPedido_Pedido;

--RASTREAMENTO
SELECT
    t.CodigoDeRastreamento,
    t.StatusTransportadora,
    t.TaxaDeEnvio,
    p.CodigoDoPedido,
    p.CPF_Comprador
FROM
    Transportadora t
INNER JOIN
    Pedido p ON t.CodigoDoPedido_Pedido = p.CodigoDoPedido;

--pagamento
SELECT
    p.Id,
    p.FormaDePagamento,
    p.CodigoDoPedido_Pedido,
    v.CNPJ AS CNPJ_Vendedor,
    u.NomeCompleto AS Nome_Vendedor
FROM
    Pagamento p
INNER JOIN
    Vendedor v ON p.CNPJ_Vendedor = v.CNPJ
INNER JOIN
    Usuario u ON v.Id_Usuario = u.Id;




--ESTOQUE
SELECT
    i.CodigoDoProduto,
    i.Preco,
    i.Quantidade,
    i.Descricao,
    i.NomeDoProduto,
    i.CNPJ_Vendedor,
    u.NomeCompleto AS Nome_Vendedor
FROM
    ItensNoEstoque i
INNER JOIN
    Vendedor v ON i.CNPJ_Vendedor = v.CNPJ
INNER JOIN
    Usuario u ON v.Id_Usuario = u.Id;
create database AudioTel;

use audiotel;

CREATE TABLE `BancoCliente` (
	id int(10) NOT NULL AUTO_INCREMENT,
    entrevistador varchar(100) NOT NULL,
    dataStatus date NOT NULL,
    horaStatus time NOT NULL,
    telFeito varchar(20) NOT NULL,
    numTratado bool NOT NULL,
    gravacao varchar(100),
    ddd1 varchar(5) NOT NULL,
    fone1 varchar(20) NOT NULL,
    ddd2 varchar(5),
    fone2 varchar(20),
    ddd3 varchar(5),
    fone3 varchar(20),
    ddd4 varchar(5),
    fone4 varchar(20),
    PRIMARY KEY (`id`));
    
CREATE TABLE `Gravacoes` (
	id int(10) NOT NULL AUTO_INCREMENT,
    numero varchar(50) NOT NULL,
    nomeDoArquivo varchar(100) NOT NULL,
    ramal varchar(10) NOT NULL,
    PRIMARY KEY (`id`));    

/*Adicionar coluna*/
ALTER TABLE bancocliente ADD codigo int(11) AFTER id;

ALTER TABLE gravacoes add filePath varchar(100) AFTER fileSize;

ALTER TABLE gravacoes add IdBancoCliente int(11) AFTER id;

show tables;

/*Adicionar chave estrangeira*/
ALTER TABLE `gravacoes` ADD CONSTRAINT `fk_bancocliente` 
	FOREIGN KEY ( `IdBancoCliente` ) REFERENCES `bancocliente` ( `id` );

ALTER TABLE `gravacoes` DROP CONSTRAINT `fk_bancocliente`;

CREATE TABLE Produto (
    ModelID int NOT NULL AUTO_INCREMENT,
    ModelName varchar(25),
PRIMARY KEY (ModelID)
);

CREATE TABLE ProdutoVendido (
    ModelVendidoID int NOT NULL AUTO_INCREMENT,
	ModelID int,
    QuantidadeVendida int,
PRIMARY KEY (ModelVendidoID),
FOREIGN KEY (ModelID) REFERENCES Produto(ModelID));

CREATE TABLE Numero (
    NumberID int NOT NULL AUTO_INCREMENT,
    NumberName int,
PRIMARY KEY (NumberID)
);

CREATE TABLE Cor (
    CorID int NOT NULL AUTO_INCREMENT,
    CorName varchar(25),
PRIMARY KEY (CorID)
);

CREATE TABLE Usuario (
    UserID int NOT NULL AUTO_INCREMENT,
    UserName varchar(25),
PRIMARY KEY (UserID)
);

CREATE TABLE Registros (
    RegistroID int NOT NULL,
    ModelID int,
    NumberID int,
    CorID int,
    UserID int,
    Preco decimal(4,2),
    PRIMARY KEY (RegistroID),
    FOREIGN KEY (ModelID) REFERENCES Produto(ModelID),
    FOREIGN KEY (NumberID) REFERENCES Numero(NumberID),
    FOREIGN KEY (CorID) REFERENCES Cor(CorID),
    FOREIGN KEY (UserID) REFERENCES Usuario(UserID)
);

CREATE TABLE `Estudantes` (
	id int(10) NOT NULL AUTO_INCREMENT,
    nomeDoEstudante varchar(100) NOT NULL,
    curso varchar(50) NOT NULL,
    PRIMARY KEY (`id`));   

/*Alterar Tabela - adicionar campo*/
ALTER TABLE `Estudantes` ADD tel INT(11) AFTER curso;

/*Inserir linha*/
INSERT INTO `Estudantes` (nomeDoEstudante, curso) VALUES ("Antonio", "Tecnologia");

/*Alterar linha*/
SET SQL_SAFE_UPDATES=0;
UPDATE `Estudantes` SET tel = 984444444 WHERE nomeDoEstudante = "Antonio";

ALTER TABLE produtovendido
ADD Cor int;

ALTER TABLE produtovendido
ADD Numero int;


ALTER TABLE produtovendido
ADD CONSTRAINT Numero foreign key (Numero)
REFERENCES numero(NumberID);

select * from registroscor;


ALTER TABLE registros
DROP precovenda;

ALTER TABLE registros
ADD CONSTRAINT ModelVendidoID foreign key (ModelVendidoID)
REFERENCES produtovendido(ModelVendidoID);

ALTER TABLE Registros
CHANGE RegistroID RegistroID int NOT NULL AUTO_INCREMENT;

ALTER TABLE registros
ADD quantidade int;

ALTER TABLE Registros
CHANGE Preco Preco dec(5,2);

ALTER TABLE Numero
CHANGE NumberName Number int;

SET SQL_SAFE_UPDATES=0;
DELETE FROM Produto WHERE ModelName = 'Oxford';

ALTER TABLE Produto
ADD quantidade int;

ALTER TABLE Produto
ADD precocusto dec(4,2);

ALTER TABLE Produtovendido
ADD (Validade varchar(1),Data_Criacao date, Data_fim date);

ALTER TABLE registros
ADD ModelVendidoID int not null;

ALTER TABLE Produto
CHANGE precocusto precocusto dec(5,2);

ALTER TABLE Produtovendido
ADD precovenda dec(4,2);

ALTER TABLE Produtovendido
CHANGE precovenda precovenda dec(5,2);

INSERT INTO Produto (ModelName,quantidade)
VALUES ('Oxford',10);

INSERT INTO Produtovendido (ModelID, QuantidadeVendida, precovenda)
VALUES (2,2,300.00);

select * from registros;

INSERT INTO numero (Number)
VALUES (39);

INSERT INTO cor (CorName)
VALUES ('preto');

INSERT INTO Usuario (Username)
VALUES ('Med');

INSERT INTO cor (ModelName,quantidade)
VALUES ('Oxford',10);

SET SQL_SAFE_UPDATES=0;
UPDATE bancocliente
SET fone3 = 44443322
WHERE telfeito like '1%'; 

UPDATE bancocliente
SET fone3 = 22223344
WHERE telfeito like '2%'; 

UPDATE bancocliente
SET fone3 = 33334422
WHERE telfeito like '3%'; 

UPDATE bancocliente
SET fone3 = 11113322
WHERE telfeito like '4%'; 

SELECT * from Student;

UPDATE produto
SET precocusto = 160.00
WHERE ModelName = 'Oxford'; 

UPDATE produtovendido
SET validade = 'S', Data_Criacao = '2021/04/08'
WHERE ModelId = 2; 

select * from produtovendido;

INSERT INTO registros (ModelID,NumberID,CorID,UserID,ModelVendidoId, quantidade)
VALUES (2,1,1,1,1,2);
UPDATE produtovendido
SET quantidadevendida = quantidadevendida + 2
WHERE ModelID = 2;

select * from produtovendido;
select * from registros;

SET SQL_SAFE_UPDATES=0;
UPDATE gravacoes
SET fileSize = 0 , filepath = 0
WHERE ramal = 136;

-- UPDATE gravacoes
-- SET IdBancoCliente = 1 
-- WHERE ramal LIKE '1%';
-- WHERE ramal LIKE '1%';



select * from Produto;
select * from cor;
select * from numero;
select * from Produtovendido;
select * from registros;
select * from usuario;

select registros.UserID,
	usuario.username,
    produto.ModelName,
    SUM(registros.quantidade)
from registros 
	inner join usuario  
		on registros.UserID = usuario.UserID 
   	inner join produto  
		on registros.modelID = produto.modelID 
where usuario.username LIKE '%med%'

SELECT * FROM studentdb.estudantes;

SELECT MAX(Id) FROM studentdb.estudantes;

INSERT INTO `studentdb`.`estudantes` (`id`, `nomeDoEstudante`, `curso`, `tel`) VALUES ('2', 'Marcio', 'Direito', '544789966');

		select nomeDoEstudante, curso
        from studentdb.estudantes
        where id = 2;
        
SET SQL_SAFE_UPDATES=0;
        
delete from studentdb.estudantes;
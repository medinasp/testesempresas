SELECT * FROM studentdb.clientes;
Delete from studentdb.clientes;

/*
Dada a seguinte tabela denominada CLIENTES:

Nome (CHAR)
Idade (INT)
 
Escreva um comando SQL para selecionar todos os registros que contenham a substring “João” no campo nome e que contenham idades superiores aos 21 anos. 
Os resultados devem estar ordenados por nome em ordem decrescente.
(Assuma que o acesso à base de dados é via ANSI SQL-92)
*/
/*Criação das tabelas com os dados:*/
select * from studentdb.clientes where Nome like "%Joao%" and Idade >= 21 order by Nome desc; 

/*
b.	Dadas as seguintes tabelas: (ver no word)
Escreva uma consulta que apresente os nomes das pessoas e números de conta corrente, somente das pessoas que possuem conta no Banco do Brasil*/

/*Criação das tabelas com os dados:*/
insert into studentdb.bancos (`idBancos`, `Codigo`, `Nome`) VALUES ( 4, 341, "Itau");

insert into studentdb.pessoas (`id`, `CPF`, `Nome`) VALUES ( 3, 66516764743, "Maria dos Santos");

insert into studentdb.conta_corrente (`id`, `Banco`, `Pessoa`, `Numero`) VALUES ( 4, 001, 88208811874, "8120938");

/*Resposta da questão acima*/
select pessoas.Nome, bancos.Nome, conta_corrente.Banco 
from conta_corrente
inner join bancos on conta_corrente.Banco = bancos.Codigo
inner join pessoas on conta_corrente.Pessoa = pessoas.CPF
where conta_corrente.Banco = 1;

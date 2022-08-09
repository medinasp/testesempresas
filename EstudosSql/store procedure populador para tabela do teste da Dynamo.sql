/*
	Essa stored procedure serve para criar uma tabela rapidamente com muitos registros, para fazer testes rápidos e responder questões de tsql em
    recrutamentos remotos.
    
    na variável "LastReg" adaptamos o select colocando o nome do banco, da tabela e do campo id.
    Na variável "idC" colocamos a quantidade de registros que queremos colocar ou acrescentar na tabela que criamos
    Na query "insert into", adaptamos os campos e valores de acordo com o que temos na tabela e o que queremos colocar.
*/


DELIMITER //
CREATE procedure popula2()
begin
    declare idC int(2);
    declare newId int(1);
    declare lastReg int (1);
    declare quantReg int (1);
    declare idade int(1);
    declare varianame varchar(20);
	
    set idade = 12;
    set lastReg = (SELECT MAX(id) FROM studentdb.clientes);
		if lastReg is null then
		set lastReg = 0;
		end if;
	SET idC = 100;
    set quantReg = lastReg + idc -1;
		while lastReg <= quantReg
        do
/*		select nomeDoEstudante, curso
        from studentdb.estudantes
        where id = idc;*/
        set newId = lastReg + 1;
        set varianame = concat(newId, 'Joao');
        insert into studentdb.clientes (`id`, `Nome`, `Idade`) VALUES (newId, "Otavio", idade);
		set newId = newId + 1;
        insert into studentdb.clientes (`id`, `Nome`, `Idade`) VALUES (newId, varianame, idade);
        set idade = idade + 1;
        set lastReg = lastReg + 2;
		end while;
end//
DELIMITER ;

call popula2();
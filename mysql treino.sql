
CREATE DATABASE ALPHA;

USE ALPHA;

CREATE TABLE Funcionario(
	idFuncionario INT NOT NULL auto_increment,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    habilidades VARCHAR(300),
    email VARCHAR(50),
    PRIMARY KEY (idFuncionario)
);
-- inclusão (Create) - INSERT INTO (nome da tabela) (cpf,nome,sobrenome,habilidades,email,etc)
-- incluindo uma coluna na tabela (alter table ''nome da tabela'' add column ''nome da coluna'' tipo do dado
alter table Funcionario add column cpf varchar(11);

insert into funcionario (nome, sobrenome, cpf, habilidades, email)
	-- dando os valores (nome, sobrenome, cpf, habilidades, email)
    values('Luana', 'Santos', '11111111111', 'c#, sql, java, python', 'luanasantos@gmail.com');
    
insert into funcionario (nome, sobrenome, cpf, habilidades, email)
	Values('Alan', 'Santos', '22222222222', 'python, mysql', 'alansantos@gmail.com');
    
-- para ver a tabela
select*from funcionario;
-- * serve para identificar todos os registros

Select nome, habilidades from funcionario where habilidades like '%mysql%';-- pedindo para o mysql filtrar quem tem a habilidade em mysql

select * from funcionario order by nome desc; -- ordenando a lista em ordem descendente

select * from funcionario order by sobrenome asc, nome desc;

select * from funcionario order by nome limit 1; -- pedindo para o mysql me dar apenas 1 nome

update funcionario set habilidades = 'python, mysql, aws' where idfuncionario = 2;

insert into funcionario (nome, sobrenome, cpf, habilidades, email)
values('enzo', 'silva', '33333333333', 'python, mysql', 'enzosilva@gmail.com');
select * from funcionario;
delete from funcionario where idfuncionario = 3; -- deletando uma coluna pelo identificador

select* from funcionario where habilidades like '%sql%' and habilidades like '%aws%';

create table projeto(
	idprojeto int not null auto_increment,
    nome varchar(50) not null,
    descricao varchar(50),
    data_inicio date,
    data_termino date,
    primary key (idprojeto)
);

insert into projeto (nome,descricao,data_inicio,data_termino)
	values('alpha1', 'projeto a', '2023-02-22', null);
    
insert into projeto (nome,descricao,data_inicio,data_termino)
	values('alpha2', 'projeto b', '2023-03-29', null);

select * from projeto;

select * from projeto where data_inicio between '2023-02-01' and '2023-02-28';

insert into funcionario (nome, sobrenome, email, cpf, habilidades)
	values('Caio', 'Santiago', 'caio.s.oliveira@icloud.com', '31698876882', 'aws, sqlite');
select * from funcionario;
update funcionario set habilidades = 'aws, sqlite, mysql' where idfuncionario = 3;

select* from funcionario where habilidades like '%aws%';
delete from funcionario where idfuncionario = 3;

insert into funcionario (nome, sobrenome, email, cpf, habilidades)
	values ('Caio', 'Santiago', 'caio.s.oliveira@icloud.com', '31698876882', 'aws, sqlite, sql');
select * from funcionario



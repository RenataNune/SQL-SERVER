CREATE DATABASE db_Redesocial2

use master
drop database db_Redesocial2

USE db_Redesocial2

CREATE TABLE tb_Usuarios(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Nickname VARCHAR(20) NULL,
	Email VARCHAR(100) NULL,
	Senha VARCHAR(20) NOT NULL
)

CREATE TABLE tb_Publicacoes(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Tema VARCHAR(50) NULL,
	Titulo VARCHAR(50) NULL,
	Descricao VARCHAR(500) NULL,
	Foto VARCHAR(50) NULL,
	Fk_Usuario INT NOT NULL,
	FOREIGN KEY (Fk_Usuario) REFERENCES tb_Usuarios (Id)
)

CREATE TABLE tb_Grupos(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Nomegrupo VARCHAR(50) NULL,
	Fotogrupo VARCHAR(100) NULL,
	Segmento VARCHAR(50) NULL,
	FK_Usuario INT NOT NULL,
	FK_Publicacao INT NOT NULL,
	FOREIGN KEY (FK_Usuario) REFERENCES tb_Usuarios (Id),
	FOREIGN KEY (FK_Publicacao) REFERENCES tb_Publicacoes (Id)
)


-- INSERTS
INSERT INTO tb_Usuarios 
VALUES
('Rodrigo da Silva Franca', 'RDG99', 'rodrigo@email.com', 'password123'),
('Nickole Bueno', 'Princesinha1993', 'nickole@email.com', 'password321'),
('Erick Chiappone', 'Chiapp', 'erick@email.com', 'password234'),
('Gustavao', '', '', 'password579')

INSERT INTO tb_Publicacoes
VALUES
('Copa do Brasil', 'Corinthians VS Portuguesa RJ', 'Achei a escalacao muito jovem. E voces?', '',1),
('', '', '', '',2)

INSERT INTO tb_Grupos 
VALUES
('Post 1','','Futebol',1,1),
('Post 2','','Esporte',2,1)

--DELETA TODOS OS DADOS DA TABELA USUARIO
DELETE FROM tb_Usuarios

--ZERA O INCREMENTO DA TABELA USUARIO
DBCC CHECKIDENT (tb_Usuarios, RESEED, 0)

--MOSTRA O INCREMENTO ATUAL DA TABELA USUARIO
SELECT IDENT_CURRENT('tb_Usuarios')

-- FULL JOIN
SELECT tb_Usuarios.Id  AS Usuario, tb_Usuarios.Nome, tb_Usuarios.Email, tb_Usuarios.Senha, tb_Publicacoes.Tema AS Publicação, tb_Publicacoes.Id, tb_Publicacoes.Descricao
FROM tb_Usuarios  
FULL JOIN tb_Publicacoes
ON tb_Usuarios.Id = tb_Publicacoes.Fk_Usuario

-- IN
SELECT * FROM tb_Publicacoes
WHERE Id IN (2)

-- COUNT e LIKE
SELECT COUNT(tb_Publicacoes.Titulo) AS 'Publicações sobre Portuguesa'
FROM tb_Publicacoes
WHERE tb_Publicacoes.Titulo LIKE ('%Portuguesa%')
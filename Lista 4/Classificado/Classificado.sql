CREATE DATABASE db_Classificado2

USE db_Classificado2

CREATE TABLE tb_usuario
(
	id_usuario INT PRIMARY KEY IDENTITY NOT NULL,
	nome VARCHAR(50) NULL,
	senha VARCHAR(50) NULL,
	email VARCHAR(100) NULL,
	telefone VARCHAR(11) NULL,
	endereco VARCHAR(200) NULL
)

CREATE TABLE tb_desafio
(
	id_desafio INT PRIMARY KEY IDENTITY NOT NULL,
	nota FLOAT NULL,
	classificacao INT NULL,
	descricao VARCHAR(200),
)

CREATE TABLE tb_classificado
(
	id_classificado INT PRIMARY KEY IDENTITY NOT NULL,
	fk_candidato INT NOT NULL,
	fk_resultado INT NOT NULL,
	FOREIGN KEY (fk_candidato) REFERENCES tb_usuario (id_usuario),
	FOREIGN KEY (fk_resultado) REFERENCES tb_desafio (id_desafio)
)

-- INSERTS

INSERT INTO tb_usuario
VALUES
('Nickole','nick@email.com','12345','Rua Laranjais - 123'),('Gustavo','guse@email.com','12345','Rua Anhanguera - 123'),('Gabriel','gabs@email.com','12345','Rua Brasil - 123'),('Naomy','nao@email.com','12345','Rua Pessegos - 123')

INSERT INTO tb_desafio
VALUES
(9.7,2,'Classificado'),
(9,7,'Classificado'),
(5.5,45,'Desclassificado'),
(3,69,'Desclassificado')

INSERT INTO tb_classificado
VALUES
(1,1),
(2,2),
(3,3),
(4,4)

-- SELECTS

SELECT COUNT(tb_desafio.nota) AS 'Total Notas',
	AVG(tb_desafio.nota)AS 'Media'
	FROM tb_desafio

SELECT
tb_usuario.nome AS Nome,
tb_classificado.id_classificado AS ID_Classificação
FROM tb_usuario
RIGHT JOIN tb_classificado
ON tb_usuario.id_usuario = tb_classificado.fk_candidato;
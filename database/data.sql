CREATE DATABASE PROJETO02;
SHOW DATABASES;
USE PROJETO02;

DROP TABLE RELATORIO;
DROP TABLE CATRACA;
DROP TABLE ALUNOS;

SHOW TABLES;

CREATE TABLE ALUNOS (
    MATRICULA INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    CPF VARCHAR (15) NOT NULL UNIQUE,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    ALTURA INT NOT NULL,
    PESO INT NOT NULL
);

SELECT * FROM ALUNOS;
TRUNCATE ALUNOS;

CREATE TABLE CATRACA (
    ID_CATRACA INT AUTO_INCREMENT PRIMARY KEY,
    ID_ALUNO INT NOT NULL,
    HORARIO_INICIO DATETIME NOT NULL,
    HORARIO_SAIDA DATETIME NULL,
    FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS(MATRICULA)
);


SELECT * FROM CATRACA;
TRUNCATE CATRACA;

CREATE TABLE RELATORIO (
    ID_RELATORIO INT AUTO_INCREMENT PRIMARY KEY,
    ID_ALUNO INT NOT NULL,
    HORAS_TOTAIS TIME NOT NULL DEFAULT '00:00:00',
    HORAS_SEMANAIS TIME NOT NULL DEFAULT '00:00:00',
    CLASSIFICACAO VARCHAR(50) NOT NULL DEFAULT 'Iniciante',
    CONSTRAINT FK_ALUNO_HORAS
        FOREIGN KEY (ID_ALUNO)
        REFERENCES ALUNOS (MATRICULA)
);
SELECT * FROM RELATORIO;
TRUNCATE RELATORIO;




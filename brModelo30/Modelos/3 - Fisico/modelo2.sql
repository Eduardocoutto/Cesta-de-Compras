-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE pais (
ID_pais NUMERIC(10) PRIMARY KEY,
nome VARCHAR(50)
)

CREATE TABLE estado (
ID_esta NUMERIC(10) PRIMARY KEY,
ID_pais NUMERIC(10),
nome VARCHAR(50),
FOREIGN KEY(ID_pais) REFERENCES pais (ID_pais)
)

CREATE TABLE cidade (
ID_cida NUMERIC(10) PRIMARY KEY,
ID_esta NUMERIC(10),
nome VARCHAR(50),
FOREIGN KEY(ID_esta) REFERENCES estado (ID_esta)
)

CREATE TABLE avaliacao sistema (
nota DECIMAL(1),
comentario VARCHAR(250)
)

CREATE TABLE endere�o (
ID_ende NUMERIC(10) PRIMARY KEY,
ID_cida NUMERIC(10),
bairro VARCHAR(20),
cep CHAR(8),
logradouro VARCHAR(100),
n� INTEGER,
complemento VARCHAR(50),
FOREIGN KEY(ID_cida) REFERENCES cidade (ID_cida)
)

CREATE TABLE supermecado (
ID_supe NUMERIC(10) PRIMARY KEY,
ID_ende NUMERIC(10),
nome VARCHAR(20),
unidade VARCHAR(20),
logo BIGINT(10),
FOREIGN KEY(ID_ende) REFERENCES endere�o (ID_ende)
)

CREATE TABLE pessoa (
ID_pess VARCHAR(10) PRIMARY KEY,
ID_ende NUMERIC(10),
nome VARCHAR(30),
login VARCHAR(10),
senha VARCHAR(10),
nivel DECIMAL(10),
FOREIGN KEY(ID_ende) REFERENCES endere�o (ID_ende)
)

CREATE TABLE telefone (
telefone_PK NUMERIC() PRIMARY KEY,
telefone CHAR(14)
)

CREATE TABLE e-mail (
e-mail_PK NUMERIC() PRIMARY KEY,
ID_pess_FK VARCHAR(),
e-mail VARCHAR(20),
FOREIGN KEY(ID_pess_FK) REFERENCES pessoa (ID_pess)
)

CREATE TABLE lista de compras (
ID_list NUMERIC(10) PRIMARY KEY,
ID_pess VARCHAR(10),
nome VARCHAR(15),
dataCria SMALLDATETIME,
dataFim SMALLDATETIME,
dataLemb SMALLDATETIME,
FOREIGN KEY(ID_pess) REFERENCES pessoa (ID_pess)
)

CREATE TABLE avalia (
nota DECIMAL(1),
Atributo2 VARCHAR(250),
ID_supe VARCHAR(10),
ID_pord VARCHAR(10),
ID_pess VARCHAR(10)/*falha: chave estrangeira*//*falha: chave estrangeira*//*falha: chave estrangeira*/
)

CREATE TABLE venda (
ID_supe NUMERIC(10),
ID_pord NUMERIC(10),
valido VARCHAR(10),
pre�o VARCHAR(10),
FOREIGN KEY(ID_supe) REFERENCES supermecado (ID_supe)
)

CREATE TABLE venda_atacado (
ID_supe NUMERIC(10),
ID_pord NUMERIC(10),
valido INTEGER,
pre�o VARCHAR(10),
quantidade VARCHAR(10),
FOREIGN KEY(ID_supe) REFERENCES supermecado (ID_supe)
)

CREATE TABLE contem (
ID_list NUMERIC(10),
ID_pord NUMERIC(10),
PRIMARY KEY(ID_list,ID_pord)
)

CREATE TABLE produto (
ID_pord NUMERIC(10) PRIMARY KEY,
nome VARCHAR(20),
tamanho INTEGER,
marca VARCHAR(10),
validado VARCHAR(10),
tipoMedida VARCHAR(10),
quantidade VARCHAR(10),
possui_ID_pord NUMERIC()
)

ALTER TABLE venda ADD FOREIGN KEY(ID_pord) REFERENCES produto (ID_pord)
ALTER TABLE venda_atacado ADD FOREIGN KEY(ID_pord) REFERENCES produto (ID_pord)

CREATE TABLE IF NOT EXISTS pais (
ID_pais INT PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS estado (
ID_esta INT PRIMARY KEY,
ID_pais INT,
nome VARCHAR(100),
FOREIGN KEY(ID_pais) REFERENCES pais (ID_pais) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS cidade (
ID_cida INT PRIMARY KEY,
ID_esta INT,
nome VARCHAR(100),
FOREIGN KEY(ID_esta) REFERENCES estado (ID_esta) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bairro (
ID_bair INT PRIMARY KEY,
ID_cida INT,
nome VARCHAR(100),
FOREIGN KEY(ID_cida) REFERENCES cidade (ID_cida) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS avaliacao_sistema (
nota INT,
comentario VARCHAR(250)
);

CREATE TABLE IF NOT EXISTS endereco (
ID_ende INT PRIMARY KEY,
ID_bair INT,
cep CHAR(8),
logradouro VARCHAR(100),
numero INTEGER,
complemento VARCHAR(100),
FOREIGN KEY(ID_bair) REFERENCES bairro (ID_bair) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS supermercado (
ID_supe INT PRIMARY KEY,
ID_ende INT,
nome VARCHAR(100),
unidade VARCHAR(100),
logo INT NULL,
FOREIGN KEY(ID_ende) REFERENCES endereco (ID_ende) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pessoa (
ID_pess INT PRIMARY KEY,
ID_ende INT,
nome VARCHAR(100),
login VARCHAR(50),
senha VARCHAR(50),
nivel INT,
data_nas DATE,
FOREIGN KEY(ID_ende) REFERENCES endereco (ID_ende) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS tipo_contato (
ID_tcon INT PRIMARY KEY,
tipo VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS contato (
ID_pess INT,
ID_tcon INT,
descricao VARCHAR(70),
FOREIGN KEY (ID_pess) REFERENCES pessoa (ID_pess) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ID_tcon) REFERENCES tipo_contato (ID_tcon) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS lista_de_compras (
ID_list INT PRIMARY KEY,
ID_pess INT,
nome VARCHAR(100),
dataCria DATE,
dataFim DATE,
dataLemb DATE,
FOREIGN KEY(ID_pess) REFERENCES pessoa (ID_pess) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS produto (
ID_prod INT PRIMARY KEY,
nome VARCHAR(100),
tamanho INT NULL,
marca VARCHAR(100) NULL,
validado INT,
tipoMedida VARCHAR(10),
possui_ID_prod INT NULL
);

CREATE TABLE IF NOT EXISTS avalia (
nota INT,
Atributo2 VARCHAR(250),
ID_supe INT NULL,
ID_prod INT NULL,
ID_pess INT NULL,
FOREIGN KEY(ID_supe) REFERENCES supermercado (ID_supe) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ID_pess) REFERENCES pessoa (ID_pess) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY(ID_prod) REFERENCES produto (ID_prod) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS venda (
ID_supe INT,
ID_prod INT,
valido INT,
preco MONEY,
FOREIGN KEY(ID_supe) REFERENCES supermercado (ID_supe) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ID_prod) REFERENCES produto (ID_prod) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS venda_atacado (
ID_supe INT,
ID_prod INT,
valido INT,
preco MONEY,
quantidade INT,
FOREIGN KEY(ID_supe) REFERENCES supermercado (ID_supe) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ID_prod) REFERENCES produto (ID_prod) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS contem (
ID_list INT,
ID_prod INT,
quantidade INT,
PRIMARY KEY(ID_list, ID_prod),
FOREIGN KEY(ID_list) REFERENCES lista_de_compras (ID_list) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ID_prod) REFERENCES produto (ID_prod) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);

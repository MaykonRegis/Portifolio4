-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Pet (
id_pet INT NOT NULL AUTO_INCREMENT,
nome_pet VARCHAR(10),
tipo_pet VARCHAR(10),
idade_pet DATE,
sexo_pet ENUM('M','F'),
PRIMARY KEY(id_pet)
);

CREATE TABLE Cadastro_Cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
id_tutor INT NOT NULL,
id_pet INT NOT NULL,
id_dispositivo INT NOT NULL,
PRIMARY KEY(id_cliente),
FOREIGN KEY(id_tutor) REFERENCES tutor_pet(id_tutor),
FOREIGN KEY(id_pet) REFERENCES pet(id_pet),
FOREIGN KEY(id_dispositivo) REFERENCES rastreador(id_dispositivo) 
);

CREATE TABLE Rastreador (
id_dispositivo INT NOT NULL AUTO_INCREMENT,
Datahora DATETIME,
Localização_Georreferenciadas VARCHAR(10),
Data_ativação DATE,
PRIMARY KEY(id_dispositivo)
);

CREATE TABLE Tutor_Pet (
id_tutor INT NOT NULL AUTO_INCREMENT,
nome_tutor VARCHAR(10),
usuario VARCHAR(10),
endereço VARCHAR(50),
sexo ENUM('M', 'F'), 
senha VARCHAR(10),
PRIMARY KEY(id_tutor)
);

CREATE TABLE Depende (
id_cliente INT NOT NULL,
id_pet INT NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES Cadastro_Cliente (id_cliente),
FOREIGN KEY(id_pet) REFERENCES pet(id_pet)
);

CREATE TABLE Ativa (
id_dispositivo INT NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY(id_dispositivo) REFERENCES rastreador(id_dispositivo),
FOREIGN KEY(id_cliente) REFERENCES Cadastro_Cliente (id_cliente)
);

CREATE TABLE Cadastra (
id_cliente INT NOT NULL,
id_tutor INT NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES Cadastro_Cliente (id_cliente),
FOREIGN KEY(id_tutor) REFERENCES Tutor_Pet (id_tutor)
);

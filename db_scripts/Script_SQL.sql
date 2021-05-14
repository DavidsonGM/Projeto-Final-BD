-- ============================= Criação do Banco de Dados =============================
DROP DATABASE IF EXISTS RPG;
CREATE DATABASE RPG DEFAULT CHARACTER SET utf8mb4 ;
USE RPG;

CREATE TABLE Arma (
  Nome VARCHAR(45) PRIMARY KEY,
  Tipo VARCHAR(45) NOT NULL,
  Durabilidade INT NOT NULL,
  Dano INT NOT NULL,
  Raridade VARCHAR(45) NOT NULL);

CREATE TABLE Armadura (
  Nome VARCHAR(45) PRIMARY KEY,
  Durabilidade INT NOT NULL,
  Proteção INT NOT NULL,
  Raridade VARCHAR(45) NOT NULL);

CREATE TABLE Atributo (
  IdAtributo INT PRIMARY KEY AUTO_INCREMENT,
  Pontos_Vida INT NOT NULL,
  Pontos_Mana INT NOT NULL,
  Nível INT NOT NULL,
  Defesa INT NOT NULL,
  Dano INT NOT NULL);

CREATE TABLE Classe (
  Nome VARCHAR(45) PRIMARY KEY,
  Raça VARCHAR(45) NOT NULL);

CREATE TABLE Dungeon (
  Nome VARCHAR(45) PRIMARY KEY,
  Local VARCHAR(45) NOT NULL);

CREATE TABLE Efeitos_Dungeon (
  Nome VARCHAR(45) NOT NULL,
  Dungeon_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Nome, Dungeon_FK),
  FOREIGN KEY (Dungeon_FK) REFERENCES Dungeon(Nome));

CREATE TABLE Habilidade (
  Nome VARCHAR(45) PRIMARY KEY,
  Efeito VARCHAR(45) NOT NULL,
  Nível INT NOT NULL,
  Custo INT NOT NULL);

CREATE TABLE Habilidades_Classe (
  Classe_FK VARCHAR(45) NOT NULL,
  Habilidade_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Classe_FK, Habilidade_FK),
  FOREIGN KEY (Classe_FK) REFERENCES Classe (Nome),
  FOREIGN KEY (Habilidade_FK) REFERENCES Habilidade (Nome));

CREATE TABLE Monstro (
  Raça VARCHAR(45) PRIMARY KEY,
  Tipo VARCHAR(45) NOT NULL,
  Atributo_FK INT NOT NULL,
  FOREIGN KEY (Atributo_FK) REFERENCES Atributo (IdAtributo));

CREATE TABLE Habilidades_Monstro (
  Habilidade_FK VARCHAR(45) NOT NULL,
  Monstro_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Habilidade_FK, Monstro_FK),
  FOREIGN KEY (Habilidade_FK) REFERENCES Habilidade (Nome),
  FOREIGN KEY (Monstro_FK) REFERENCES Monstro (Raça));
  
CREATE TABLE NPC (
  Nome VARCHAR(45) PRIMARY KEY,
  Profissão VARCHAR(45) NULL,
  Local VARCHAR(45) NOT NULL,
  História TEXT(1000) NULL);

CREATE TABLE Missão (
  Nome VARCHAR(45) PRIMARY KEY,
  Experiencia INT NOT NULL,
  Local VARCHAR(45) NOT NULL,
  Descrição TEXT(100) NULL,
  Recompensa VARCHAR(45),
  NPC_FK VARCHAR(45) NOT NULL,
  FOREIGN KEY (NPC_FK) REFERENCES NPC (Nome));

CREATE TABLE Missões_Dungeon (
  Missão_FK VARCHAR(45) NOT NULL,
  Dungeon_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Missão_FK, Dungeon_FK),
  FOREIGN KEY (Missão_FK) REFERENCES Missão (Nome),
  FOREIGN KEY (Dungeon_FK) REFERENCES Dungeon (Nome));

CREATE TABLE Personagem (
  Nome VARCHAR(45) PRIMARY KEY,
  Idade INT NOT NULL,
  Arma_FK VARCHAR(45) NULL,
  Armadura_FK VARCHAR(45) NULL,
  Atributo_FK INT NOT NULL,
  Classe_FK VARCHAR(45) NOT NULL,
  Foto LONGBLOB NULL,
  FOREIGN KEY (Arma_FK) REFERENCES Arma (Nome),
  FOREIGN KEY (Armadura_FK) REFERENCES Armadura (Nome),
  FOREIGN KEY (Atributo_FK) REFERENCES Atributo (IdAtributo),
  FOREIGN KEY (Classe_FK) REFERENCES Classe (Nome));
    
CREATE TABLE Missões_Personagem (
  Personagem_FK VARCHAR(45) NOT NULL,
  Missão_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Personagem_FK, Missão_FK),
  FOREIGN KEY (Personagem_FK) REFERENCES Personagem (Nome),
  FOREIGN KEY (Missão_FK) REFERENCES Missão (Nome));

CREATE TABLE Monstros_Dungeon (
  Monstro_FK VARCHAR(45) NOT NULL,
  Dungeon_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Monstro_FK, Dungeon_FK),
  FOREIGN KEY (Monstro_FK) REFERENCES Monstro (Raça),
  FOREIGN KEY (Dungeon_FK) REFERENCES Dungeon (Nome));

CREATE TABLE Poção (
  Nome VARCHAR(45) PRIMARY KEY,
  Efeito VARCHAR(45) NOT NULL,
  Duração INT NULL,
  Raridade VARCHAR(45) NOT NULL);

CREATE TABLE Poções_Personagem (
  Poção_FK VARCHAR(45) NOT NULL,
  Personagem_FK VARCHAR(45) NOT NULL,
  PRIMARY KEY (Poção_FK, Personagem_FK),
  FOREIGN KEY (Poção_FK) REFERENCES Poção (Nome),
  FOREIGN KEY (Personagem_FK) REFERENCES Personagem (Nome));

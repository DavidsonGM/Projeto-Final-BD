-- ============================= Criação do Banco de Dados =============================

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
  IdAtributo INT PRIMARY KEY,
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
  Nome VARCHAR(45) PRIMARY KEY,
  Dungeon_FK VARCHAR(45) NOT NULL,
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
  Recompensa VARCHAR(45) NOT NULL,
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

-- ============================= Inserção de Registros no Banco de Dados =============================

INSERT INTO Arma values ("Gume do Infinito", "Espada", 100, 150, "Lendária");
INSERT INTO Arma values ("Abraço de Seraph", "Cajado", 200, 110, "Rara");
INSERT INTO Arma values ("Furacão de Runaan", "Arco", 90, 200, "Épica");

INSERT INTO Armadura values ("Capa de Fogo Solar", 110, 100, "Normal");
INSERT INTO Armadura values ("Armadura de Warmog", 200, 200, "Épica");
INSERT INTO Armadura values ("Armadura de Espinhos", 150, 150, "Rara");

INSERT INTO Atributo values(0, 100, 50, 0, 10, 40);
INSERT INTO Atributo values(1, 80, 100, 2, 70, 20);
INSERT INTO Atributo values(2, 300, 50, 10, 100, 70);

INSERT INTO Classe values("Guerreiro", "Orc");
INSERT INTO Classe values("Mago", "Elfo");
INSERT INTO Classe values("Ladino", "Humano");

INSERT INTO Dungeon values("Shurima", "Summoners Rift");
INSERT INTO Dungeon values("Bandle City", "Desconhecido");
INSERT INTO Dungeon values("Void", "Vazio");

INSERT INTO Habilidade values("Restauração", "Cura", 1, 20);
INSERT INTO Habilidade values("Fúria", "Dano", 2, 40);
INSERT INTO Habilidade values("Lockpick", "Invasão", 5, 100);

INSERT INTO Habilidades_Classe values("Guerreiro", "Fúria");
INSERT INTO Habilidades_Classe values("Mago", "Restauração");
INSERT INTO Habilidades_Classe values("Ladino", "Lockpick");

INSERT INTO Monstro values("Humano", "Normal", 0);
INSERT INTO Monstro values("Elfo", "Épico", 1);
INSERT INTO Monstro values("Orc", "Boss", 2);

INSERT INTO Habilidades_Monstro values("Lockpick", "Humano");
INSERT INTO Habilidades_Monstro values("Restauração", "Elfo");
INSERT INTO Habilidades_Monstro values("Fúria", "Orc");

INSERT INTO NPC values("Faendal", "Arqueiro", "Riverwood", "Faendal é um arqueiro");
INSERT INTO NPC values("Sven", "Bardo", "Riverwood", "Swen é um bardo");
INSERT INTO NPC values("Balgruuf", "Jarl", "Whiterun", NULL);

INSERT INTO Missão values("Mate o boss", 100, "Shurima", "Mate o monstro em shurima", 200, "Faendal");
INSERT INTO Missão values("Roube a loja", 50, "Bandle City", "Roube a loja de Bandle City", 500, "Sven");
INSERT INTO Missão values("Mate o minion", 150, "Vazio", "Mate um minion do vazio", 0, "Sven");

INSERT INTO Missões_Dungeon values("Mate o boss", "Shurima");
INSERT INTO Missões_Dungeon values("Roube a loja", "Bandle City");
INSERT INTO Missões_Dungeon values("Mate o minion", "Void");

INSERT INTO Personagem values("Dovahkiin", 20, NULL, NULL, 0, "Guerreiro");
INSERT INTO Personagem values("Ryze", 100, "Abraço de Seraph", NULL, 0, "Mago");
INSERT INTO Personagem values("Katarina", 25, "Furacão de Runaan", "Armadura de Warmog", 2,"Ladino");

INSERT INTO Missões_Personagem values("Dovahkiin", "Mate o boss");
INSERT INTO Missões_Personagem values("Dovahkiin", "Roube a loja");
INSERT INTO Missões_Personagem values("Ryze", "Mate o minion");

INSERT INTO Monstros_Dungeon values("Humano", "Bandle City");
INSERT INTO Monstros_Dungeon values("Orc", "Shurima");
INSERT INTO Monstros_Dungeon values("Elfo", "Void");

INSERT INTO Poção values("Poção de Vida", "Cura", NULL, "Normal");
INSERT INTO Poção values("Poção de Dano", "Dano", 60, "Normal");
INSERT INTO Poção values("Poção de Invisibilidade", "Invisibilidade", 180, "Raro");

INSERT INTO Poções_Personagem values ("Poção de Vida", "Dovahkiin");
INSERT INTO Poções_Personagem values ("Poção de Invisibilidade", "Dovahkiin");
INSERT INTO Poções_Personagem values ("Poção de Dano", "Ryze");
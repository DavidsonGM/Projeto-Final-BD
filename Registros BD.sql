use RPG;

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
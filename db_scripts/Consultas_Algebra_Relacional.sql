USE RPG;

SELECT Raça, Nível, Nome as Dungeon FROM Atributo
RIGHT JOIN Monstro on Atributo_FK = IdAtributo
LEFT JOIN Monstros_Dungeon on Monstro_FK = Raça
LEFT JOIN Dungeon on Dungeon_FK = Nome
WHERE Nível > 5;

SELECT Personagem.Nome as Personagem,
Arma.Nome AS Arma,
Classe.Nome AS Classe
FROM Arma
RIGHT JOIN Personagem on Arma_FK = Arma.Nome
LEFT JOIN Classe on Classe_FK = Classe.Nome;

SELECT Classe.Nome as Classe, Habilidade.Nome as Habilidade
FROM Classe
RIGHT JOIN Habilidades_Classe on Classe_FK = Classe.Nome
LEFT JOIN Habilidade on Habilidade_FK = Habilidade.Nome;

SELECT Poção.nome as Poção, Efeito, Duração, Raridade,
Personagem.nome as Comprador, Idade as Idade_Comprador
FROM Poção
LEFT JOIN Poções_Personagem on Poção.nome = Poção_FK
LEFT JOIN Personagem on Personagem_FK = Personagem.Nome
WHERE Raridade != "Normal";

SELECT Missão.Nome as Quest, Experiencia,
Missão.Local, Descrição, Recompensa,
NPC.Nome as NPC, Dungeon.Nome as Dungeon FROM NPC
RIGHT JOIN Missão on NPC.Nome = NPC_FK
LEFT JOIN Missões_Dungeon on Missão.Nome = Missão_FK
LEFT JOIN Dungeon on Dungeon_FK = Dungeon.Nome;

-- Create procedure (DAno da arma + dano atributo, dano defesa + defesa armadura)
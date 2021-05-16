USE RPG;

DROP view if exists Personagens_Sven;
create view Personagens_Sven as select 
	Personagem.nome as Personagem, Classe_FK, Pontos_Vida, Pontos_Mana, Nível, Arma_FK,
    Armadura_FK, Defesa, Dano, Missão.Nome as Missão, Dungeon.Nome as Dungeon
    FROM Atributo
    RIGHT JOIN Personagem on Atributo_FK = IdAtributo
    LEFT JOIN Missões_Personagem on Personagem_FK = Personagem.Nome
    LEFT JOIN Missão on Missões_Personagem.Missão_FK = Missão.Nome
    LEFT JOIN Missões_Dungeon on Missões_Dungeon.Missão_FK = Missão.Nome
    LEFT JOIN Dungeon on Dungeon_FK = Dungeon.Nome
    WHERE NPC_FK = "Sven";
    
select * from Personagens_Sven;

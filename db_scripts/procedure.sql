USE RPG;

DROP PROCEDURE IF EXISTS Batalha;
DELIMITER //
CREATE PROCEDURE Batalha(IN rounds INT, p VARCHAR(45), m VARCHAR(45))
BEGIN
	SET @armadura = (SELECT Proteção FROM Armadura
					INNER JOIN Personagem on Armadura_FK = Armadura.Nome 
                    WHERE Personagem.Nome = p);
                    
	SET @arma = (SELECT Dano FROM Arma
					INNER JOIN Personagem on Arma_FK = Arma.Nome 
                    WHERE Personagem.Nome = p);
                    
	SET @dano_causado = (SELECT CASE WHEN (p.Dano + @arma - m.Defesa) > 0 
									THEN p.Dano + @arma - m.Defesa
									ELSE 0
								END
                        FROM Atributo p
						INNER JOIN Personagem on Personagem.Atributo_FK = p.IdAtributo
						CROSS JOIN Monstro
						INNER JOIN Atributo m on Monstro.Atributo_FK = m.IdAtributo
						WHERE Nome = p and Raça = m);
                        
    SET @dano_recebido = (SELECT CASE WHEN (m.Dano - @armadura - p.Defesa) > 0 
									  THEN m.Dano - @armadura - p.Defesa
									  ELSE 0
							     END
						  FROM Atributo p
						  INNER JOIN Personagem on Personagem.Atributo_FK = p.IdAtributo
						  CROSS JOIN Monstro
						  INNER JOIN Atributo m on Monstro.Atributo_FK = m.IdAtributo
						  WHERE Nome = p and Raça = m);                    


	SELECT "Antes da Batalha" as Round, Nome as Personagem, p.Pontos_Vida as Vida_Personagem,
    p.Defesa + @armadura as Defesa_Personagem, p.Dano + @arma as Dano_Personagem,
    Raça as Monstro, m.Pontos_Vida as Vida_Monstro,
    m.Defesa as Defesa_Monstro, m.Dano as Dano_Monstro
    FROM Atributo p
	INNER JOIN Personagem on Personagem.Atributo_FK = p.IdAtributo
    CROSS JOIN Monstro
    INNER JOIN Atributo m on Monstro.Atributo_FK = m.IdAtributo
	WHERE Nome = p and Raça = m
    
	UNION
    
   	SELECT INSERT("Após o Round  ", 14, 0, rounds) as Round, Nome as Personagem,
    CASE WHEN(p.Pontos_Vida - @dano_recebido*rounds) > 0
		 THEN p.Pontos_Vida - @dano_recebido*rounds
         ELSE 0
    END as Vida_Personagem,
    p.Defesa + @armadura as Defesa_Personagem, p.Dano + @arma as Dano_Personagem,
    Raça as Monstro,
    CASE WHEN(m.Pontos_Vida - @dano_causado*rounds) > 0
	     THEN m.Pontos_Vida - @dano_causado*rounds 
         ELSE 0 
    END as Vida_Monstro,
    m.Defesa as Defesa_Monstro, m.Dano as Dano_Monstro
    FROM Atributo p
	INNER JOIN Personagem on Personagem.Atributo_FK = p.IdAtributo
    CROSS JOIN Monstro
    INNER JOIN Atributo m on Monstro.Atributo_FK = m.IdAtributo
	WHERE Nome = p and Raça =  m;
END
//

call Batalha(1, "Jinx", "Goblin");

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
	

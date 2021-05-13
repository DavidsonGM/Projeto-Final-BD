from persistence_layer import Table
import os

def BaseScreen(text, options = []):
    os.system("clear")
    print("="*50)
    print(" "*int((50 - len(text))/2) + text)
    print("="*50)

    if options:
        for i in range(len(options)):
            print(f"[{i+1}] {options[i]}")

def ShowRows(rows, options):
    for col_name in options:
        print(f"| {col_name.upper()}", end = "")
    print(" |\n")

    for i in range(len(rows)):
        for j in range(len(rows[0])):
            print('| ', rows[i][j], ' ',end = '')
        print("\n")

def ReturnSreen(screen):
    print("\n[1] Retornar")
    while(True):
        digit = int(input("\nDigite um número: "))

        if digit == 1:
            if screen == "Arma":
                ArmaScreen()
                return
            if screen == "Armadura":
                ArmaduraScreen()
                return
            if screen == "Personagem":
                PersonagemScreen()
                return
            if screen == "Classe":
                ClasseScreen()
                return
            if screen == "Atributo":
                AtributoScreen()
                return

def CrudScreen(table_name_singular, table_name_plural, params):
    digit = int(input("\nDigite um número: "))

    if digit == 1:
        BaseScreen(f"LISTA DE {table_name_plural.upper()}")
        table = Table(table_name_singular.capitalize())
        rows = table.Select()
        table.Close()

        ShowRows(rows, params)
        ReturnSreen(table_name_singular.capitalize())
        return
        
    if digit == 2:
        BaseScreen(f"CRIAR {table_name_singular.upper()}")
        input_params = []           

        for i in range(len(params)):
            tmp = input(f"Digite {params[i].lower()}: ")
            if tmp == '\n':
                input_params.append(None)
            else:
                input_params.append(tmp)

        table = Table(table_name_singular.capitalize())
        result = table.Create(input_params)
        table.Close()

        os.system("clear")
        if result == 1:
            print(f"{table_name_singular.upper()} CRIADA COM SUCESSO")
        else:
            print("ERRO AO CRIAR ", table_name_singular.upper())
        ReturnSreen(table_name_singular.capitalize())
        return


    if digit == 3:
        BaseScreen(f"ATUALIZAR {table_name_singular.upper()}")

        row_id = input(f"Digite {params[0]}: ")
        col_name = input("Digite o nome do atributo a ser alterado: ")
        set_value  = input("Digite o novo valor: ")

        table = Table(table_name_singular.capitalize())
        result = table.Update((col_name, set_value, row_id))
        table.Close()

        os.system("clear")
        if result == 1:
            print(f"{table_name_singular.upper()} ATUALIZADA COM SUCESSO")
        else:
            print("ERRO AO ATULIZAR ", table_name_singular.upper())
        ReturnSreen(table_name_singular.capitalize())
        return
        
    if digit == 4:
        BaseScreen(f"DELETAR {table_name_singular.upper()}")

        row_id = input(f"Digite {params[0]}: ")
        table = Table(table_name_singular.capitalize())
        result = table.Delete(row_id)
        table.Close()

        os.system("clear")
        if result == 1:
            print(f"{table_name_singular.upper()} DELETADA COM SUCESSO")
        else:
            print(f"ERRO AO DELETAR {table_name_singular.upper()}")
        ReturnSreen(table_name_singular.capitalize())
        return

    if digit == 5:
        InitialScreen()
        return

def ArmaScreen():
    BaseScreen("ARMAS", ("Mostar Armas", "Criar Arma", "Atualizar Arma", "Deletar Arma", "Retornar"))
    CrudScreen("arma", "armas", ("nome", "tipo", "durabilidade", "dano", "raridade"))

def ArmaduraScreen():
    BaseScreen("ARMADURAS", ("Mostar Armaduras", "Criar Armadura", "Atualizar Armadura", "Deletar Armadura", "Retornar"))
    CrudScreen("armadura", "armaduras", ("nome", "durabilidade", "proteção", "raridade"))

def ClasseScreen():
    BaseScreen("CLASSES", ("Mostar Classes", "Criar Classe", "Atualizar Classe", "Deletar Classe", "Retornar"))
    CrudScreen("classe", "classes", ("nome", "raça"))

def PersonagemScreen():
    BaseScreen("PERSONAGEM", ("Mostar Personagens", "Criar Personagem", "Atualizar Personagem", "Deletar Personagem", "Retornar"))
    CrudScreen("personagem", "personagens", ("nome", "idade", "arma", "armadura", "atributo", "classe"))

def AtributoScreen():
    BaseScreen("ATRIBUTO", ("Mostar Atributos", "Criar Atributo", "Atualizar Atributo", "Deletar Atributo", "Retornar"))
    CrudScreen("atributo", "atributos", ("idatributo", "pontos de vida", "pontos de mana", "nível", "defesa", "dano"))

def InitialScreen():
    BaseScreen("CRUD TABELAS", ("Armas", "Armaduras", "Classe", "Atributo","Personagem", "Sair"))
    digit = int(input("\nDigite um número: "))

    if digit == 1:
        ArmaScreen()
        return
    if digit == 2:
        ArmaduraScreen()
        return
    if digit == 3:
        ClasseScreen()
        return
    if digit == 4:
        AtributoScreen()
        return
    if digit == 5:
        PersonagemScreen()
        return
    if digit == 6:
        return

InitialScreen()
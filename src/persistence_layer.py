import mysql.connector as mysql
from mysql.connector import Error
from credentials import Credentials
    
class Table:
    def __init__(self, table_name):
        try:
            credentials = Credentials()
            self.connection = mysql.connect(host = 'localhost', 
                                            database = 'RPG', 
                                            user = f'{credentials.username}', 
                                            password = f'{credentials.password}')
            self.cursor = self.connection.cursor()
            self.table_name = table_name

        except Error as error:
           print("Error while connecting to MySQL", error)
        
    def Select(self):
        try:
            self.cursor.reset()
            sql_query = f"select * from {self.table_name}"
            self.cursor.execute(sql_query)
            records = self.cursor.fetchall()
            
        except Error as error:
           print(f"Error while selecting table {self.table_name}", error)

        finally:
            return records

    def Create(self, params):
        try:
            self.cursor.reset()
            sql_query = f"insert into {self.table_name} values ("
            for value in params:
                if value:
                    sql_query += f"'{value}',"
                else:
                    sql_query += f"NULL,"
            sql_query = sql_query[:-1] + ")"
            self.cursor.execute(sql_query)
            self.connection.commit()

        except Error as error:
            print(f"Error while inserting values into table {self.table_name}", error)

        finally:
            return self.cursor.rowcount

    def Update(self, params):
        try:
            col_name = params[0]
            set_value = params[1]
            row_id = params[2]
            
            self.cursor.reset()
            primary_key_name =  self.__FindPrimaryKey(self.table_name)

            sql_query = f"update {self.table_name} set {col_name} = '{set_value}' where {primary_key_name} = '{row_id}'"
            self.cursor.execute(sql_query)
            self.connection.commit()

        except Error as error:
           print(f"Error while updating col {col_name} from table {self.table_name}", error)

        finally:
            return self.cursor.rowcount

    def Delete(self, row_id):
        try:
            self.cursor.reset()
            primary_key_name =  self.__FindPrimaryKey(self.table_name)
            sql_query = f"delete from {self.table_name} where {primary_key_name} = '{row_id}'"
            self.cursor.execute(sql_query)
            self.connection.commit()

        except Error as error:
           print(f"Error while deleting row from table {self.table_name}", error)

        finally:
            return self.cursor.rowcount

    def Close(self):
        try:
            self.cursor.close()
            self.connection.close()
            return True
        except Error as error:
           print(f"Error while closing connection", error)

    def __FindPrimaryKey(self, table_name):
        try:
            self.cursor.reset()
            sql_query = f"show keys from {table_name} where Key_name = 'PRIMARY'"
            self.cursor.execute(sql_query)
            records = self.cursor.fetchone()

        except Error as error:
           print(f"Error while finding primary key from table {table_name}", error)
        
        finally:
            return records[4]
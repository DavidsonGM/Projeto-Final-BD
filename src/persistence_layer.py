import mysql.connector as mysql
from mysql.connector import Error
from credentials import Credentials
    
class Database:
    def __init__(self, database):
        try:
            credentials = Credentials()
            self.connection = mysql.connect(host = 'localhost', 
                                            database = f'{database}', 
                                            user = f'{credentials.username}', 
                                            password = f'{credentials.password}')
            self.cursor = self.connection.cursor()

        except Error as error:
            raise print("Error while connecting to MySQL", error)
        
    def SelectTable(self, table_name):
        try:
            self.cursor.reset()
            sql_query = f"select * from {table_name}"
            self.cursor.execute(sql_query)
            records = self.cursor.fetchall()
            
        except Error as error:
            raise print(f"Error while selecting table {table_name}", error)

        finally:
            return records

    def InsertRow(self, table_name, params):
        try:
            self.cursor.reset()
            sql_query = f"insert into {table_name} values ("
            for value in params:
                sql_query += f"'{value}',"
            sql_query = sql_query[:-1] + ")"
            self.cursor.execute(sql_query)
            self.connection.commit()

        except Error as error:
            raise print(f"Error while inserting values into table {table_name}", error)

        finally:
            return self.cursor.rowcount

    def UpdateRow(self, table_name, col_name, set_value, row_id):
        try:
            self.cursor.reset()
            primary_key_name =  self.__FindPrimaryKey(table_name)

            sql_query = f"update {table_name} set {col_name} = '{set_value}' where {primary_key_name} = '{row_id}'"
            self.cursor.execute(sql_query)
            self.connection.commit()

        except Error as error:
            raise print(f"Error while updating col {col_name} from table {table_name}", error)

        finally:
            return self.cursor.rowcount

    def DeleteRow(self, table_name, row_id):
        try:
            self.cursor.reset()
            primary_key_name =  self.__FindPrimaryKey(table_name)
            sql_query = f"delete from {table_name} where {primary_key_name} = '{row_id}'"
            self.cursor.execute(sql_query)
            self.connection.commit()

        except Error as error:
            raise print(f"Error while deleting row from table {table_name}", error)

        finally:
            return self.cursor.rowcount

    def Close(self):
        if self.connection.is_connected():
            self.cursor.close()
            self.connection.close()
            print("MySQL connection is closed")

    def __FindPrimaryKey(self, table_name):
        try:
            self.cursor.reset()
            sql_query = f"show keys from {table_name} where Key_name = 'PRIMARY'"
            self.cursor.execute(sql_query)
            records = self.cursor.fetchone()

        except Error as error:
            raise print(f"Error while finding primary key from table {table_name}", error)
        
        finally:
            return records[4]
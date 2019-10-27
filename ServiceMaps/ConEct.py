from config import DbData as DbD
import psycopg2 as pg2
import sys

class ConEct(object):
    '''Manejo de conexiones PostgreSQL'''

    def __init__(self,dbData = DbD):
        '''
        Constructor 

        :type dbData: dict
        :param dbData: diccionario de conexión
        '''
        self.dbData = dbData

    def db_connect(self):
        '''Conecta a PostgreSQL regresando
        conector y cursor'''
        try:
            conn  = pg2.connect(**self.dbData)
            print("Conecte con PstgreSQL")
        except:
            sys.exit("No me es posible conectar a PostgreSQL")
        cursor = conn.cursor()
        return conn, cursor

    def db_close(self, conn):
        '''
        Desconecta cursor y base de datos

        :type conn: PostgreSQL.connections.Connection
        :param conn: Conexión PostgreSQL 
        '''
        conn.close()

if __name__ == "__main__":
    pass



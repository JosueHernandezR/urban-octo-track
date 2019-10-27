#!/usr/bin/env python3
from ConEct import ConEct
import time

class Qrys(object):
    '''
    class for get or set data to the postgress db
    '''

    def __init__(self):
            #create connector and cursor for postgres
            self.CE = ConEct()
            self.psqlconn, self.cur = self.CE.db_connect()

    def __del__(self):
            #close connection
            self.CE.db_close(self.psqlconn)

    def getWidget(self):
            SQL = ('SELECT id, macaddress from device_tracker') 
            self.cur.execute(SQL)
            rows = self.cur.fetchall()
            return rows

    def updateWidget(self, trackerList):
            SQL = ("UPDATE device_tracker set latitud='{0}', longitud='{1}' where macaddress='{2}'".format(*trackerList)) 
            self.cur.execute(SQL)
            self.psqlconn.commit()

if __name__ == "__main__":
    pass



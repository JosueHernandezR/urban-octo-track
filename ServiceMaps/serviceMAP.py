from threading import Timer, Thread, Event
from datetime import datetime
import Qrys
import requests
import time

class PT():

    def __init__(self, t, hFunction):
        self.t = t
        self.hFunction = hFunction
        self.thread = Timer(self.t, self.handle_function)

    def handle_function(self):
        self.hFunction()
        self.thread = Timer(self.t, self.handle_function)
        self.thread.start()

    def start(self):
        self.thread.start()

def apiGet(api):
    return requests.get(url='https://aruba.easygetpaid.com/hackathon/'+api)

qrys = Qrys.Qrys()
def updateAddress():
    devices = qrys.getWidget()
    response = apiGet('tenants/').json()
    direcciones = []
    accesspoints = list()
    clients = list()
    serialDevice = list()
    for item in response:
        direcciones.append(item['customer_id'])
    for direccion in direcciones:
        response = apiGet('tenants/'+direccion+'/sites').json()
        for item in response:
            keys = ['serial', 'latitude', 'longitude']
            datos = [item['serial'],item['latitude'],item['longitude']]
            accesspoints.append(dict(zip(keys,datos)))
    for direccion in direcciones:
        response = apiGet('tenants/'+direccion+'/clients').json()
        for item in response:
            keys = ['serial', 'macAdd']
            datos = [item['associated_device'],item['macaddr']]
            clients.append(dict(zip(keys,datos)))
    #print(clients)
    for item in devices:
        for client in clients:
            if item[1]==client['macAdd']:
                serialDevice.append(client)
    print(serialDevice)
    for item in serialDevice:
        for acp in accesspoints:
            if item['serial']==acp['serial']:
                qrys.updateWidget([acp['latitude'],acp['longitude'],item['macAdd']])
                print("Actualize"+str(item['macAdd'])+"latitud"+str(acp['latitude'])+"Longitud: "+str(acp['longitude']))
    time.sleep(3)

t = PT(1, updateAddress)
t.start()
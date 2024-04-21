from abc import ABC, abstractmethod
from time import sleep
import math
import threading

class Carrera(ABC):

    bicicletas = []

    def __init__(self, bicicletas, porcentaje):
        self.bicicletas = bicicletas
        self.porcentaje = porcentaje

    @abstractmethod
    def __deepcopy__(self, memo):
        pass
    
    def add_bicicleta(self, bicicleta):
        self.bicicletas.append(bicicleta)

    def iniciar_carrera(self, name):
        print("Carrera", name, " "*26, "[Thread_ID] =",threading.get_native_id(),"[Thread_name] =",threading.current_thread().name)
        
        sleep(2)
        
        num_bicis = len(self.bicicletas)
        retirar_n_bicis = math.ceil(self.porcentaje*num_bicis)

        for i in range(retirar_n_bicis):
            self.bicicletas.pop()
        
        print("Carrera finalizada por", len(self.bicicletas), "bicis", " "*15, "[Thread_ID] =",threading.get_native_id(),"[Thread_name] =",threading.current_thread().name)
    
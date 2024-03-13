from abc import ABC, abstractmethod
from time import sleep
import math

class Carrera(ABC):

    bicicletas = []

    def __init__(self, bicicletas, porcentaje):
        self.bicicletas = bicicletas
        self.porcentaje = porcentaje
    
    def add_bicicleta(self, bicicleta):
        self.bicicletas.append(bicicleta)

    def iniciar_carrera(self, name):
        print("Carrera iniciada por el hilo ", name)
        
        sleep(2)
        
        num_bicis = len(self.bicicletas)
        retirar_n_bicis = math.ceil(self.porcentaje*num_bicis)

        for i in range(retirar_n_bicis):
            self.bicicletas.pop()
        
        print("Carrera finalizada")
        print("Han acabado la carrera: ", len(self.bicicletas))
from abc import ABC, abstractmethod

class FactoriaCarreraBicicleta(ABC):
    
    @abstractmethod
    def crear_carrera(self):
        pass

    @abstractmethod
    def crear_bicicleta(self):
        pass
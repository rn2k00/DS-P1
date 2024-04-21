from abc import ABC, abstractmethod
from Bocata import Bocata

class BocataBuilder(ABC):
    
    def __init__(self):
        self.bocata = None

    def create_new_bocata(self):
        self.bocata = Bocata()

    @abstractmethod
    def add_ingredientes(self):
        pass

    @abstractmethod
    def tipo_pan(self):
        pass

    @abstractmethod
    def tamano_bocata(self):
        pass
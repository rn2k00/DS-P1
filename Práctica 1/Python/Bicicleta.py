from abc import ABC, abstractmethod

class Bicicleta(ABC):

    def __init__(self, tipo="none"):
        self.tipo = tipo

    @abstractmethod
    def any_function(self):
        pass
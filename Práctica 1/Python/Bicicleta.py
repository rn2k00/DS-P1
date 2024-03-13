from abc import ABC, abstractmethod

class Bicicleta(ABC):

    def __init__(self, id):
        self.id = id

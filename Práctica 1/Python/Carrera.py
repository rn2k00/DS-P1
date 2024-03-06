from abc import ABC, abstractmethod

class Carrera(ABC):

    def __init__(self, modalidad="none"):
        self.modalidad = modalidad

from abc import ABC, abstractmethod
from Pizza import Pizza

class PizzaBuilder(ABC):
    
    def __init__(self):
        self.pizza = None

    def create_new_pizza(self):
        self.pizza = Pizza()

    @abstractmethod
    def add_ingredientes(self):
        pass

    @abstractmethod
    def add_salsa(self):
        pass

    @abstractmethod
    def tamano_pizza(self):
        pass

    @abstractmethod
    def tipo_masa(self):
        pass
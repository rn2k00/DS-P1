from Bicicleta import Bicicleta
from copy import deepcopy

class BicicletaMontana(Bicicleta):

    def __init__(self, id):
        super().__init__(id)
    
    def __deepcopy__(self, memo):
        new = BicicletaMontana(deepcopy(self.id, memo))
        return new
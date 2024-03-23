from Bicicleta import Bicicleta
from copy import deepcopy

class BicicletaCarretera(Bicicleta):

    def __init__(self, id):
        super().__init__(id)

    def __deepcopy__(self, memo):
        new = BicicletaCarretera(deepcopy(self.id, memo))
        return new
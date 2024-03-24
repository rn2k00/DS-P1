from Carrera import Carrera
from copy import deepcopy

class CarreraCarretera(Carrera):

    def __init__(self, bicicletas, porcentaje):
        super().__init__(bicicletas, porcentaje)

    def __deepcopy__(self, memo):
        new = CarreraCarretera(deepcopy(self.bicicletas, memo), deepcopy(self.porcentaje, memo))
        return new
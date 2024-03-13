from FactoriaCarreraBicicleta import FactoriaCarreraBicicleta
from CarreraMontana import CarreraMontana
from BicicletaMontana import BicicletaMontana

class FactoriaMontana(FactoriaCarreraBicicleta):

    def crear_carrera(self, bicicletas):
        return CarreraMontana(bicicletas)

    def crear_bicicleta(self, id):
        return BicicletaMontana(id)
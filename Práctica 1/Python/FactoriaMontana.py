from FactoriaCarreraBicicleta import FactoriaCarreraBicicleta
from CarreraMontana import CarreraMontana
from BicicletaMontana import BicicletaMontana

class FactoriaMontana(FactoriaCarreraBicicleta):

    def crear_carrera(self):
        return CarreraMontana()

    def crear_bicicleta(self):
        return BicicletaMontana()
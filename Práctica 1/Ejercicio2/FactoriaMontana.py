from FactoriaCarreraBicicleta import FactoriaCarreraBicicleta
from CarreraMontana import CarreraMontana
from BicicletaMontana import BicicletaMontana

class FactoriaMontana(FactoriaCarreraBicicleta):

    def crear_carrera(self, bicicletas, porcentaje):
        return CarreraMontana(bicicletas, porcentaje)

    def crear_bicicleta(self, id):
        return BicicletaMontana(id)
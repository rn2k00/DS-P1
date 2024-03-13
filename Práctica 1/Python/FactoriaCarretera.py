from FactoriaCarreraBicicleta import FactoriaCarreraBicicleta
from CarreraCarretera import CarreraCarretera
from BicicletaCarretera import BicicletaCarretera

class FactoriaCarretera(FactoriaCarreraBicicleta):

    def crear_carrera(self):
        return CarreraCarretera()

    def crear_bicicleta(self):
        return BicicletaCarretera()
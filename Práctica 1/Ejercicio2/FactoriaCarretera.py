from FactoriaCarreraBicicleta import FactoriaCarreraBicicleta
from CarreraCarretera import CarreraCarretera
from BicicletaCarretera import BicicletaCarretera

class FactoriaCarretera(FactoriaCarreraBicicleta):

    def crear_carrera(self, bicicletas, porcentaje):
        return CarreraCarretera(bicicletas, porcentaje)

    def crear_bicicleta(self, id):
        return BicicletaCarretera(id)
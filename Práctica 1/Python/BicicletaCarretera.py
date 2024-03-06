from Bicicleta import Bicicleta

class BicicletaCarretera(Bicicleta):

    def __init__(self, tipo="carretera"):
        super().__init__(tipo)
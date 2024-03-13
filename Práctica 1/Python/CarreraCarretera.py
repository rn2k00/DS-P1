from Carrera import Carrera

class CarreraCarretera(Carrera):

    def __init__(self, modalidad="carretera"):
        print("Creando carrera de carretera")
        super().__init__(modalidad)
from Carrera import Carrera

class CarreraMontana(Carrera):
    
    def __init__(self, modalidad="montana"):
        print("Creando carrera de montaña")
        super().__init__(modalidad)
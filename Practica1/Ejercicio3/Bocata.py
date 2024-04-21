class Bocata:
    def __init__(self):
        self.ingredientes = {}
        self.pan = None
        self.tamano = None

    def __str__ (self):
        return f"Bocata\n Ingredientes: {self.ingredientes}\n Pan: {self.pan}\n Tamaño: {self.tamano}"

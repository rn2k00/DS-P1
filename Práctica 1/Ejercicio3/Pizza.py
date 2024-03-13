class Pizza:
    def __init__(self):
        self.ingredientes = {}
        self.salsa = None
        self.masa = None
        self.tamano = None

    def __str__ (self):
        return f"Pizza\n Ingredientes: {self.ingredientes}\n Salsa: {self.salsa}\n Masa: {self.masa}\n Tamaño: {self.tamano}"

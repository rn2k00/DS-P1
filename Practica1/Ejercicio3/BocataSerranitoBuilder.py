from BocataBuilder import BocataBuilder

class BocataSerranitoBuilder(BocataBuilder):

    def add_ingredientes(self):
        self.bocata.ingredientes = {'tomate', 'aceite', 'jamon serrano', 'pimiento'}

    def tipo_pan(self):
        self.bocata.pan = 'casero'

    def tamano_bocata(self):
        self.bocata.tamano = 'mediano'
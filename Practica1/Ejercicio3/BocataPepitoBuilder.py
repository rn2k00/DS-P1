from BocataBuilder import BocataBuilder

class BocataPepitoBuilder(BocataBuilder):

    def add_ingredientes(self):
        self.bocata.ingredientes = {'lechuga', 'tomate', 'lomo', 'mayonesa'}

    def tipo_pan(self):
        self.bocata.pan = 'baguette'

    def tamano_bocata(self):
        self.bocata.tamano = 'grande'
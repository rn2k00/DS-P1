from BocataBuilder import BocataBuilder

class BocataCalamaresBuilder(BocataBuilder):

    def add_ingredientes(self):
        self.bocata.ingredientes = {'mayonesa', 'calamares fritos'}

    def tipo_pan(self):
        self.bocata.pan = 'artesano'

    def tamano_bocata(self):
        self.bocata.tamano = 'mediano'
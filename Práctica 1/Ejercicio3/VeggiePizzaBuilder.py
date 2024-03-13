from PizzaBuilder import PizzaBuilder

class VeggiePizzaBuilder(PizzaBuilder):

    def add_ingredientes(self):
        self.pizza.ingredientes = {'tomate', 'queso vegano', 'champiñones', 'rúcula'}

    def add_salsa(self):
        self.pizza.salsa = 'salsa pesto'

    def tamano_pizza(self):
        self.pizza.tamano = 'mediana'

    def tipo_masa(self):
        self.pizza.masa = 'fina'
from PizzaBuilder import PizzaBuilder

class InfantilPizzaBuilder(PizzaBuilder):

    def add_ingredientes(self):
        self.pizza.ingredientes = {'queso', 'jamon york'}

    def add_salsa(self):
        self.pizza.salsa = 'salsa casera de tomate'

    def tamano_pizza(self):
        self.pizza.tamano = 'pequeño'

    def tipo_masa(self):
        self.pizza.masa = 'normal'
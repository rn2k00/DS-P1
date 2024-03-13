from PizzaBuilder import PizzaBuilder

class BBQPizzaBuilder(PizzaBuilder):

    def add_ingredientes(self):
        self.pizza.ingredientes = {'tomate', 'queso', 'bacon', 'cebolla', 'jamon york'}

    def add_salsa(self):
        self.pizza.salsa = 'salsa barbacoa'

    def tamano_pizza(self):
        self.pizza.tamano = 'mediana'

    def tipo_masa(self):
        self.pizza.masa = 'normal con bordes rellenos de queso'
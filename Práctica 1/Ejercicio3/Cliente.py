
class Cliente:
    def __init__(self, PizzaBuilder):
        self._pizzaBuilder = PizzaBuilder

    def build_pizza(self):
        self._pizzaBuilder.create_new_pizza()
        self._pizzaBuilder.add_ingredientes()
        self._pizzaBuilder.add_salsa()
        self._pizzaBuilder.tamano_pizza()
        self._pizzaBuilder.tipo_masa()

class Director:
    def __init__(self, builder):
        self._builder = builder

    def build_food(self, food):
        if (food == 'Pizza'):
            self._builder.create_new_pizza()
            self._builder.add_ingredientes()
            self._builder.add_salsa()
            self._builder.tamano_pizza()
            self._builder.tipo_masa()
        else:
            self._builder.create_new_bocata()
            self._builder.add_ingredientes()
            self._builder.tipo_pan()
            self._builder.tamano_bocata()

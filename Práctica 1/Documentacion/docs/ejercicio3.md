# Patrón libre: patrón Builder.

## Planteamiento del problema
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    En este ejercicio hemos decidido utilizar el <strong>patrón Builder</strong>, en concreto, tenemos el <em>PizzaBuilder</em> y el <em>BocataBuilder</em>. De esta forma el director puede elegir si hacer una pizza o un bocata, y el constructor correspondiente crea el tipo de alimento que se quiere. Así se consigue separar la representación del objeto <em>Pizza</em> o <em>Bocata</em>, de su construcción llevada a cabo por los builders. 
    </p>
</div>

## Diagrama de diseño
<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    El constructor <em>PizzaBuilder</em> se encarga de crear tres tipos distintos de pizzas: <em>PizzaInfantilBuilder</em>, <em>VeggiePizzaBuilder</em> y <em>BBQPizzaBuilder</em>. Estas pizzas son representadas por la clase <em>Pizza</em> cuyos atributos son los ingredientes, salsa, tipo de masa y tamaño de la pizza.
    </p>
    <p>
    El constructor <em>BocataBuilder</em> es muy parecido pero permite crear distintos tipos de bocatas y son representados por la clase <em>Bocata</em>.
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/Diagrama-P3.png">
    <p class="leyenda" style = 'margin:0px'><strong>Ilustración X</strong>. Diagrama de diseño, ejercicio 3.</p>
</div>

## Solución del problema
<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    Para simplificar se va a detallar la estructura de la familia de objetos bocatas, empezando por la clase <strong>BocataBuilder</strong> que es una clase abstracta encargada de constriur el objeto <em>Bocata</em> y tiene tres métodos abstractos que implementarán sus subclases. Se evitará incluir las importaciones de módulos para no extender la memoria. 
    </p>
</div>

```python
class BocataBuilder(ABC):
    
    def __init__(self):
        self.bocata = None

    def create_new_bocata(self):
        self.bocata = Bocata()

    @abstractmethod
    def add_ingredientes(self):
        pass

    @abstractmethod
    def tipo_pan(self):
        pass

    @abstractmethod
    def tamano_bocata(self):
        pass
```

<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    Luego tenemos las subclases <strong>BocataSerranitoBuilder</strong>, <strong>BocataCalamaresBuilder</strong> y <strong>BocataPepitoBuilder</strong> que heredan de la clase <strong>BocataBuilder</strong> y que se encargan de iniciarlizar los atributos especificos del objeto bocata. En el siguiente fragmento de código se puede visualizar dicha inicialización por parte del <em>BocataSerranitoBuilder</em>.
    </p>
</div>

```python
class BocataSerranitoBuilder(BocataBuilder):

    def add_ingredientes(self):
        self.bocata.ingredientes = {'aceite', 'tomate', 'jamon serrano', 
                                    'lomo', 'pimiento'}

    def tipo_pan(self):
        self.bocata.pan = 'casero'

    def tamano_bocata(self):
        self.bocata.tamano = 'mediano'
```

<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    La clase <strong>Bocata</strong> representa el objeto complejo final y tiene un método <em>str</em> para describir las propiedades del objeto, más adelante se expondrán ejemplos de la salida.
    </p>
</div>

```python
class Bocata:
    def __init__(self):
        self.ingredientes = {}
        self.pan = None
        self.tamano = None

    def __str__ (self):
        return f"Bocata\n Ingredientes: {self.ingredientes}\n 
                 Pan: {self.pan}\n Tamaño: {self.tamano}"
```

<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    La clase <strong>Director</strong> es quien decide que se construya la <em>Pizza</em> o el <em>Bocata</em> y llama al builder concreto que se le haya pasado como parámetro en su constructor. 
    </p>
</div>

```python
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
```

<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    Por último, en el programa principal <strong>main.py</strong> se inicializa el constructor concreto, por ejemplo, el <em>BBQPizzaBuilder</em>, luego se crea el Director pasandole el builder, se construye la pizza y, finalmente, se imprime la descripción del objeto.
    </p>
</div>

```python
if __name__ == "__main__":

    print("-------------------------------------------------------------------------")
    print("Pidiendo una pizza de barbacoa y un serranito...")
    print("-------------------------------------------------------------------------")

    BBQBuilder = BBQPizzaBuilder()
    pedido3 = Director(BBQBuilder)
    pedido3.build_food('Pizza')
    print(BBQBuilder.pizza)

    print("-------------------------------------------------------------------------")

    BocataSerranito = BocataSerranitoBuilder()
    pedido6 = Director(BocataSerranito)
    pedido6.build_food('Bocata')
    print(BocataSerranito.bocata)

    print("-------------------------------------------------------------------------")
```
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La salida del programa principal es la siguiente:
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/e3main.png" width="70%">
    <p class="leyenda"><strong>Ilustración X</strong>. Salida programa main.py.</p>
</div>

## Conflictos encontrados
En esta ocasión no hemos encontrado dificultades a la hora de resolver el ejercicio propuesto. Este patrón es un patrón creacional fácil de comprender e implementar.
from Cliente import Cliente
from InfantilPizzaBuilder import InfantilPizzaBuilder
from VeggiePizzaBuilder import VeggiePizzaBuilder
from BBQPizzaBuilder import BBQPizzaBuilder

if __name__ == "__main__":
    
    InfantilBuilder = InfantilPizzaBuilder()
    cliente1 = Cliente(InfantilBuilder)
    cliente1.build_pizza()
    print(InfantilBuilder.pizza)

    VeggieBuilder = VeggiePizzaBuilder()
    cliente2 = Cliente(VeggieBuilder)
    cliente2.build_pizza()
    print(VeggieBuilder.pizza)

    BBQBuilder = BBQPizzaBuilder()
    cliente2 = Cliente(BBQBuilder)
    cliente2.build_pizza()
    print(BBQBuilder.pizza)

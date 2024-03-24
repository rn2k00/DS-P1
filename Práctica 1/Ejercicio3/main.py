from Director import Director
from InfantilPizzaBuilder import InfantilPizzaBuilder
from VeggiePizzaBuilder import VeggiePizzaBuilder
from BBQPizzaBuilder import BBQPizzaBuilder
from BocataCalamaresBuilder import BocataCalamaresBuilder
from BocataPepitoBuilder import BocataPepitoBuilder
from BocataSerranitoBuilder import BocataSerranitoBuilder

if __name__ == "__main__":

    print("----------------------------------------------------------------------------------------------")
    print("Pidiendo una pizza de barbacoa y un serranito...")
    print("----------------------------------------------------------------------------------------------")

    """ InfantilBuilder = InfantilPizzaBuilder()
    pedido1 = Director(InfantilBuilder)
    pedido1.build_food('Pizza')
    print(InfantilBuilder.pizza)

    print("----------------------------------------------------------------------------------------------")

    VeggieBuilder = VeggiePizzaBuilder()
    pedido2 = Director(VeggieBuilder)
    pedido2.build_food('Pizza')
    print(VeggieBuilder.pizza)

    print("----------------------------------------------------------------------------------------------") """

    BBQBuilder = BBQPizzaBuilder()
    pedido3 = Director(BBQBuilder)
    pedido3.build_food('Pizza')
    print(BBQBuilder.pizza)

    print("----------------------------------------------------------------------------------------------")

    """ BocataCalamares = BocataCalamaresBuilder()
    pedido4 = Director(BocataCalamares)
    pedido4.build_food('Bocata')
    print(BocataCalamares.bocata)

    print("----------------------------------------------------------------------------------------------")

    BocataPepito = BocataPepitoBuilder()
    peiddo5 = Director(BocataPepito)
    peiddo5.build_food('Bocata')
    print(BocataPepito.bocata)

    print("----------------------------------------------------------------------------------------------")
 """
    BocataSerranito = BocataSerranitoBuilder()
    pedido6 = Director(BocataSerranito)
    pedido6.build_food('Bocata')
    print(BocataSerranito.bocata)

    print("----------------------------------------------------------------------------------------------")
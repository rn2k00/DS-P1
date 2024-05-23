import 'package:flutter_test/flutter_test.dart';
import '../lib/ejercicioGrupo.dart';

void main() {
  group('Test builders and objects', () {

    test('Build two specific builders', () {
      late PizzaBuilder builder;
      builder = BBQPizzaBuilder();

      late Pizza pizza1;
      late Pizza pizza2;
      pizza1 = builder.CreateNewPizza();
      expect(pizza1.salsa, "Barbacoa" );

      builder = VeggiePizzaBuilder();
      pizza2 = builder.CreateNewPizza();
      expect(pizza2.salsa, "Salsa pesto");
    });

    test('PizzaBuilder and BocataBuilder are diferents', () {
      late PizzaBuilder builder;
      builder = BBQPizzaBuilder();

      expect(builder, isNot(equals(BocataBuilder)));
    });

    test('Creating Pizza and Bocata', () {
      PizzaBuilder infantilBuilder = InfantilPizzaBuilder();
      Pizza infantilPizza = infantilBuilder.CreateNewPizza();

      BocataBuilder serranitoBuilder = BocataSerranitoBuilder();
      Bocata serranitoBocata = serranitoBuilder.CreateNewBocata();

      expect(infantilPizza.runtimeType, Pizza);
      expect(serranitoBocata.runtimeType, Bocata);
    });

    test('Pizza and Bocata are diferents', () {
      var infantilBuilder = InfantilPizzaBuilder();
      var infantilPizza = infantilBuilder.CreateNewPizza();

      var serranitoBuilder = BocataSerranitoBuilder();
      var serranitoBocata = serranitoBuilder.CreateNewBocata();

      expect(infantilPizza, isNot(equals(serranitoBocata)));
    });

    test('Serranito, check ingredients, type of bread and size', () {
      var serranitoBuilder = BocataSerranitoBuilder();
      var serranitoBocata = serranitoBuilder.CreateNewBocata();

      var ingredientes = <String>["tomate", "aceite", "jamon serrano", "pimiento"];

      expect(serranitoBocata.ing, ingredientes);
      expect(serranitoBocata.pan, "casero");
      expect(serranitoBocata.tamanio, "mediano");
    });

    test('InfantilPizza, check ingredients, type of bread and size', () {
      var infantilBuilder = InfantilPizzaBuilder();
      var infantilPizza = infantilBuilder.CreateNewPizza();

      var ingredientes = <String>["queso", "jamon york"];

      expect(infantilPizza.ing, ingredientes);
      expect(infantilPizza.tipoMasa, "normal");
      expect(infantilPizza.salsa, "Salsa casera de tomate");
      expect(infantilPizza.tamanio, "pequeña");
    });

  });
}
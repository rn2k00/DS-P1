import 'package:flutter_test/flutter_test.dart';
import '../lib/ejercicioGrupo.dart';

void main() {
  group('Test builders and objects', () {

    test('Build two specific builders', () {
      var bbqPizza = BBQPizzaBuilder();
      var veggiePizza = VeggiePizzaBuilder();

      expect(bbqPizza, isA<PizzaBuilder>());
      expect(veggiePizza, isA<PizzaBuilder>());
    });

    test('PizzaBuilder and BocataBuilder are diferents', () {
      var bbqPizza = BBQPizzaBuilder();
      var calamaresBocata = BocataCalamaresBuilder();

      expect(bbqPizza, isNot(equals(calamaresBocata)));
    });

    test('Creating Pizza and Bocata', () {
      var infantilBuilder = InfantilPizzaBuilder();
      var infantilPizza = infantilBuilder.CreateNewPizza();

      var serranitoBuilder = BocataSerranitoBuilder();
      var serranitoBocata = serranitoBuilder.CreateNewBocata();

      expect(infantilPizza, isA<Pizza>());
      expect(serranitoBocata, isA<Bocata>());
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
      expect(serranitoBocata.nombre, "Serranito");
    });

    test('InfantilPizza, check ingredients, type of bread and size', () {
      var infantilBuilder = InfantilPizzaBuilder();
      var infantilPizza = infantilBuilder.CreateNewPizza();

      var ingredientes = <String>["queso", "jamon york"];

      expect(infantilPizza.ing, ingredientes);
      expect(infantilPizza.tipoMasa, "normal");
      expect(infantilPizza.salsa, "Salsa casera de tomate");
      expect(infantilPizza.tamanio, "pequeña");
      expect(infantilPizza.nombre, "Infantil");
    });

  });
}
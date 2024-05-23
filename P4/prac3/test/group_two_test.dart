//Ejecutar con: flutter test test/group_two_test.dart

import 'package:flutter_test/flutter_test.dart';
//import '../lib/ejercicioGrupo.dart';

void main(){
  group('GRUPO 2', () {

    test('Especificaciones de Veggie', () {
      var veggieBuilder = VeggiePizzaBuilder();
      var veggiePizza = veggieBuilder.CreateNewPizza();

      var ingredientes = <String>["tomate", "queso vegano", "champiñones", "rúcula"];

      expect(veggiePizza.ing, ingredientes);
      expect(veggiePizza.tipoMasa, "fina");
      expect(veggiePizza.salsa, "Salsa pesto");
      expect(veggiePizza.tamanio, "mediana");
      expect(veggiePizza.nombre, "Veggie");
    });

     test('Comprobar si se agregan los ingredientes a la pizza', () {
      var bbqBuilder = BBQPizzaBuilder();
      bbqBuilder.AddIngredientes();
      var bbqPizza = bbqBuilder.pi;

      expect(bbqPizza.ing, ['tomate', 'queso', 'bacon', 'cebolla', 'jamon york']);
    });

    test('Comprobar si se ha definido bien el tipo de masa', () {
      var veggieBuilder = VeggiePizzaBuilder();
      veggieBuilder.TipoMasa();
      var veggiePizza = veggieBuilder.pi;

      expect(veggiePizza.tipoMasa, 'fina');
    });

   test('Comprobar si se ha definido bien el tipo de pan', () {
      var serranitoBuilder = BocataSerranitoBuilder();
      serranitoBuilder.TipoPan();
      var serranitoBocata = serranitoBuilder.bo;

      expect(serranitoBocata.pan, 'casero');
    });

    test('Veggie y Pepito tienen ingredientes diferentes', () {
      var veggieBuilder = VeggiePizzaBuilder();
      veggieBuilder.AddIngredientes();
      var veggiePizza = veggieBuilder.pi;

      var pepitoBuilder = BocataPepitoBuilder();
      pepitoBuilder.AddIngredientes();
      var pepitoBocata = pepitoBuilder.bo;

      expect(veggiePizza.ing, isNot(equals(pepitoBocata.ing)));
    });

    test('BBQ y Pepito son diferentes en su totalidad', () {
      var bbqBuilder = BBQPizzaBuilder();
      var bbqPizza = bbqBuilder.CreateNewPizza();

      var pepitoBuilder = BocataPepitoBuilder();
      var pepitoBocata = pepitoBuilder.CreateNewBocata();

      expect(bbqPizza, isNot(equals(pepitoBocata)));
    });

  });
}


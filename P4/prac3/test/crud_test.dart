import 'package:flutter_test/flutter_test.dart';
import '../lib/GestorRestaurante.dart';
import '../lib/main.dart';
import '../lib/Pizza.dart';
import '../lib/Bocata.dart';

void main() {
  group('GestorRestaurante tests', () {
    late GestorRestaurante gestorRestaurante;
    late String currentUser;

    setUp(() {
      gestorRestaurante = GestorRestaurante([], []);
      currentUser = 'René';
    });

    test('Agregar y cargar pizza', () async {
      var veggieBuilder = VeggiePizzaBuilder();
      final Pizza veggiePizza = veggieBuilder.CreateNewPizza(currentUser);
      await gestorRestaurante.agregarPizza(veggiePizza);

      expect(gestorRestaurante.mispizzas.length, equals(1));
    });

    test('Eliminar pizza', () async {
      var infantilBuilder = InfantilPizzaBuilder();
      final Pizza infantilPizza = infantilBuilder.CreateNewPizza(currentUser);
      await gestorRestaurante.agregarPizza(infantilPizza);
      await gestorRestaurante.eliminarPizza(infantilPizza);
      expect(gestorRestaurante.mispizzas.length, equals(1));
    });

    test('Agregar y cargar bocata', () async {
      var calamaresBuilder = BocataCalamaresBuilder();
      final Bocata calamaresBocata = calamaresBuilder.CreateNewBocata(currentUser);
      await gestorRestaurante.agregarBocata(calamaresBocata);

      expect(gestorRestaurante.misbocatas.length, equals(1));
    });

    test('Eliminar bocata', () async {
      var serranitoBuilder = BocataSerranitoBuilder();
      final Bocata serranitoBocata = serranitoBuilder.CreateNewBocata(currentUser);
      await gestorRestaurante.agregarBocata(serranitoBocata);
      await gestorRestaurante.eliminarBocata(serranitoBocata);

      expect(gestorRestaurante.misbocatas.length, equals(1));
    });
  });
}

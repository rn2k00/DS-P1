import 'package:flutter_test/flutter_test.dart';
import 'GestorRestaurante.dart';
import 'Pizza.dart';
import 'Bocata.dart';

void main() {
  group('GestorRestaurante tests', () {
    late GestorRestaurante gestorRestaurante;
    late String currentUser;

    setUp(() {
      gestorRestaurante = GestorRestaurante([], []);
      currentUser = 'René';
    });

    test('Agregar y cargar pizza', () async {
      final pizza = Pizza(id: 1, ing: 'tomate, queso', salsa: 'Tomate', tipoMasa: 'Fina', tamanio: 'Mediana', nombre: 'Margarita', user: currentUser, gluten: true);

      await gestorRestaurante.agregarPizza(pizza);
      await gestorRestaurante.cargarPizzas(currentUser);

      expect(gestorRestaurante.mispizzas.length, equals(1));
      expect(gestorRestaurante.mispizzas.first.id, equals(1));
    });

    test('Eliminar pizza', () async {
      final pizza = Pizza(id: 1, ing: 'tomate, queso', salsa: 'Tomate', tipoMasa: 'Fina', tamanio: 'Mediana', nombre: 'Margarita', user: currentUser, gluten: true);

      await gestorRestaurante.agregarPizza(pizza);
      await gestorRestaurante.cargarPizzas(currentUser);

      await gestorRestaurante.eliminarPizza(pizza);
      await gestorRestaurante.cargarPizzas(currentUser);

      expect(gestorRestaurante.mispizzas.length, equals(0));
    });

    test('Agregar y cargar bocata', () async {
      final bocata = Bocata(id: 1, ing: 'jamón, queso', pan: 'Baguette', tamanio: 'Grande', nombre: 'Serranito', user: currentUser, gluten: true);

      await gestorRestaurante.agregarBocata(bocata);
      await gestorRestaurante.cargarBocatas(currentUser);

      expect(gestorRestaurante.misbocatas.length, equals(1));
      expect(gestorRestaurante.misbocatas.first.id, equals(1));
    });

    test('Eliminar bocata', () async {
      final bocata = Bocata(id: 1, ing: 'jamón, queso', pan: 'Baguette', tamanio: 'Grande', nombre: 'Serranito', user: currentUser, gluten: true);

      await gestorRestaurante.agregarBocata(bocata);
      await gestorRestaurante.cargarBocatas(currentUser);

      await gestorRestaurante.eliminarBocata(bocata);
      await gestorRestaurante.cargarBocatas(currentUser);

      expect(gestorRestaurante.misbocatas.length, equals(0));
    });
  });
}

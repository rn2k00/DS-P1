import 'dart:convert';
import 'package:http/http.dart' as http;
import 'bocata.dart';
import 'pizza.dart';

class GestorRestaurante {
  List<Bocata> misbocatas = [];
  List<Pizza> mispizzas = [];
  final String apiUrlB = "http://localhost:3000/bocatas";
  final String apiUrlP = "http://localhost:3000/pizzas";

  GestorRestaurante(this.misbocatas, this.mispizzas);


  Future<void> cargarBocatas(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrlB?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> bocatasJson = json.decode(response.body);

      misbocatas.clear();
      misbocatas.addAll(bocatasJson.map((json) => Bocata.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load bocatas');
    }
  }

  Future<void> agregar(Bocata bocata) async {
    final response = await http.post(
      Uri.parse(apiUrlB),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bocata.toJson()),
    );
    if (response.statusCode == 201) {
      misbocatas.add(Bocata.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add bocata: ${response.body}');
    }
  }

  Future<void> eliminar(Bocata bocata) async {
    final response = await http.delete(
      Uri.parse('$apiUrlB/${bocata.id}'),
    );
    if (response.statusCode == 200) {
      misbocatas.removeWhere((b) => b.id == bocata.id);
    } else {
      throw Exception('Failed to delete bocata');
    }
  }

  Future<void> marcarSinGLuten(Bocata bocata) async {
    bool sinGluten = !(bocata.gluten ?? false);

    final response = await http.patch(
      Uri.parse('$apiUrlB/${bocata.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'sinGluten': sinGluten,
      }),
    );

    if (response.statusCode == 200) {
      bocata.gluten = sinGluten;
    } else {
      throw Exception('Failed to update bocata');
    }
  }

  Future<void> cargarPizzas(String usuario) async {
    final response = await http.get(Uri.parse('$apiUrlP?usuario=$usuario'));
    if (response.statusCode == 200) {
      List<dynamic> pizzasJson = json.decode(response.body);

      mispizzas.clear();
      mispizzas.addAll(pizzasJson.map((json) => Pizza.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load pizzas');
    }
  }

  Future<void> agregar(Pizza pizza) async {
    final response = await http.post(
      Uri.parse(apiUrlP),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(pizza.toJson()),
    );
    if (response.statusCode == 201) {
      mispizzas.add(Pizza.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add pizza: ${response.body}');
    }
  }

  Future<void> eliminar(Pizza pizza) async {
    final response = await http.delete(
      Uri.parse('$apiUrlP/${pizza.id}'),
    );
    if (response.statusCode == 200) {
      mispizzas.removeWhere((p) => p.id == pizza.id);
    } else {
      throw Exception('Failed to delete pizza');
    }
  }

  Future<void> marcarSinGLuten(Pizza pizza) async {
    bool sinGluten = !(pizza.gluten ?? false);

    final response = await http.patch(
      Uri.parse('$apiUrlB/${pizza.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'sinGluten': sinGluten,
      }),
    );

    if (response.statusCode == 200) {
      piiza.gluten = sinGluten;
    } else {
      throw Exception('Failed to update pizza');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

// Modelo de Pizza
class Pizza {
  final String ing;
  final String salsa;
  final String tipoMasa;
  final String tamanio;
  final String nombre;
  final String user;

  Pizza({required this.ing, required this.salsa, required this.tipoMasa, required this.tamanio, required this.nombre, required this.user});

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      ing: json['ing'],
      salsa: json['salsa'],
      tipoMasa: json['tipoMasa'],
      tamanio: json['tamanio'],
      nombre: json['nombre'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => {
    'ing': ing,
    'salsa': salsa,
    'tipoMasa': tipoMasa,
    'tamanio': tamanio,
    'nombre': nombre,
    'user': user,
  };
}

// Modelo de Bocata
class Bocata {
  final String ing;
  final String pan;
  final String tamanio;
  final String nombre;
  final String user;

  Bocata({required this.ing, required this.pan, required this.tamanio, required this.nombre, required this.user});

  factory Bocata.fromJson(Map<String, dynamic> json) {
    return Bocata(
      ing: json['ing'],
      pan: json['pan'],
      tamanio: json['tamanio'],
      nombre: json['nombre'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => {
    'ing': ing,
    'pan': pan,
    'tamanio': tamanio,
    'nombre': nombre,
    'user': user,
  };
}

// URL base del servidor
const String baseUrl = 'http://localhost:3000';

// Funciones para Pizzas
Future<List<Pizza>> fetchPizzas(String user) async {
  final response = await http.get(Uri.parse('$baseUrl/pizzas?user=$user'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((pizza) => Pizza.fromJson(pizza)).toList();
  } else {
    throw Exception('Failed to load pizzas');
  }
}

Future<http.Response> createPizza(Pizza pizza) async {
  final response = await http.post(
    Uri.parse('$baseUrl/pizzas'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(pizza.toJson()),
  );

  if (response.statusCode == 201) {
    return response;
  } else {
    throw Exception('Failed to create pizza');
  }
}

// Funciones para Bocatas
Future<List<Bocata>> fetchBocatas(String user) async {
  final response = await http.get(Uri.parse('$baseUrl/bocatas?user=$user'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((bocata) => Bocata.fromJson(bocata)).toList();
  } else {
    throw Exception('Failed to load bocatas');
  }
}

Future<http.Response> createBocata(Bocata bocata) async {
  final response = await http.post(
    Uri.parse('$baseUrl/bocatas'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(bocata.toJson()),
  );

  if (response.statusCode == 201) {
    return response;
  } else {
    throw Exception('Failed to create bocata');
  }
}

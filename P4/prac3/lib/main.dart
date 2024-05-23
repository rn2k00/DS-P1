import 'package:flutter/material.dart';
import 'Pizza.dart';
import 'Bocata.dart';
import 'GestorRestaurante.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GestorRestaurante _gestorRestaurante = GestorRestaurante([], []);
  String currentUser = "René";
  List<String> users = ["René", "Angela", "Gonzalo", "Miguel"];

  @override
  void initState() {
    super.initState();
    _cargarPizzasIniciales();
    _cargarBocatasIniciales();
  }

  void _cargarPizzasIniciales() async {
    try {
      await _gestorRestaurante.cargarPizzas(currentUser);
      setState(() {});
    } catch (e) {
      print("Error loading pizzas: $e");
    }
  }

  void _cargarBocatasIniciales() async {
    try {
      await _gestorRestaurante.cargarBocatas(currentUser);
      setState(() {});
    } catch (e) {
      print("Error loading bocatas: $e");
    }
  }


  void _addPizza(Pizza pizza, String resultado) async {
    final text = resultado;
    if (text.isNotEmpty) {
      try {
        await _gestorRestaurante.agregarPizza(pizza);
      } catch (e) {
        print("Error adding pizza: $e");
      }
      setState(() {});
    }
  }

  void _addBocata(Bocata bocata, String resultado) async {
    final text = resultado;
    if (text.isNotEmpty) {
      try {
        await _gestorRestaurante.agregarBocata(bocata);
      } catch (e) {
        print("Error adding bocata: $e");
      }
      setState(() {});
    }
  }

  void _changeGlutenPizza(Pizza pizza) async {
    try {
      await _gestorRestaurante.marcarSinGLutenPizza(pizza);
    } catch (e) {
      print("Error changing gluten pizza: $e");
    }
    setState(() {});
  }

    void _changeGlutenBocata(Bocata bocata) async {
    try {
      await _gestorRestaurante.marcarSinGLutenBocata(bocata);
    } catch (e) {
      print("Error changing gluten bocata: $e");
    }
    setState(() {});
  }

  void _deletePizza(Pizza pizza) async {
    try {
      await _gestorRestaurante.eliminarPizza(pizza);
    } catch (e) {
      print("Error deleting pizza: $e");
    }
    setState(() {});
  }

  void _deleteBocata(Bocata bocata) async {
    try {
      await _gestorRestaurante.eliminarBocata(bocata);
    } catch (e) {
      print("Error deleting bocata: $e");
    }
    setState(() {});
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurante'),
        actions: <Widget>[
          DropdownButton<String>(
            value: currentUser,
            icon: const Icon(Icons.arrow_downward),
            onChanged: (String? newValue) {
              if (newValue != null && newValue != currentUser) {
                setState(() {
                  currentUser = newValue;
                  _cargarPizzasIniciales();
                  _cargarBocatasIniciales();
                });
              }
            },
            items: users.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PizzaOptionsPage(
                            user: currentUser,
                            homePageState: this,
                          ),
                        ),
                      );
                    },
                    child: const Text('Pizza'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BocataOptionsPage(
                            user: currentUser,
                            homePageState: this,
                          ),
                        ),
                      );
                    },
                    child: const Text('Bocata'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Elecciones de Pizza',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _gestorRestaurante.mispizzas.length,
                    itemBuilder: (context, index) {
                      final pizza = _gestorRestaurante.mispizzas[index];
                      return ListTile(
                        title: Text(
                            'Pizza ${index + 1}: ${pizza.nombre}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                _changeGlutenPizza(pizza);
                              },
                              color: (pizza.gluten == true)
                                  ? Colors.green
                                  : null,
                            ),
                            Text(
                              (pizza.gluten == true)
                                  ? 'Con gluten'
                                  : 'Sin gluten',
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deletePizza(pizza);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  'Elecciones de Bocata',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _gestorRestaurante.misbocatas.length,
                    itemBuilder: (context, index) {
                      final bocata = _gestorRestaurante.misbocatas[index];
                      return ListTile(
                        title: Text('Bocata ${index + 1}: ${bocata.nombre}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                _changeGlutenBocata(bocata);
                              },
                              color:  (bocata.gluten == true) ? Colors.green : null,
                            ),
                            Text(
                              (bocata.gluten == true) ? 'Con gluten' : 'Sin gluten',
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteBocata(bocata);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PizzaOptionsPage extends StatefulWidget {
  final String user;
  final _MyHomePageState homePageState;

  const PizzaOptionsPage({
    Key? key,
    required this.user,
    required this.homePageState,
  }) : super(key: key);

  @override
  State<PizzaOptionsPage> createState() => _PizzaOptionsPageState();
}

class _PizzaOptionsPageState extends State<PizzaOptionsPage> {
  late Pizza pizza;
  late PizzaBuilder builder;
  String resultado = "";

  String? get user => null;

  void construirPizza() {
    setState(() {
      pizza = builder.CreateNewPizza(widget.user);
      resultado = pizza.toString();
      widget.homePageState._addPizza(pizza, resultado);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir Pizza - ${widget.user}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      builder = BBQPizzaBuilder();
                      construirPizza();
                    },
                    child: const Text('Construir Pizza BBQ'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      builder = VeggiePizzaBuilder();
                      construirPizza();
                    },
                    child: const Text('Construir Pizza Veggie'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      builder = InfantilPizzaBuilder();
                      construirPizza();
                    },
                    child: const Text('Construir Pizza Infantil'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Volver'),
                  ),
                  Text(
                    'Su elección: $resultado',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _MyHomePageState()._gestorRestaurante.mispizzas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Pizza ${index + 1}: ${_MyHomePageState()._gestorRestaurante.mispizzas[index].nombre}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () => _MyHomePageState()._changeGlutenPizza(_MyHomePageState()._gestorRestaurante.mispizzas[index]),
                        color: (_MyHomePageState()._gestorRestaurante.mispizzas[index].gluten == true) ? Colors.red : Colors.green,
                        ),
                        Text(
                          (_MyHomePageState()._gestorRestaurante.mispizzas[index].gluten == true) ? '' : 'Sin gluten',
                        ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _MyHomePageState()._deletePizza(pizza);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BocataOptionsPage extends StatefulWidget {
  final String user;
  final _MyHomePageState homePageState;

  const BocataOptionsPage({
    Key? key,
    required this.user,
    required this.homePageState,
  }) : super(key: key);

  @override
  State<BocataOptionsPage> createState() => _BocataOptionsPageState();
}

class _BocataOptionsPageState extends State<BocataOptionsPage> {
  late Bocata bocata;
  late BocataBuilder builder;
  String resultado = "";

  void construirBocata() {
    setState(() {
      bocata = builder.CreateNewBocata(widget.user);
      resultado = bocata.toString();
      widget.homePageState._addBocata(bocata, resultado);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir Bocata - ${widget.user}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      builder = BocataSerranitoBuilder();
                      construirBocata();
                    },
                    child: const Text('Construir Bocata Serranito'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      builder = BocataCalamaresBuilder();
                      construirBocata();
                    },
                    child: const Text('Construir Bocata Calamares'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      builder = BocataPepitoBuilder();
                      construirBocata();
                    },
                    child: const Text('Construir Bocata Pepito'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Volver'),
                  ),
                  Text(
                    'Su elección: $resultado',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _MyHomePageState()._gestorRestaurante.misbocatas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Bocata ${index + 1}: ${_MyHomePageState()._gestorRestaurante.misbocatas[index].nombre}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () => _MyHomePageState()._changeGlutenBocata(_MyHomePageState()._gestorRestaurante.misbocatas[index]),
                        color: (_MyHomePageState()._gestorRestaurante.misbocatas[index].gluten == true) ? Colors.red : Colors.green,
                        ),
                        Text(
                          (_MyHomePageState()._gestorRestaurante.misbocatas[index].gluten == true) ? '' : 'Sin gluten',
                        ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _MyHomePageState()._deleteBocata(bocata);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

abstract class PizzaBuilder {
  Pizza pi = Pizza(gluten: true);

  Pizza CreateNewPizza(String user) {
    AddIngredientes();
    TipoMasa();
    AddSalsa();
    TamanioMasa();
    Nombre();
    User(user);
    Gluten();
    return pi;
  }

  void AddIngredientes();
  void TipoMasa();
  void AddSalsa();
  void TamanioMasa();
  void Nombre();
  void User(String user) {
    pi.user = user;
  }
  void Gluten() {
    pi.gluten = true;
  }
}

class BBQPizzaBuilder extends PizzaBuilder {
  @override
  void AddIngredientes() {
    pi.ing = "tomate, queso, bacon, cebolla, jamon york";
  }

  @override
  void TipoMasa() {
    pi.tipoMasa = "normal con bordes rellenos de queso";
  }

  @override
  void AddSalsa() {
    pi.salsa = "Barbacoa";
  }

  @override
  void TamanioMasa() {
    pi.tamanio = "mediana";
  }

  @override
  void Nombre() {
    pi.nombre = "Barbacoa";
  }
}

class VeggiePizzaBuilder extends PizzaBuilder {
  @override
  void AddIngredientes() {
    pi.ing = "tomate, queso vegano, champiñones, rúcula";
  }

  @override
  void TipoMasa() {
    pi.tipoMasa = "fina";
  }

  @override
  void AddSalsa() {
    pi.salsa = "Salsa pesto";
  }

  @override
  void TamanioMasa() {
    pi.tamanio = "mediana";
  }

  @override
  void Nombre() {
    pi.nombre = "Veggie";
  }
}

class InfantilPizzaBuilder extends PizzaBuilder {
  @override
  void AddIngredientes() {
    pi.ing = "queso, jamon york";
  }

  @override
  void TipoMasa() {
    pi.tipoMasa = "normal";
  }

  @override
  void AddSalsa() {
    pi.salsa = "Salsa casera de tomate";
  }

  @override
  void TamanioMasa() {
    pi.tamanio = "pequeña";
  }

  @override
  void Nombre() {
    pi.nombre = "Infantil";
  }
}

abstract class BocataBuilder {
  Bocata bo = Bocata(gluten: true);

  Bocata CreateNewBocata(String user) {
    AddIngredientes();
    TipoPan();
    Tamanio();
    Nombre();
    User(user);
    Gluten();
    return bo;
  }

  void AddIngredientes();
  void TipoPan();
  void Tamanio();
  void Nombre();

  void User(String user) {
    bo.user = user;
  }
  void Gluten() {
    bo.gluten = true;
  }
}

class BocataPepitoBuilder extends BocataBuilder {
  @override
  void AddIngredientes() {
    bo.ing = "tomate, lechuga, lomo, mayonesa";
  }

  @override
  void TipoPan() {
    bo.pan = "baguette";
  }

  @override
  void Tamanio() {
    bo.tamanio = "grande";
  }

  @override
  void Nombre() {
    bo.nombre = "Pepito";
  }
}

class BocataSerranitoBuilder extends BocataBuilder {
  @override
  void AddIngredientes() {
    bo.ing = "tomate, aceite, jamon serrano, pimiento";
  }

  @override
  void TipoPan() {
    bo.pan = "casero";
  }

  @override
  void Tamanio() {
    bo.tamanio = "mediano";
  }

  @override
  void Nombre() {
    bo.nombre = "Serranito";
  }
}

class BocataCalamaresBuilder extends BocataBuilder {
  @override
  void AddIngredientes() {
    bo.ing = "calamares fritos, mayonesa";
  }

  @override
  void TipoPan() {
    bo.pan = "artesano";
  }

  @override
  void Tamanio() {
    bo.tamanio = "mediano";
  }

  @override
  void Nombre() {
    bo.nombre = "De Calamares";
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza & Bocata Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pizza & Bocata Builder'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;


  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              //Cuando se pulse iriamos a la pagina pizzaoptionspage
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PizzaOptionsPage()),
                );
              },
              child: const Text('Pizza'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BocataOptionsPage()),
                );
              },
              child: const Text('Bocata'),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaOptionsPage extends StatefulWidget {
  const PizzaOptionsPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<PizzaOptionsPage> createState() => _MyPizzaOptionsState();
}
class _MyPizzaOptionsState extends State<PizzaOptionsPage> {

  late Pizza pizza;
  late PizzaBuilder builder;
  String resultado = "";

  void construirPizza(){
    setState(() {
      pizza = builder.CreateNewPizza();
      resultado = pizza.str();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegir Pizza'),
      ),
      body: Center(
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
            )
          ],
        ),
      ),
    );
  }
}

class BocataOptionsPage extends StatefulWidget {
  const BocataOptionsPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<BocataOptionsPage> createState() => _MyBocataOptionsState();
}
class _MyBocataOptionsState extends State<BocataOptionsPage> {


  late Bocata bocata;
  late BocataBuilder builder;
  String resultado = "";

  void construirBocata(){
  setState(() {
    bocata = builder.CreateNewBocata();
    resultado = bocata.str();
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elegir Bocata'),
      ),
      body: Center(
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
        )
          ],
        ),
      ),
    );
  }
}

class Pizza{
  var ing = <String>[];
  late String salsa;
  late String tipoMasa;
  late String tamanio;

  String str(){
    return "Ingredientes: $ing\nSalsa :$salsa\nTipo de masa :$tipoMasa\nTamaño :$tamanio";
}
}

abstract class PizzaBuilder{
  Pizza pi = Pizza();
  Pizza CreateNewPizza(){
    AddIngredientes();
    TipoMasa();
    AddSalsa();
    TamanioMasa();

    return pi;
  }

  void AddIngredientes();

  void TipoMasa();

  void AddSalsa();

  void TamanioMasa();

}

class BBQPizzaBuilder extends PizzaBuilder{
  @override
  void AddIngredientes(){
    pi.ing.add("tomate");
    pi.ing.add("queso");
    pi.ing.add("bacon");
    pi.ing.add("cebolla");
    pi.ing.add("jamon york");
  }

  @override
  void TipoMasa(){
    pi.tipoMasa = "normal con bordes rellenos de queso";
  }

  @override
  void AddSalsa(){
    pi.salsa = "Barbacoa";

  }

  @override
  void TamanioMasa(){
    pi.tamanio = "mediana";

  }
}

class VeggiePizzaBuilder extends PizzaBuilder{
  @override
  void AddIngredientes(){
    pi.ing.add("tomate");
    pi.ing.add("queso vegano");
    pi.ing.add("champiñones");
    pi.ing.add("rúcula");
  }

  @override
  void TipoMasa(){
    pi.tipoMasa = "fina";
  }

  @override
  void AddSalsa(){
    pi.salsa = "Salsa pesto";

  }

  @override
  void TamanioMasa(){
    pi.tamanio = "mediana";

  }
}

class InfantilPizzaBuilder extends PizzaBuilder{
  @override
  void AddIngredientes(){
    pi.ing.add("queso");
    pi.ing.add("jamon york");
  }

  @override
  void TipoMasa(){
    pi.tipoMasa = "normal";
  }

  @override
  void AddSalsa(){
    pi.salsa = "Salsa casera de tomate";

  }

  @override
  void TamanioMasa(){
    pi.tamanio = "pequeña";

  }
}




class Bocata{
  var ing = <String>[];
  late String pan;
  late String tamanio;

  String str(){
    return "Ingredientes: $ing\nTipo de pan :$pan\nTamaño :$tamanio";
  }
}

abstract class BocataBuilder{
  Bocata bo = Bocata();
  Bocata CreateNewBocata(){
    AddIngredientes();
    TipoPan();
    Tamanio();

    return bo;
  }

  void AddIngredientes();

  void TipoPan();

  void Tamanio();

}

class BocataPepitoBuilder extends BocataBuilder{

  @override
  void AddIngredientes(){
    bo.ing.add("tomate");
    bo.ing.add("lechuga");
    bo.ing.add("lomo");
    bo.ing.add("mayonesa");
  }

  @override
  void TipoPan(){

    bo.pan = "bagguette";

  }

  @override
  void Tamanio(){

    bo.tamanio = "grande";

  }

}

class BocataSerranitoBuilder extends BocataBuilder{

  @override
  void AddIngredientes(){
    bo.ing.add("tomate");
    bo.ing.add("aceite");
    bo.ing.add("jamon serrano");
    bo.ing.add("pimiento");
  }

  @override
  void TipoPan(){

    bo.pan = "casero";

  }

  @override
  void Tamanio(){

    bo.tamanio = "mediano";

  }

}

class BocataCalamaresBuilder extends BocataBuilder{

  @override
  void AddIngredientes(){
    bo.ing.add("calamares fritos");
    bo.ing.add("mayonesa");
  }

  @override
  void TipoPan(){

    bo.pan = "artesano";

  }

  @override
  void Tamanio(){

    bo.tamanio = "mediano";

  }

}

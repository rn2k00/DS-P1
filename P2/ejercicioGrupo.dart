import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza & Bocata Builder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pizza & Bocata Builder'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;


  MyHomePage({required this.title});

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
                  MaterialPageRoute(builder: (context) => PizzaOptionsPage()),
                );
              },
              child: Text('Pizza'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BocataOptionsPage()),
                );
              },
              child: Text('Bocata'),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaOptionsPage extends StatefulWidget {
  PizzaOptionsPage({super.key});

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
    pizza = builder.CreateNewPizza();
    resultado = pizza.str();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir Pizza'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                builder = new BBQPizzaBuilder();
                construirPizza();
              },
              child: Text('Construir Pizza BBQ'),
            ),
            ElevatedButton(
              onPressed: () {
                builder = new VeggiePizzaBuilder();
                construirPizza();
              },
              child: Text('Construir Pizza Veggie'),
            ),
            ElevatedButton(
              onPressed: () {
                builder = new InfantilPizzaBuilder();
                construirPizza();
              },
              child: Text('Construir Pizza Infantil'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
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
  BocataOptionsPage({super.key});

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
    bocata = builder.CreateNewBocata();
    resultado = bocata.str();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir Bocata'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                builder = new BocataSerranitoBuilder();
                construirBocata();
              },
              child: Text('Construir Bocata Serranito'),
            ),
            ElevatedButton(
              onPressed: () {
                builder = new BocataCalamaresBuilder();
                construirBocata();
              },
              child: Text('Construir Bocata Calamares'),
            ),
            ElevatedButton(
              onPressed: () {
                builder = new BocataPepitoBuilder();
                construirBocata();
              },
              child: Text('Construir Bocata Pepito'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
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
    return "Ingredientes: "+ ing.toString() + "/n" + "Salsa :"+ salsa + "/n" +"Tipo de masa :" + tipoMasa + "/n" + "Tamaño :" +tamanio;
  }
}

abstract class PizzaBuilder{
  Pizza pi = new Pizza();
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
  void AddIngredientes(){
    pi.ing.add("tomate");
    pi.ing.add("queso");
    pi.ing.add("bacon");
    pi.ing.add("cebolla");
    pi.ing.add("jamon york");
  }

  void TipoMasa(){
    pi.tipoMasa = "normal con bordes rellenos de queso";
  }

  void AddSalsa(){
    pi.salsa = "Barbacoa";

  }

  void TamanioMasa(){
    pi.tamanio = "mediana";

  }
}

class VeggiePizzaBuilder extends PizzaBuilder{
  void AddIngredientes(){
    pi.ing.add("tomate");
    pi.ing.add("queso vegano");
    pi.ing.add("champiñones");
    pi.ing.add("rúcula");
  }

  void TipoMasa(){
    pi.tipoMasa = "fina";
  }

  void AddSalsa(){
    pi.salsa = "Salsa pesto";

  }

  void TamanioMasa(){
    pi.tamanio = "mediana";

  }
}

class InfantilPizzaBuilder extends PizzaBuilder{
  void AddIngredientes(){
    pi.ing.add("queso");
    pi.ing.add("jamon york");
  }

  void TipoMasa(){
    pi.tipoMasa = "normal";
  }

  void AddSalsa(){
    pi.salsa = "Salsa casera de tomate";

  }

  void TamanioMasa(){
    pi.tamanio = "pequeña";

  }
}




class Bocata{
  var ing = <String>[];
  late String pan;
  late String tamanio;

  String str(){
    return "Ingredientes: "+ ing.toString() + "/n" + "Tipo de pan :" + pan + "/n" + "Tamaño :" +tamanio;
  }
}

abstract class BocataBuilder{
  Bocata bo = new Bocata();
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

  void AddIngredientes(){
    bo.ing.add("tomate");
    bo.ing.add("lechuga");
    bo.ing.add("lomo");
    bo.ing.add("mayonesa");
  }

  void TipoPan(){

    bo.pan = "bagguette";

  }

  void Tamanio(){

    bo.tamanio = "grande";

  }

}

class BocataSerranitoBuilder extends BocataBuilder{

  void AddIngredientes(){
    bo.ing.add("tomate");
    bo.ing.add("aceite");
    bo.ing.add("jamon serrano");
    bo.ing.add("pimiento");
  }

  void TipoPan(){

    bo.pan = "casero";

  }

  void Tamanio(){

    bo.tamanio = "mediano";

  }

}

class BocataCalamaresBuilder extends BocataBuilder{

  void AddIngredientes(){
    bo.ing.add("calamares fritos");
    bo.ing.add("mayonesa");
  }

  void TipoPan(){

    bo.pan = "artesano";

  }

  void Tamanio(){

    bo.tamanio = "mediano";

  }

}


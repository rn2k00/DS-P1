# Ejercicio 1
## Funcionamiento del Programa
### Diagrama UML
![Diagrama](</Práctica 1/Ejercicio1/Diagrama-P1.png> "Diagrama del Ejercicio 1")



### Clases
* `bicicleta`: Clase base para las bicicletas. Se extiende en `bicicletaMontana` y `bicicletaCarretera`.

* `carrera`: Clase base para las carreras. Se extiende en `carreraMontana` y `carreraCarretera`.
Las funciones necesarias están totalmente implementadas en la clase `carrera` a pesar de ser una clase abstracta. Las clases `carreraMontana` y `carreraCarretera` tienen valores distintos para sus atributos.

* `FactoriaCarreraBicicleta`: Interfaz para crear bicicletas y carreras. Implementada por FactoriaMontana y FactoriaCarretera.

### Flujo Principal del Programa
El flujo principal está en la clase main. Comienza pidiendo al usuario el número de participantes. Luego crea las bicicletas y las carreras correspondientes usando las factorías. Las carreras se ejecutan en hilos separados.

Cada carrera dura 60 segundos. Al final, se retira un porcentaje de participantes  dependiendo del tipo de carretera y la carrera termina. El programa imprime los identificadores de los participantes retirados.

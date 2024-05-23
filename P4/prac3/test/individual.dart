import 'package:flutter_test/flutter_test.dart';
import '../lib/ejercicio1.dart';
import '../lib/ejercicio2.dart';

void main() {
  group('Test Calculadora', (){

    test('Construcción y operarción: suma y resta', (){
      late Operacion op;
      late double res;

      op = Suma();
      res = op.operar(861.5799, 4520.009);
      expect(op, isA<Suma>());
      expect(res, 5381.5889);

      op = Resta();
      res = op.operar(861.57, 4520.009);
      expect(op, isA<Resta>());
      expect(res, -3658.439);
    });

    test('Construcción y operacion: division y division entera', () {
      late Operacion op;
      late double res;

      op = Division();
      res = op.operar(143, 26);
      expect(op, isA<Division>());
      expect(res, 5.5);

      op = DivisionEntera();
      res = op.operar(143, 26);
      expect(op, isA<DivisionEntera>());
      expect(res, 5);
    });

    test('Construcción y operacion: Multiplicación y Potencia', () {
      late Operacion op;
      late double res;

      op = Multiplicacion();
      res = op.operar(13, 8.6);
      expect(op, isA<Multiplicacion>());
      expect(res, 111.8);

      op = Potencia();
      res = op.operar(26, 0);
      expect(op, isA<Potencia>());
      expect(res, 1);
    });

  });

  group('Test Lista de Tareas', (){

    test('Creacion de tarea', () {
      var tarea = Tarea('Hacer la compra', false);
      tarea.completada = true;

      expect(tarea, isA<Tarea>());
      expect(tarea.completada, true);
      expect(tarea.descripcion, 'Hacer la compra');
    });

    test('Añadir tareas al gestor de tareas', () {
      var gestor = GestorDeTareas();

      var tarea = Tarea('Limpiar', false);
      gestor.agregarTarea(tarea);

      var tarea2 = Tarea('Hacer los deberes', false);
      gestor.agregarTarea(tarea2);

      gestor.marcarTareaComoCompletada(0);

      expect(gestor, isA<GestorDeTareas>());
      expect(tarea.completada, true);
      expect(gestor.tareas.length, 2);
    });

    test('Eliminar tareas del gestor de tareas', () {
      var gestor = GestorDeTareas();

      var tarea = Tarea('Limpiar', false);
      gestor.agregarTarea(tarea);

      var tarea2 = Tarea('Hacer los deberes', false);
      gestor.agregarTarea(tarea2);

      var tarea3 = Tarea('Recoger paquete', false);
      gestor.agregarTarea(tarea3);

      gestor.marcarTareaComoCompletada(1);
      gestor.eliminarTarea(0);
      gestor.marcarTareaComoCompletada(1);
      gestor.eliminarTarea(1);
      expect(gestor, isA<GestorDeTareas>());
      expect(tarea2.completada, true);
      expect(gestor.tareas.length, 1);
    });

  });
}
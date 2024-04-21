# Patrón Factoría Abstracta

## Planteamiento del problema

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Utilizar el patrón de <strong>Factoría Abstracta</strong> para simular carreras de bicicletas de dos tipos: carretera y montaña. Cada carrera tiene un número de participantes que el usuario puede definir. Las bicicletas y las carreras se crean utilizando las factorías correspondientes (<em>FactoriaCarretera</em> y <em>FactoriaMontana</em>), que a su vez heredan de la interfaz <em>FactoriaCarreraBicicleta</em>. Para desarrollar esta aplicación se ha elegido el lenguaje de programación Javan y se ha llevado a cabo con el uso de hebras. 
    </p>
</div>

## Diagrama de Diseño
El diseño del programa se basa en el patrón de diseño de la factoría. Tenemos una interfaz <strong>FactoriaCarreraBicicleta</strong> que define los métodos que deben implementar las factorías concretas (<em>FactoriaCarretera</em> y <em>FactoriaMontana</em>). Estas factorías crean instancias de <em>bicicleta</em> y <em>carrera</em> (y sus subclases <em>bicicletaCarretera</em>, <em>bicicletaMontana</em>, <em>carreraCarretera</em>, <em>carreraMontana</em>).

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/Diagrama-P1.png">
    <p class="leyenda" style = 'margin:0px'><strong>Ilustración 1</strong>. Diagrama de diseño, ejercicio 1.</p>
</div>

## Solución del Problema

### Clase FactoriaCarreraBicicleta
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Esta es una interfaz que define los métodos que deben implementar las factorías concretas.
    </p>
</div>

```java
public interface FactoriaCarreraBicicleta {
   
    public abstract carrera crearCarrera(ArrayList<bicicleta> participantes);
    public abstract bicicleta crearBicicleta(int i);
    
}
```

### Clase FactoriaMontana y FactoriaCarretera
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Estas clases implementan la interfaz FactoriaCarreraBicicleta y se encargan de crear bicicletas y carreras de montaña y de carretra respectivamente.
    </p>
</div>

```java
public class FactoriaCarretera implements FactoriaCarreraBicicleta{
          
    @Override
    public bicicleta crearBicicleta(int i){
            return new bicicletaCarretera(i);       
    }
    
    @Override
    public carrera crearCarrera(ArrayList<bicicleta> participantes){
        return new carreraCarretera(participantes);
        
    }
        
}
```

```java
public class FactoriaMontana implements FactoriaCarreraBicicleta{
    
    
    @Override
    public bicicleta crearBicicleta(int i){
            return new bicicletaMontana(i);       
    }
    
    @Override
    public carrera crearCarrera(ArrayList<bicicleta> participantes){
        return new carreraMontana(participantes);
        
    }
        
}
```

### Clase bicicleta
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Esta es una clase abstracta que define la estructura básica de una bicicleta. Las clases bicicletaCarretera y bicicletaMontana heredan de esta clase.
    </p>
</div>

```java
public abstract class bicicleta {
    int identificador;    
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Su único atributo es el identificador.
    </p>
</div>    

### Clases bicicletaCarretera y bicicletaMontana
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Estas clases extienden la clase bicicleta y representa una bicicleta de carretera y de montaña respectivamente.
    </p>
</div>

```java
public class bicicletaMontana extends bicicleta{
    public bicicletaMontana(int identificador){
        this.identificador = identificador;
    }    
}
```

```java
public class bicicletaCarretera extends bicicleta{
    public bicicletaCarretera(int identificador){
        this.identificador = identificador;
    }    
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Las diferencias del comportamiento las dictará las clases Carretera, por eso son casi idénticas.
    </p>
</div>

### Clase carrera
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Esta es una clase abstracta que define la estructura básica de una carrera. Las clases carreraCarretera y carreraMontana heredan de esta clase.
    </p>
</div>

```java
public abstract class carrera {
    ...
    
    public void realizarCarrera(){
        System.out.println(mensajeInicio);
        sleep(duracionMilisegundos);
        retirarParticipantes();
        System.out.println(mensajeFinal);
    }

    private void mensajeRetirada(int[] retirados){
        System.out.println(mensajeRetirada);
        for (int i = 0; i < retirados.length; i++) {
            System.out.println(retirados[i]);
        }
    }

    private void retirarParticipantes(){
        int numeroRetirar = numeroARetirar();
        int[] retirados = new int[numeroRetirar];
        for (int i = 0; i < numeroRetirar; i++) {
            int indiceRetirar = (int) (Math.random() * participantes.size());
            retirados[i] = participantes.get(indiceRetirar).identificador;
            participantes.remove(indiceRetirar);
        }
        mensajeRetirada(retirados);
    }
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    A pesar de ser una clase abstracta, como las carreras de carretera y de montaña se comportan de manera tan similar, las funciones se pueden definir en la clase carrera.
    </p>
</div>

### Clases carreraCarretera y carreraMontana
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Estas clase extienden la clase carrera y representan una carrera de carretera y una carrera de montaña respectivamente.
    </p>
</div>

```java
public class carreraCarretera extends carrera{
    public carreraCarretera(ArrayList<bicicleta> participantes){
        this.participantes = participantes;
        porcentajeARetirar = 0.1;
        mensajeInicio = "Comienza la carrera de carretera.";
        mensajeFinal = "Termina la carrera de carretera.";
        mensajeRetirada = "Se retiran los siguientes participantes de la carrera de carretera:";
    }
}
```

```java
public class carreraMontana extends carrera{
    public carreraMontana(ArrayList<bicicleta> participantes){
        this.participantes = participantes; 
        porcentajeARetirar = 0.2;
        mensajeInicio = "Comienza la carrera de montaña.";
        mensajeFinal = "Termina la carrera de montaña.";
        mensajeRetirada = "Se retiran los siguientes participantes de la carrera de montaña:";
    }    
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Se defininen las diferencias del comportamiento entre los tipos de carreras con valores de los atributos diferentes.
    </p>
</div>

### Clase main
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Finalmente, la clase main es la que inicia el programa. El usuario introduce el número de participantes y se crean las bicicletas y las carreras correspondientes utilizando las factorías. Luego, se inician las carreras en hilos separados.
    </p>
</div>

## Conflictos Encontrados
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Una vez entendimos como debe funcionar el patrón de Factoría abstracta, el diseño del programa estaba resuelto.
    </p>
</div>

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La mayor parte de las complicaciones surgieron en el desarrollo de la función <em>retirarParticipantes()</em>
    </p>
</div>

```java
private void retirarParticipantes(){
        int numeroRetirar = numeroARetirar();
        int[] retirados = new int[numeroRetirar];
        for (int i = 0; i < numeroRetirar; i++) {
            int indiceRetirar = (int) (Math.random() * participantes.size());
            retirados[i] = participantes.get(indiceRetirar).identificador;
            participantes.remove(indiceRetirar);
        }
        mensajeRetirada(retirados);
    }
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La complicación surge del hecho de que se está modificando la lista participantes mientras se está iterando sobre ella. En concreto, se está eliminando un elemento de la lista en cada iteración del bucle. Además, causaba un IndexOutOfBoundsException cuando el índice calculado aleatoriamente excede el tamaño de la lista después de que se hayan eliminado algunos elementos a la hora de imprimir el mensajo con los participantes retirados.
    </p>
</div>

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La solución a este problema fue introducir en el array de retirados el identificador del participante en lugar de su índice, e imprimir el mensaje después del bucle.
    </p>
</div>



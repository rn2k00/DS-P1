# Patrón arquitectónico: Filtros de Intercepción.

## Planteamiento del problema
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Diseñar e implementar una aplicación que simule el salpicadero de un coche, respondiendo con la velocidad angular, lineal y kilometraje a actos como encenderlo/apagarlo, acelerar y frenar. Para esto se requiere usar el patrón <strong>Filtros de Intercepción</strong> para definir la modificación de las RPM producidas por la aceleración o el freno y el rozamiento.
    </p>
    <p>
    Para este ejercicio, por falta de tiempo y de experiencia con Python y Tkinter, nos hemos decantado por implementar el patrón en <strong>Java</strong> siguiendo las indicaciones del guion.
    </p>
</div>

## Diagrama de diseño
<div class="imagen" style = 'text-align:center;'>
    <img src="../img/Diagrama-P4.png">
    <p class="leyenda" style = 'margin:0px'><strong>Ilustración X</strong>. Diagrama de diseño, ejercicio 4.</p>
</div>

## Solución del problema
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Como se puede ver en el diagrama de arriba, en nuestra solución la clase <strong>Soporte_Salpicadero</strong> es a partir de la cual ocurre todo. Es del tipo <em>jFrame</em>, por lo que además de crear e inicializar al cliente que ordenará al resto de elementos, también mostrará una interfaz gráfica con la que podremos modificar el estado de nuestro coche arrancándolo, acelerando, frenando y apagándolo.
    </p>
    <p>
    Volviendo al cliente, en el constructor del salpicadero crearemos uno y le ordenaremos que, a su vez, ordene a su <em>gestor de filtros</em> que cree dos de ellos para meterlos en la cadena, uno para la aceleración y el frenado y otro para calcular las revoluciones perdidas por el rozamiento.
    </p>
</div>

```java
public class Soporte_Salpicadero extends javax.swing.JFrame {
    
    Cliente cliente;
   
    public Soporte_Salpicadero() {
        cliente = new Cliente();
        cliente.gestor.addFiltroRoza();
        cliente.gestor.addFiltroVelo();
        initComponents();
    }

    // Código generado automaticamente por NetBeans
    @SuppressWarnings("unchecked")
    private void initComponents() {

        // Creación de los componentes de la ventana Salpicadero
        jLabel1 = new javax.swing.JLabel();
        jToggleButton1 = new javax.swing.JToggleButton();
        ...

        // Configuración y especificación de los componentes de la ventana
        jLabel1.setForeground(new java.awt.Color(255, 0, 0));
        jLabel1.setText("APAGADO");
        ...

        // Los manejadores de eventos, por ejemplo, para encender el motor
        jToggleButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jToggleButton1ActionPerformed(evt);
            }
        });
        ...
    }

    // Método llamado cada vez que se presiona el botón encender
    private void jToggleButton1ActionPerformed(java.awt.event.ActionEvent evt) {
        if("ENCENDER".equals(jToggleButton1.getText())){
            jToggleButton1.setText("APAGAR");
            jLabel1.setText("ENCENDIDO");
            cliente.arrancar();
            cliente.peticion();
        }       
        else{
            jToggleButton1.setText("ENCENDER");
            jLabel1.setText("APAGADO");
            cliente.apagar();
            cliente.peticion();
        } 
    }
    ...

    // Declaración de variabels
    private javax.swing.JLabel jLabel1;
    private javax.swing.JToggleButton jToggleButton1;
    ...
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La clase <strong>Cliente</strong>, por su parte, es la que modifica el estado del enumerado <em>EstadoMotor</em>, es decir, el estado del coche. Además, esta es la que tiene la información de las revoluciones que tiene nuestro coche en cada momento y, cuando queremos mostrarlas por pantalla, es quien se encarga de pasar esa información al gestor para que él haga lo mismo y al final se le devuelva cualquier modificación.
    </p>
</div>

```java
public class Cliente {
    
    EstadoMotor estadomotor;
    double rev;
    GestorFiltros gestor;
    
    public Cliente(){
        gestor = new GestorFiltros();
        estadomotor = EstadoMotor.APAGADO;
        rev = 0;
    }
    
    // Los metodos acelerar, frenar y apagar son muy parecidos a arrancar, 
    // lo único que cambia es el estado del motor.
    public void arrancar(){
        estadomotor = EstadoMotor.ENCENDIDO;
    }
    ...
    
    public void peticion(){
        rev = gestor.peticionFiltros(rev, estadomotor);      
    }   
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    En cuanto al objeto de la clase <strong>GestorFiltros</strong>, es la que se ocupa de añadir los filtros que le ha ordenado el cliente al objeto <em>CadenaFiltros</em> y, cuando el mismo cliente inicia la petición de valores, quien pasa a la cadena tanto el estado del motor como las revoluciones.
    </p>
</div>

```java
public class GestorFiltros {
    
    CadenaFiltros cadena;
    
    public GestorFiltros(){
        cadena = new CadenaFiltros();
    }
    
    public void addFiltroRoza(){
        FiltroRepercutirRozamiento fil = new FiltroRepercutirRozamiento();
        cadena.filtros.add(fil);       
    }
    
    public void addFiltroVelo(){
        FiltroCalcularVelocidad fil = new FiltroCalcularVelocidad();
        cadena.filtros.add(fil); 
    }
    
    public double peticionFiltros(double revoluciones, EstadoMotor estadomotor){        
        return cadena.ejecutar(revoluciones, estadomotor);       
    }
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    <strong>CadenaFiltros</strong> contiene un array con todos los filtros que el gestor le haya creado (en este caso 2) y un objeto de la clase <em>Objetivo</em>. Esta clase solo tiene un método, pero es el que más trabajo conlleva: primero recorre el array de filtros y pasa a cada uno la información que el gestor le ha dado previamente, recogiendo cada modificación que los filtros le hagan a las revoluciones. Tras esto, estas revoluciones modificadas se las pasa al objetivo para que este las muestre por pantalla junto con la velocidad lineal y los kilómetros recorridos.
    </p>
</div>

```java
public class CadenaFiltros {
    
    public ArrayList<Filtro> filtros;
    public Objetivo obj;
    
    public CadenaFiltros(){
        obj = new Objetivo();
        filtros = new ArrayList<Filtro>();
    }
    
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        for (int i = 0; i < filtros.size(); i++){
            revoluciones +=filtros.get(i).ejecutar(revoluciones, estadomotor);
        }
        
        return obj.ejecutar(revoluciones, estadomotor);
    }
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Hablando de este último objeto, <strong>Objetivo</strong>, su única peculiaridad es que a su vez contiene otro jFrame llamado <em>Info</em>, y su método “ejecutar” produce que se muestre por pantalla esta ventana, que es la que enseñará los datos calculados también en el objeto de la clase Info.
    </p>
</div>

```java
public class Objetivo {
    
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){

        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Info(revoluciones).setVisible(true);
            }
        });
        return revoluciones;
    }  
}
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Para finalizar, todo este ejercicio tenía la idea de utilizar el patrón de Filtros de Intercepción, y estos se implementan precisamente en la clase interface <strong>Filtro</strong> y sus dos herederas, <em>FiltroCalcularVelocidad</em> y <em>FiltroRepercutirRozamiento</em>.
    </p>
    <p>
    Filtro tiene un solo método abstracto,  ejecutar, que en FiltroRepercutirRozamiento se basa en restarle 2.5 a las revoluciones dadas y en FiltroCalcularVelocidad, sumarle o restarle 100 siempre que este acelerando o frenando, respectivamente.
    </p>
    <p>
    Creemos que conseguimos implementar con éxito el patrón ya que nuestro Cliente, cuando quiere información, llama al Gestor y este crea tanto la Cadena como los Filtros, dejando que esta primera sea la que maneje los segundos y tras esto lleve la información modificada al Objetivo.
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/e4main-acelerando.jpeg" width="70%" >
    <p class="leyenda" style = 'margin:0px'><strong>Ilustración X</strong>. Salida del programa main.java</p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <p>
    <img src="../img/e4main-encendido.jpeg" width="70%" >
    <p class="leyenda" style = 'margin:0px'><strong>Ilustración X</strong>. Salida del programa main.java</p>
</div>

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Como vemos en las ilustraciones hay un botón que se encarga de encender y apagar el motor, otro para acelerar y dear de hacerlo y un tercero hacer lo mismo con el freno. Cada vez que se pulsa uno de estos tres botones, salvo en el caso de Soltar acelerador y Soltar freno, aparece la segunda ventana donde se muestra en los recuadros el valor que aparece arriba, las RPM, la velocidad y los kilómetros recorridos.
    </p>
</div>

## Conflictos encontrados
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Al principio nos costó entender la jerarquía de control con este patrón ya que todas las clases siguen una estructura de torre, dependiendo cada una de la de encima. Sin embargo, una vez comprendida no tuvimos mayor problema para implementarlo salvo en el caso de los paneles que se muestran, ya que en el guion se habla de jPanel pero ya que no conseguíamos que se mostraran como queríamos los hemos cambiado por jFrames, lo cual no modifica la funcionalidad del código y representa con mayor claridad la interfaz.
    </p>
</div>
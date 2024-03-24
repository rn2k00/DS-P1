# Patrón Factoría Abstracta + Patrón Prototipo.

## Planteamiento del problema
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Diseñar e implementar una aplicación con la misma funcionalidad que el ejercicio anterior, aplicando el patrón Factoría Abstracta junto con el patrón Prototipo. Para desarrollar esta aplicación se ha elegido el lenguaje de programación <strong>Python</strong> y se ha llevado a cabo con el uso de hebras.
    </p>
</div>

## Diagrama de diseño
<div class="parrafo"  style = 'text-align:justify;'>
    <p>
    Por un lado, para separar la creación de objetos de su uso, se han creado las clases abstractas <em>FactoriaMontaña</em> y <em>FactoriaCarretera</em> que heredan de la interfaz <em>FactoriaCarreraYBicicleta</em>, de esta forma se pueden crear objetos sin tener que especificar su clase.
    </p>
    <p>
    Por otro lado, usando el patrón creacional Prototipo, los objetos se crean por clonación de la instancia que se quiera, o bien a partir de la clase <em>CarreraMontaña</em> o <em>CarreraCarretera</em> que heredan de la clase abstracta <em>Carrera</em>, o bien a partir de <em>BicicletaMontaña</em> o <em>BicicletaCarretera</em> que heredan de la clase abstracta <em>Bicicleta</em>.
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/Diagrama-P2.png">
    <p class="leyenda" style = 'margin:0px'><strong>Ilustración X</strong>. Diagrama de diseño, ejercicio 2.</p>
</div>

## Solución del problema
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Este ejercicio se ha intentado resolver tanto sin hebras como con hebras, primero se va a explicar la jerarquía de clases puesto que es la misma en ambos casos y posteriormente los programas principales que la utilizan. Se evitará incluir las importaciones de módulos. 
    </p>
    <p>
    La interfaz <strong>FactoriaCarreraBicicleta</strong> es muy simple, al igual que en el ejercicio anterior tiene dos métodos abstractos CrearCarrera y CrearBicicleta que serán las subclases las que los implementen.
    </p>
</div>

```python
class FactoriaCarreraBicicleta(ABC):
    
    @abstractmethod
    def crear_carrera(self):
        pass

    @abstractmethod
    def crear_bicicleta(self):
        pass
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Las subclases <strong>FactoriaCarretera</strong> y <strong>FactoriaMontaña</strong> son muy parecidas, pero permiten crear familias de objetos relacionados distintos entre sí. FactoriaCarretera permitirá crear objetos CarreraCarretera o BicicletaCarretera.
    </p>
</div>

```python
class FactoriaCarretera(FactoriaCarreraBicicleta):

    def crear_carrera(self, bicicletas, porcentaje):
        return CarreraCarretera(bicicletas, porcentaje)

    def crear_bicicleta(self, id):
        return BicicletaCarretera(id)
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La clase <strong>CarreraCarretera</strong> que hereda de <strong>Carrera</strong>, en su constructor llama a la clase padre para inicializar el objeto. A diferencia del ejercicio anterior, se implementa un método para realizar una copia profunda del objeto CarreraCarretera que devuelve un objeto idéntico al original. La clase <strong>CarreraMontaña</strong> es muy parecida, diferenciandose unicamente en el tipo de objeto.
    </p>
</div>

```python
class CarreraCarretera(Carrera):

    def __init__(self, bicicletas, porcentaje):
        super().__init__(bicicletas, porcentaje)

    def __deepcopy__(self, memo):
        new = CarreraCarretera(deepcopy(self.bicicletas, memo), 
                               deepcopy(self.porcentaje, memo))
        return new
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La clase <strong>BicicletaCarretera</strong> que hereda de <strong>Bicicleta</strong>, en su constructor llama a la clase padre para inicializar el objeto. A diferencia del ejercicio anterior, se implementa un método para realizar una copia profunda del objeto BicicletaCarretera que devuelve un objeto idéntico al original. La clase <strong>BicicletaMontaña</strong> es muy parecida, diferenciandose unicamente en el tipo del objeto.
    </p>
</div>

```python
class BicicletaCarretera(Bicicleta):

    def __init__(self, id):
        super().__init__(id)

    def __deepcopy__(self, memo):
        new = BicicletaCarretera(deepcopy(self.id, memo))
        return new
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La clase abstracta <strong>Carrera</strong> finalmente construye los objetos CarreraCarretera y CarreraMontaña con sus correspondientes atributos. Sin embargo, el método de copia se tiene que implementar en las subclases puesto que no es lo mismo un objeto de CarreraCarretera que un objeto CarreraMontaña.
    </p>
</div>

```python
class Carrera(ABC):

    def __init__(self, bicicletas, porcentaje):
        self.bicicletas = bicicletas
        self.porcentaje = porcentaje

    @abstractmethod
    def __deepcopy__(self, memo):
        pass
    
    def add_bicicleta(self, bicicleta):
        self.bicicletas.append(bicicleta)

    def iniciar_carrera(self, name):
        # Dormir la hebra
        sleep(60)
        # Retirar las bicis
        retirar_n_bicis = math.ceil(self.porcentaje*num_bicis)
        ...
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    La clase abstracta <strong>Bicicleta</strong> es muy simple también, construye el objeto BicicletaCarretera o BicicletaMontaña y el método de copia profunda se implementa en las subclases.
    </p>
</div>

```python
class Bicicleta(ABC):

    def __init__(self, id):
        self.id = id
    
    @abstractmethod
    def __deepcopy__(self, memo):
        pass
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Una vez comentada la jerarquía de clases se van a detallar los resultados obtenidos al ejecutar los distintos programas.
    </p>
    <p>
    En el programa <strong>main.py</strong> se crean 2 factorias distintas, con el módulo random se determina el tamaño del problema (N) delimitado entre 10 y 40 y, por último, se construyen N bicicletas de cada tipo, N con la factoriaMontaña y N con la factoriaCarretera. Tras crear las carreras, se inician y como se puede ver sólo un porcentaje concreto de bicicletas terminan la carreras.
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/e2main.png" width="70%">
    <p class="leyenda"><strong>Ilustración X</strong>. Salida programa main.py.</p>
</div>

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Mientras que el el programa <strong>main_thread.py</strong> se crean dos hebras que ejecutan cada una el método IniciarCarrera, una inicia una carrera de montaña y la otra una carrera de carretera. En el siguiente apartado se explicaran las dificultades encontradas a la hora de utilizar hebras en Python.
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="../img/e2main_thread.png" width="70%">
    <p class="leyenda"><strong>Ilustración X</strong>. Salida programa main_thread.py.</p>
</div>

## Conflictos encontrados
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Para poder trabajar con hebras se ha utilizado la clase <em>threading</em>, pero ha sido necesario crear dos subclases de tipo <em>threading.Thread</em> para modificar su método run y que así las carreras sean iniciadas por distintas hebras.
    </p>
    <p>
    En un principio, se intentó ejecutar la función InciarCarrera al crear las hebras con la opción target=carrera_mont.iniciar_carrera('en montaña'), pero de esta forma es la hebra principal (MainThread) la que ejecuta ambas llamadas.
    </p>
    <p>
    Investigando un poco más encontramos esta manera de solventar el problema.
    </p>
</div>

```
class Thread1(threading.Thread):
    def run(self):
        carrera_mont.iniciar_carrera('en montaña  ')

class Thread2(threading.Thread):
    def run(self):
        carrera_carr.iniciar_carrera('en carretera')

if __name__ == "__main__":

    bicicletas_mont = []
    bicicletas_carr = []

    factoria_mont = fm.FactoriaMontana()
    factoria_carr = fc.FactoriaCarretera()

    n_bicis = random.randrange(10, 40, 1)

    for bici in range(n_bicis):
        bm = factoria_mont.crear_bicicleta(bici+1)
        bicicletas_mont.append(bm)
        bc = factoria_carr.crear_bicicleta(bici+1)
        bicicletas_carr.append(bc)

    print("--------------------------------------------------------------")
    print("El numero de bicis en las carreras son: ", n_bicis) 
    print("--------------------------------------------------------------")

    carrera_mont = factoria_mont.crear_carrera(bicicletas_mont, 0.2)
    carrera_carr = factoria_carr.crear_carrera(bicicletas_carr, 0.1)

    # Creamos las hebras
    thread1 = Thread1()
    thread2 = Thread2()

    thread1.start()
    thread2.start()

    thread1.join()
    thread2.join()

    print("--------------------------------------------------------------")
```
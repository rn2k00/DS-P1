# Aplicación de WebScraping.

## Introducción
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Al tener poca práctica con Python y el termino WebScraping, hicimos una investigación en distintos foros como <a href="https://medium.com/@repopkukato/web-scraping-en-python-con-selenium-y-beautiful-soup-19fccb62908e">Medium</a> y <a href="https://verneacademy.com/blog/articulos-data/web-scraping-paginas-dinamicas-selenium-python-y-beautifulsoup/">VerneAcademy</a> acerca de <strong>BeautifulSoup</strong> y <strong>Selenium</strong>. Con esta información pudimos ir desarrollando gradualmente el problema.
    </p>
    <p>
    La principal diferencia entre ambas es que Beautiful Soup es ideal para extraer datos estáticos de páginas web, mientras que Selenium es más adecuado para interactuar con páginas web dinámicas y automatizar acciones complejas dentro del navegador.
    </p>
</div>

## Solución del problema 

### BeautifulSoup
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    En el código hemos añadido comentarios adicionales; aquí explicaremos las funciones más relevantes.
    </p>
    <p>
    En primer lugar, importamos los módulos necesarios y definimos una clase principal llamada <strong>WebScraper</strong>, que tendrá un constructor `__init__` que tomara un parámetro estrategia que será la que elijamos entre Selenium y BeautifulSoup. Además de la clase <em>extraer_datos(self, símbolo)</em> que extrará la información.
    </p>
    <p>
    Comenzamos con <strong>BeautifulSoup</strong> que en un principio era la más fácil de desarrollar, básicamente construimos una url a la que nos queremos conectar, extraemos y analizamos la información de esa página y la guardamos en una variable <strong>soup</strong> en formato texto.
    En este punto nos surgió el problema de cómo extraer la información concreta de la página y después de buscar encontramos que se podía ver el nombre de las variables con el método inspeccionar del navegador.
    </p>
</div>

<div class="imagen" style = 'text-align:center;'>
    <img src="https://raw.githubusercontent.com/rn2k00/Img/main/ds-5-insp.png">
</div>

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Con esta información tenemos:    
    </p>
</div>

```python
cierre_previo = soup.find("td", {"data-test": "PREV_CLOSE-value"}).text
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    El método <strong>soup.find</strong> busca en <em>soup</em> un elemento < td > (Celda de una tabla) que tenga un atributo específico <em>data-test</em> con un valor determinado "PREV_CLOSE-value". Repetimos esto con las demás variables.
    </p>
</div>

### Selenium
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    En principio <strong>Selenium</strong> es muy parecido a BeautifulSoup pero necesita una configuración más compleja a la hora de importar módulos y desarrollo, en el portal <a href="https://selenium-python.readthedocs.io/getting-started.html">Selenium with Python</a> pudimos encontramos los imports necesarios de modo que tenemos:
    </p>
</div>

```python
from selenium.webdriver.chrome.options import Options #Configurar el navegador rn Selenium
from selenium.webdriver.common.by import By #Enumeración que define los mecanismos de localización de elementos en Selenium
from selenium.webdriver.support.ui import WebDriverWait #Esperas explicitas
from selenium.webdriver.support import expected_conditions as EC #Expected Condition
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Al igual que en BeautifulSoup definimos un <em>extraer_datos</em> en la que creamos una url pero tenemos que configurar Selenium.
    Mediante <em>options</em> establecemos <strong>headless</strong> en true para no tener interfaz gráfica y ocultar el navegador. 
    </p>
</div>


```python
# Configuración de Selenium
        options = Options()
        options.headless = True
        driver = webdriver.Chrome(options=options)
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Por último extraemos la información, lo dividimos en 2 partes de las cuales la segunda fue la más dificil, gracias a un foro de <a href="https://stackoverflow.com/questions/40708200/python-selenium-webdriver-wait-until-css-selector-visible">StackOverflow</a> pudimos solucionarlo:
    </p>
    <p>
</div>

```
    1. wait = WebDriverWait(driver, 10): Con esto nos aseguramos de que los elementos HTML que estamos buscando estén presentes en la página antes de intentar extraer su contenido

    2. cierre_previo = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "td[data-test='PREV_CLOSE-value']"))).text: localizamos un elemento utilizando un selector CSS mediante una condición de esperada que indica que Selenium debe esperar hasta que el elemento td sea visible en la página antes de continuar.
```

### Main

```
1. simbolo = "TSLA": Creamos un simbolo con el nombre de la accion
2. web_scraper = WebScraper(Estrategia): Estrategia usada
3. dataX = web_scraper.extraer_datos(simbolo): Scraping y obtención de datos
4. json.dump(dataX, open("salidaX.json", "w")): Guardado de los datos en un archivo JSON
```

<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Al ejecutar en algunas ocasiones hay que darle al botón de X para detener el navegador y continuar con la ejecución. 
    </p>
</div>

## Conclusión
<div class="parrafo" style = 'text-align:justify;'>
    <p>
    Tras este ejercicio podemos determinar que BeautifulSoup no ejecuta JavaScript y solo accede al contenido HTML inicial mientras que Selenium si lo hace, accediendo al contenido dinámico y a elementos interactivos.
    </p>
    <p>
    En términos de velocidad BeautifulSoup es más rápido al no cargar un navegador completo y Selenium puede ser más lento, especialmente en modo visible, al cargar el navegador y simular interacciones.
    </p>
    <p>
    Se ha usado el patrón Strategy para permitir al programa elegir entre dos formas de realizar el web scraping. Este patrón separa las estrategias de scraping de la clase principal, lo que hace que el código sea más flexible. Así, se pueden agregar nuevas estrategias fácilmente y cambiar entre ellas sin alterar el código principal.
    </p>
</div>





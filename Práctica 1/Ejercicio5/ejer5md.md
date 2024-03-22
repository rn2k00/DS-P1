# Ejercicio 5

## Introducción

Al tener poca práctica con Python y el termino WebScraping, hicimos una investigación en distintos foros como [*Medium*](https://medium.com/@repopkukato/web-scraping-en-python-con-selenium-y-beautiful-soup-19fccb62908e) y [*VerneAcademy*](https://verneacademy.com/blog/articulos-data/web-scraping-paginas-dinamicas-selenium-python-y-beautifulsoup/) acerca de **BeautifulSoup** y **Selenium**. Con esta información pudimos ir desarrollando gradualmente el problema.

La principal diferencia entre ambas es que Beautiful Soup es ideal para extraer datos estáticos de páginas web, mientras que Selenium es más adecuado para interactuar con páginas web dinámicas y automatizar acciones complejas dentro del navegador.

## Código

#### BeautifulSoup
En el código hemos añadido comentarios adicionales; aquí explicaremos las funciones más relevantes.
En primer lugar, importamos los módulos necesarios y definimos una clase principal llamada *WebScraper*, que tendrá un constructor `__init__` que tomara un parámetro estrategia que será la que elijamos entre Selenium y BeautifulSoup. Además de la clase `extraer_datos(self, símbolo)` que extrará la información.

Comenzamos con **BeautifulSoup** que en un principio era la más fácil de desarrollar, básicamente construimos una url a la que nos queremos conectar, extraemos y analizamos la información de esa página y la guardamos en una variable **soup** en formato texto.
En este punto nos surgió el problema de cómo extraer la información concreta de la página y después de buscar encontramos que se podía ver el nombre de las variables con el método inspeccionar del navegador.

![Texto alternativo](https://raw.githubusercontent.com/rn2k00/Img/main/ds-5-insp.png)

Con esta información tenemos:
```python
cierre_previo = soup.find("td", {"data-test": "PREV_CLOSE-value"}).text
```

El método `soup.find` busca en `soup` un elemento `<td>`(Celda de una tabla) que tenga un atributo específico `data-test` con un valor determinado `"PREV_CLOSE-value"`. Repetimos esto con las demás variables.

#### Selenium

En principio **Selenium** es muy parecido a BeautifulSoup pero necesita una configuración más compleja a la hora de importar módulos y desarrollo, en el portal [Selenium with Python](https://selenium-python.readthedocs.io/getting-started.html) pudimos encontramos los imports necesarios de modo que tenemos:
```python
from selenium.webdriver.chrome.options import Options #Configurar el navegador rn Selenium
from selenium.webdriver.common.by import By #Enumeración que define los mecanismos de localización de elementos en Selenium
from selenium.webdriver.support.ui import WebDriverWait #Esperas explicitas
from selenium.webdriver.support import expected_conditions as EC #Expected Condition
```
Al igual que en BeautifulSoup definimos un `extraer_datos` en la que creamos una url pero tenemos que configurar Selenium.
Mediante `options` establecemos *headless* en true para no tener interfaz gráfica y ocultar el navegador. 
```python
# Configuración de Selenium
        options = Options()
        options.headless = True
        driver = webdriver.Chrome(options=options)
```
Por último extraemos la información, lo dividimos en 2 partes de las cuales la segunda fue la más dificil, gracias a un foro de [StackOverflow](https://stackoverflow.com/questions/40708200/python-selenium-webdriver-wait-until-css-selector-visible) pudimos solucionarlo:
1. `wait = WebDriverWait(driver, 10)` : Con esto nos aseguramos de que los elementos HTML que estamos buscando estén presentes en la página antes de intentar extraer su contenido

2. `cierre_previo = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "td[data-test='PREV_CLOSE-value']"))).text` : localizamos un elemento utilizando un selector CSS mediante una condición de esperada que indica que Selenium debe esperar hasta que el elemento td sea visible en la página antes de continuar.

#### Main
1. `simbolo = "TSLA"` : Creamos un simbolo con el nombre de la accion
2. `web_scraper = WebScraper(Estrategia)`: Estrategia usada
3. `dataX = web_scraper.extraer_datos(simbolo)` : Scraping y obtención de datos
4. `json.dump(dataX, open("salidaX.json", "w"))` : Guardado de los datos en un archivo JSON

>Al ejecutar en algunas ocasiones hay que darle al botón de X para detener el navegador y continuar con la ejecución. 
### Conclusión

Tras este ejercicio podemos determinar que BeautifulSoup no ejecuta JavaScript y solo accede al contenido HTML inicial mientras que Selenium si lo hace, accediendo al contenido dinámico y a elementos interactivos.

En términos de velocidad BeautifulSoup es más rápido al no cargar un navegador completo y Selenium puede ser más lento, especialmente en modo visible, al cargar el navegador y simular interacciones.

Se ha usado el patrón Strategy para permitir al programa elegir entre dos formas de realizar el web scraping. Este patrón separa las estrategias de scraping de la clase principal, lo que hace que el código sea más flexible. Así, se pueden agregar nuevas estrategias fácilmente y cambiar entre ellas sin alterar el código principal.

import json 
import requests  # Realizar solicitudes HTTP
from bs4 import BeautifulSoup  # Analiza la estructura HTML de las páginas web 
from selenium import webdriver  # Automatizar el navegador
from selenium.webdriver.chrome.options import Options #Configurar el navegador rn Selenium
from selenium.webdriver.common.by import By #Enumeración que define los mecanismos de localización de elementos en Selenium
from selenium.webdriver.support.ui import WebDriverWait #Esperas expicitas
from selenium.webdriver.support import expected_conditions as EC #Expected Conditions

# Clase principal para el webscraper
class WebScraper:

    #Constructor
    def __init__(self, estrategia):
        self.estrategia = estrategia

    def extraer_datos(self, simbolo):
        return self.estrategia.extraer_datos(simbolo)

# Estrategia utilizando BeautifulSoup para el webscraping
class EstrategiaBeautifulSoup:
    def extraer_datos(self, simbolo):
        # Construcción de la URL
        url = "https://finance.yahoo.com/quote/" + simbolo
        
        # Realización de la solicitud HTTP
        respuesta = requests.get(url)
        
        # Analisis del HTML utilizando BeautifulSoup
        soup = BeautifulSoup(respuesta.text, 'html.parser')

        # Extracción de la información requerida usando la funcion inspeccionar del navegador
        cierre_previo = soup.find("td", {"data-test": "PREV_CLOSE-value"}).text
        precio_apertura = soup.find("td", {"data-test": "OPEN-value"}).text
        volumen = soup.find("td", {"data-test": "TD_VOLUME-value"}).text
        capitalizacion = soup.find("td", {"data-test": "MARKET_CAP-value"}).text

        return {
            "simbolo": simbolo,
            "cierre_previo": cierre_previo,
            "precio_apertura": precio_apertura,
            "volumen": volumen,
            "capitalizacion": capitalizacion
        }
        
# Estrategia utilizando Selenium para el webscraping
class EstrategiaSelenium:
    def extraer_datos(self, simbolo):
        # Construcción de la URL
        url = "https://finance.yahoo.com/quote/" + simbolo

        # Configuración de Selenium
        options = Options()
        options.headless = True
        driver = webdriver.Chrome(options=options)
        
        # Realización de la solicitud HTTP
        driver.get(url)

        # Extracción de la información requerida usando la funcion inspeccionar del navegador
        wait = WebDriverWait(driver, 10)
        cierre_previo = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "td[data-test='PREV_CLOSE-value']"))).text
        precio_apertura = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "td[data-test='OPEN-value']"))).text
        volumen = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "td[data-test='TD_VOLUME-value']"))).text
        capitalizacion = wait.until(EC.visibility_of_element_located((By.CSS_SELECTOR, "td[data-test='MARKET_CAP-value']"))).text

        driver.quit()

        return {
            "simbolo": simbolo,
            "cierre_previo": cierre_previo,
            "precio_apertura": precio_apertura,
            "volumen": volumen,
            "capitalizacion": capitalizacion
        }

def main():
    simbolo = "TSLA"   
     
    # Estrategia BeautifulSoup
    web_scraper = WebScraper(EstrategiaBeautifulSoup())
    
    # Realización del scraping y obtención de los datos
    dataB = web_scraper.extraer_datos(simbolo)

    # Guardado de los datos en un archivo JSON
    json.dump(dataB, open("salidaB.json", "w"))

    print("salidaB.json creado con BeautifulSoup")

    # Estrategia Selenium
    web_scraper = WebScraper(EstrategiaSelenium())
    
    dataS = web_scraper.extraer_datos(simbolo)

    json.dump(dataS, open("salidaS.json", "w"))

    print("salidaS.json creado con Selenium")

# Llamada a la función principal
if __name__ == "__main__":
    main()

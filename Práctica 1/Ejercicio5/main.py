import json 
import requests  # Importa el módulo requests para realizar solicitudes HTTP
from bs4 import BeautifulSoup  # Analiza la estructura HTML de las páginas web y extraer la información deseada

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

        # Extracción de la información requerida
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

def main():
    simbolo = "TSLA"   
     
    # Estrategia BeautifulSoup
    web_scraper = WebScraper(EstrategiaBeautifulSoup())
    
    # Realización del scraping y obtención de los datos
    data = web_scraper.extraer_datos(simbolo)

    # Guardado de los datos en un archivo JSON
    json.dump(data, open("salida.json", "w"))

    print("salida.jason creado")

# Llamada a la función principal
if __name__ == "__main__":
    main()

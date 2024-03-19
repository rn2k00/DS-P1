#Se importan los módulos necesarios para el scraping y el manejo de archivos JSON.


import json 
import requests  # Importa el módulo requests para realizar solicitudes HTTP
from bs4 import BeautifulSoup  # Analizar la estructura HTML de las páginas web y extraer la información deseada

# Clase principal para el web scraper
class WebScraper:

    #Constructor
    def __init__(self, estrategia):
        self.estrategia = estrategia

    def extraer_datos(self, simbolo):
        return self.estrategia.extraer_datos(simbolo)


# Estrategia utilizando BeautifulSoup para el web scraping
class EstrategiaBeautifulSoup:

import FactoriaMontana as fm
import FactoriaCarretera as fc
import random
from copy import deepcopy

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

    print("----------------------------------------------------------------------------------------------")
    print("El numero de bicis en las carreras son: ", n_bicis)   
    print("----------------------------------------------------------------------------------------------")
    
    carrera_mont = factoria_mont.crear_carrera(bicicletas_mont, 0.2)
    carrera_carr = factoria_carr.crear_carrera(bicicletas_carr, 0.1)

    carrera_mont.iniciar_carrera('en montaña  ')
    carrera_carr.iniciar_carrera('en carretera')

    print("----------------------------------------------------------------------------------------------")
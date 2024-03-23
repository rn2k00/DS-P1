import threading
import random
import FactoriaMontana as fm
import FactoriaCarretera as fc

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

    n_bicis = random.randrange(10, 30, 1)

    for bici in range(n_bicis):
        bm = factoria_mont.crear_bicicleta(bici+1)
        bicicletas_mont.append(bm)
        bc = factoria_carr.crear_bicicleta(bici+1)
        bicicletas_carr.append(bc)

    print("----------------------------------------------------------------------------------------------")
    print("El numero de bicis en las carreras son: ", n_bicis) 
    print("----------------------------------------------------------------------------------------------")

    carrera_mont = factoria_mont.crear_carrera(bicicletas_mont)
    carrera_carr = factoria_carr.crear_carrera(bicicletas_carr)

    # Creamos las hebras
    thread1 = Thread1()
    thread2 = Thread2()

    thread1.start()
    thread2.start()

    thread1.join()
    thread2.join()

    print("----------------------------------------------------------------------------------------------")
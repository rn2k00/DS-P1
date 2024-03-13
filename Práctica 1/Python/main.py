import threading
import random
import FactoriaMontana as fm
import FactoriaCarretera as fc
from time import sleep

def ejecutar():
    print(f'Comienza {threading.current_thread().name}')
    sleep(random.random())  # esperamos un tiempo aleatorio entre 0 y 1 segundos
    print(f'Termina {threading.current_thread().name}')

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

    print("El numero de bicis en las carreras son: ", n_bicis)   
    carrera_mont = factoria_mont.crear_carrera(bicicletas_mont)
    carrera_carr = factoria_carr.crear_carrera(bicicletas_carr)

    thread1 = threading.Thread(target=carrera_mont.iniciar_carrera('hilo1'))
    thread2 = threading.Thread(target=carrera_carr.iniciar_carrera('hilo2'))
 
    thread1.start()
    thread2.start()
    
    # creamos los hilos
    hilo1 = threading.Thread(target=ejecutar, name='Hilo 1')
    hilo2 = threading.Thread(target=ejecutar, name='Hilo 2')

    # ejecutamos los hilos
    hilo1.start()
    hilo2.start()

    # esperamos a que terminen los hilos
    hilo1.join()
    hilo2.join()
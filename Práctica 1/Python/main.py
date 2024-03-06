import FactoriaMontana
import FactoriaCarretera

if __name__ == "__main__":
    
    factoria_mont = FactoriaMontana.FactoriaMontana()
    factoria_carr = FactoriaCarretera.FactoriaCarretera()
    
    carrera1 = factoria_mont.crear_carrera()
    carrera2 = factoria_carr.crear_carrera()
    
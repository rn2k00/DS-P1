package java;

import java.util.ArrayList;

/**
 * carrera
 */
public abstract class carrera {
    int duracionMilisegundos = 60000;
    ArrayList<bicicleta> participantes = new ArrayList<bicicleta>(); 
    int numeroParticipantes;
    float porcentajeARetirar;
    string mensajeInicio;
    string mensajeRetirada;
    string mensajeFinal;

    public setPorcentajeARetirar(float porcentaje){
        porcentajeARetirar = porcentaje;
    }

    public setMensajeInicio(string mensaje){
        mensajeInicio = mensaje;
    }

    public setMensajeRetirada(string mensaje){
        mensajeRetirada = mensaje;
    }

    public setMensajeFinal(string mensaje){
        mensajeFinal = mensaje;
    }

    public setnumeroParticipantes(int numero){
        numeroParticipantes = numero;
    }

    public int numeroARetirar(){
        return (int) (numeroParticipantes * porcentajeARetirar);    
    }
    
    public void realizarCarrera(){
        System.out.println(mensajeInicio);
        sleep(duracionMilisegundos);
        //Retirar participantes

        System.out.println(mensajeFinal);
    }
}
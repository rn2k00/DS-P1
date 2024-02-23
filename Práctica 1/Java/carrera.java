package java;

import java.util.ArrayList;

/**
 * carrera
 */
public abstract class carrera {
    int duracionMilisegundos = 60000;
    ArrayList<bicicleta> participantes = new ArrayList<bicicleta>(); 
    float porcentajeARetirar;
    string mensajeInicio;
    string mensajeFinal;
    string mensajeRetirada;

    private int numeroARetirar(){
        return (int) (numeroParticipantes * porcentajeARetirar);    
    }
    
    public void realizarCarrera(){
        System.out.println(mensajeInicio);
        sleep(duracionMilisegundos);
        retirarParticipantes();
        System.out.println(mensajeFinal);
    }

    private void mensajeRetirada(int[] retirados){
        System.out.println(mensajeRetirada);
        for (int i = 0; i < retirados.length; i++) {
            System.out.println(participantes.get(retirados[i]));
        }
    }

    private void retirarParticipantes(){
        int numeroRetirar = numeroARetirar();
        int[] retirados = new int[numeroRetirar];
        for (int i = 0; i < numeroRetirar; i++) {
            int indiceRetirar = (int) (Math.random() * participantes.size());
            participantes.remove(indiceRetirar);
            retirados[i] = indiceRetirar;
        }
        mensajeRetirada(retirados);
    }
}
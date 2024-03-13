package java;

import java.util.ArrayList;

/**
 * carreraMontana
 */
public class carreraMontana extends carrera{
    public carreraMontana(ArrayList<bicicleta> participantes){
        this.participantes = participantes; 
        porcentajeARetirar = 0.2;
        mensajeInicio = "Comienza la carrera de montaña.";
        mensajeFinal = "Termina la carrera de montaña.";
        mensajeRetirada = "Se retiran los siguientes participantes de la carrera de montaña:";
    }
    
}
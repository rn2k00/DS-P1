package java;

import java.util.ArrayList;

/**
 * carreraCarretera
 */
public class carreraCarretera extends carrera{
    public carreraCarretera(ArrayList<bicicleta> participantes){
        this.participantes = participantes;
        porcentajeARetirar = 0.1;
        mensajeInicio = "Comienza la carrera de carretera.";
        mensajeFinal = "Termina la carrera de carretera.";
        mensajeRetirada = "Se retiran los siguientes participantes de la carrera de carretera:";
    }

    

}
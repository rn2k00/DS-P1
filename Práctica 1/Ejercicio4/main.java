package prac4;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Usuario
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int accion = 0;
        
        Cliente cliente = new Cliente();
        
        cliente.gestor.addFiltroRoza();
        
        cliente.gestor.addFiltroVelo();
        
        while(true){
        System.out.println("Estado del coche: " + cliente.estadomotor);
        System.out.println("¿Qué quieres hacer?");
        System.out.println("1: Encender");
        System.out.println("2: Acelerar");
        System.out.println("3: Frenar");
        System.out.println("4: Apagar");
        
        try {
             accion = Integer.parseInt(br.readLine());
        } catch (IOException ex) {
            Logger.getLogger(prac4.main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        switch(accion){
            case 1 :
                cliente.arrancar();
                break;           
            case 2:
                if(cliente.estadomotor != EstadoMotor.APAGADO)
                    cliente.acelerar();
                else
                    System.out.println("Acción desconocida, inténtelo de nuevo");                    
                break;
            case 3: 
                if(cliente.estadomotor != EstadoMotor.APAGADO)
                    cliente.frenar();
                else
                    System.out.println("Acción desconocida, inténtelo de nuevo");
                break;
            case 4:
                if(cliente.estadomotor != EstadoMotor.APAGADO)
                    cliente.apagar();
                else
                    System.out.println("Acción desconocida, inténtelo de nuevo");
                break;
            default:
                System.out.println("Acción desconocida, inténtelo de nuevo");
        }
        
        cliente.peticion();
        
        // TODO code application logic here
    }
    }
    
}


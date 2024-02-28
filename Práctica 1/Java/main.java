/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package java;

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
        int parti=0;
        System.out.println("Elija el número de participantes de las carreras: ");
        
        try {
             parti = Integer.parseInt(br.readLine());
        } catch (IOException ex) {
            Logger.getLogger(main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        FactoriaCarretera facto1 = new FactoriaCarretera(parti);
        
        FactoriaMontana facto2 = new FactoriaMontana(parti);
        
        facto1.crearBicicleta();
        
        facto2.crearBicicleta();
        
        facto1.crearCarrera();
        
        facto2.crearCarrera();
        
        facto1.carre.realizarCarrera();
        
        facto2.carre.realizarCarrera();
        
        
        // TODO code application logic here
    }
    
}

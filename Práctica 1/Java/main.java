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
import java.util.ArrayList;
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
        
        ArrayList<bicicleta> parti_carretera = new ArrayList<bicicleta>();
        ArrayList<bicicleta> parti_montana = new ArrayList<bicicleta>();
        
        FactoriaCarretera facto1 = new FactoriaCarretera();
        
        FactoriaMontana facto2 = new FactoriaMontana();
        
        for (int i = 0; i < parti; i++){
          bicicleta bici = facto1.crearBicicleta(i+1);
          bicicleta bici2 = facto2.crearBicicleta(i+1);
          parti_carretera.add(bici);
          parti_montana.add(bici2);
        }
        
        
        carrera Carretera =facto1.crearCarrera(parti_carretera);
        
        carrera Montana = facto2.crearCarrera(parti_montana);    
        
        Thread hebraCarretera = new Thread(Carretera::realizarCarrera);
        Thread hebraMontana = new Thread(Montana::realizarCarrera);

        hebraCarretera.start();
        hebraMontana.start();
        
        
        // TODO code application logic here
    }
    
}

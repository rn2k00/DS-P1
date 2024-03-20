/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac4;

/**
 *
 * @author Usuario
 */
public class Objetivo {
    
    
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){

      
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Info(revoluciones).setVisible(true);
            }
        });
        return revoluciones;
    }
    
    
}
    
    
}

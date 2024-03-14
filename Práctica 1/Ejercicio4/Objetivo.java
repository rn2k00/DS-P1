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
        double vel_lineal = (2 * Math.PI * 0.15 * revoluciones * 60)/1000;
        System.out.println("RPM: " + revoluciones);
        System.out.println("Velocidad: " + vel_lineal + " Km/h");
        System.out.println("Distancia recorrida (Kms): ");
        
        return revoluciones;
    }
    
    
}

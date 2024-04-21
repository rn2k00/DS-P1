/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac4;

/**
 *
 * @author Usuario
 */
public class FiltroRepercutirRozamiento implements Filtro {
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        double rozamiento = -2.5;
        if(estadomotor == EstadoMotor.ACELERANDO || estadomotor == EstadoMotor.FRENANDO){
            return rozamiento;  
        }
                 
        else
            return 0;
    }
    
}


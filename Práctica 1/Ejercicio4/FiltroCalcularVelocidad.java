/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac4;

/**
 *
 * @author Usuario
 */
public class FiltroCalcularVelocidad implements Filtro{
    
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        int incrementoVelocidad;
        double devolver;
        
        if (estadomotor == EstadoMotor.ACELERANDO){
            incrementoVelocidad = 100;
            if(revoluciones < 4900)
                devolver= revoluciones + incrementoVelocidad;
            else
                devolver= revoluciones;            
        }
        else if (estadomotor == EstadoMotor.FRENANDO){
            incrementoVelocidad = -100;
            if (revoluciones > 100)
                devolver = revoluciones + incrementoVelocidad;           
            else
                devolver = 0;           
        }        
        else{
            devolver = 0;   
        }
        return devolver;
      
    }
    
}

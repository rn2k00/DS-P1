/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac4;

/**
 *
 * @author Usuario
 */
public class GestorFiltros {
    
    CadenaFiltros cadena;
    
    public GestorFiltros(){
        cadena = new CadenaFiltros();
    }
    
    public void addFiltroRoza(){
        FiltroRepercutirRozamiento fil = new FiltroRepercutirRozamiento();
        cadena.filtros.add(fil);       
    }
    
    public void addFiltroVelo(){
        FiltroCalcularVelocidad fil = new FiltroCalcularVelocidad();
        cadena.filtros.add(fil); 
    }
    
    public double peticionFiltros(double revoluciones, EstadoMotor estadomotor){        
        return cadena.ejecutar(revoluciones, estadomotor);       
    }
    
}


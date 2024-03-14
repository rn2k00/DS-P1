/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac4;

/**
 *
 * @author Usuario
 */
public class Cliente {
    
    EstadoMotor estadomotor;
    double rev;
    GestorFiltros gestor;
    
    public Cliente(){
        
        gestor = new GestorFiltros();
        estadomotor = EstadoMotor.APAGADO;
        rev = 0;
    }
    
    public void arrancar(){
        estadomotor = EstadoMotor.ENCENDIDO;
    }
    
     public void acelerar(){
        estadomotor = EstadoMotor.ACELERANDO;
    }
     
      public void frenar(){
        estadomotor = EstadoMotor.FRENANDO;
    }
      
    public void apagar(){
        estadomotor = EstadoMotor.APAGADO;
    }
    
    public void peticion(){
        rev =gestor.peticionFiltros(rev, estadomotor);
        
        
    }
    
}

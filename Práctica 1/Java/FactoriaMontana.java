/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package java;

/**
 *
 * @author Usuario
 */
import prac1.FactoriaCarreraBicicleta;
import prac1.bicicletaMontana;
import prac1.carreraMontana;
import java.util.ArrayList;
public class FactoriaMontana implements FactoriaCarreraBicicleta{
    
    
    @Override
    public bicicleta crearBicicleta(int i){
            return new bicicletaMontana(i);       
    }
    
    @Override
    public carrera crearCarrera(ArrayList<bicicleta> participantes){
        return new carreraMontana(participantes);
        
    }
        
}
  

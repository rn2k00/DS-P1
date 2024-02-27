/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ds.prac1;

/**
 *
 * @author Usuario
 */
import ds.prac1.bicicletaCarretera;
import ds.prac1.carreraCarretera;
public class FactoriaCarretera implements FactoriaCarrerayBicicleta{
    
    carreraCarretera carre;
    bicicletaCarretera bici;
    
    public FactoriaCarretera(){
        
        
        
        
    }
    
    @Override
    public void crearCarrera(){
        carre = new carreraCarretera();
        
    }
    
    @Override
    public void crearBicicleta(){
        bici = new bicicletaCarretera();
        
    }
    
}

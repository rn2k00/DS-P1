/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ds.prac1;

/**
 *
 * @author Usuario
 */
import ds.prac1.BicicletaCarretera;
import ds.prac1.CarreraCarretera;
public class FactoriaCarretera implements FactoriaCarrerayBicicleta{
    
    CarreraCarretera carre;
    BicicletaCarretera bici;
    
    public FactoriaCarretera(){
        
        
        
        
    }
    
    @Override
    public void crearCarrera(){
        carre = new CarreraCarretera();
        
    }
    
    @Override
    public void crearBicicleta(){
        bici = new BicicletaCarretera();
        
    }
    
}

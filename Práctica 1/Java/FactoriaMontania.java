/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ds.prac1;

/**
 *
 * @author Usuario
 */
import ds.prac1.BicicletaMontania;
import ds.prac1.CarreraMontania;
public class FactoriaMontania implements FactoriaCarrerayBicicleta {
    CarreraMontania carre;
    BicicletaMontania bici;
    
    public FactoriaMontania(){
        
    }
    
    @Override
    public void crearCarrera(){
        carre = new CarreraMontania();
        
    }
    
    @Override
    public void crearBicicleta(){
        bici = new BicicletaMontania();
        
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ds.prac1;

/**
 *
 * @author Usuario
 */
import ds.prac1.bicicletaMontana;
import ds.prac1.carreraMontana;
public class FactoriaMontania implements FactoriaCarrerayBicicleta {
    carreraMontana carre;
    bicicletaMontana bici;
    
    public FactoriaMontania(){
        
    }
    
    @Override
    public void crearCarrera(){
        carre = new carreraMontana();
        
    }
    
    @Override
    public void crearBicicleta(){
        bici = new bicicletaMontana();
        
    }
    
}

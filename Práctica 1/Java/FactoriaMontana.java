/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac1;

/**
 *
 * @author Usuario
 */
import prac1.FactoriaCarreraBicicleta;
import prac1.bicicletaMontana;
import prac1.carreraMontana;
public class FactoriaMontana extends FactoriaCarreraBicicleta {
    carreraMontana carre;
    bicicletaMontana bici;
    
    
    public FactoriaMontana(int n){
        nbicis = n;
        
    }
    
    @Override
    public void crearBicicleta(){
        for (int i = 0; i < nbicis; i++){
            bici = new bicicletaMontana(i+1);
            participantes.add(i, bici);
        }
        
    }
    @Override
    public void crearCarrera(){
        carre = new carreraMontana(participantes);
        
    }
    
    
    
}

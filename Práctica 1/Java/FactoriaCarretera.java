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
import prac1.bicicletaCarretera;
import prac1.carreraCarretera;
public class FactoriaCarretera extends FactoriaCarreraBicicleta{
    
    carreraCarretera carre;
    bicicletaCarretera bici;
    
    public FactoriaCarretera(int n){
        nbicis = n;
      
    }
    
    @Override
    public void crearBicicleta(){
        for (int i = 0; i < nbicis; i++){
            bici = new bicicletaCarretera(i+1);
            participantes.add(i, bici);
        }
        
    }
    
    @Override
    public void crearCarrera(){
        carre = new carreraCarretera(participantes);
        
    }
        
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac4;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class CadenaFiltros {
    
    public ArrayList<Filtro> filtros;
    public Objetivo obj;
    
    public void ejecutar(double revoluciones, EstadoMotor estadomotor){
        double new_rev = 0;
        for (int i = 0; i < filtros.size(); i++){
            new_rev +=filtros.get(i).ejecutar(revoluciones, estadomotor);
        }
        
        obj.ejecutar(new_rev, estadomotor);
    }
    
}

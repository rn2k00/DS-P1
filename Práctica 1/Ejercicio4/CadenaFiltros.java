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
    
    public CadenaFiltros(){
        obj = new Objetivo();
        filtros = new ArrayList<Filtro>();
    }
    
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        for (int i = 0; i < filtros.size(); i++){
            revoluciones +=filtros.get(i).ejecutar(revoluciones, estadomotor);
        }
        
        return obj.ejecutar(revoluciones, estadomotor);
    }
    
}



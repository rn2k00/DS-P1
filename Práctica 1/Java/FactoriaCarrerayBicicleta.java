/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package java;

import java.util.ArrayList;
/**
 *
 * @author Usuario
 */
public abstract class FactoriaCarreraBicicleta {
    int nbicis;
    ArrayList<bicicleta> participantes = new ArrayList<bicicleta>(); 
   
    public abstract void crearCarrera();
    public abstract void crearBicicleta();
    
}

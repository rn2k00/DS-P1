package prac4;

/**
 *
 * @author Usuario
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
       
       java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Soporte_Salpicadero().setVisible(true);
            }
        });
       
        
        Soporte_Salpicadero salp = new Soporte_Salpicadero();
        
    }
    
}



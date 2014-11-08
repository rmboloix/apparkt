package apparkt;

import java.util.List;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

/**
 * Classe que hereta de persona, especifica pels administradors.
 * 
 * @author Moisés
 */
@Entity
@DiscriminatorValue(value="Admin")
public class Admin extends Persona {
    private static final long serialVersionUID = 1L;
    @OneToMany(mappedBy = "admin")
    private List<Aparcament> aparcaments;

     /**
     * Constructor per defecte
     * 
     */
    public Admin() {
    }
    
    
    /**
     * Mètode register sobreescrit
     * 
     */
    @Override
    public void register() {
       
    }

    /**
     * Mètode que permet administrar els aparcaments a un administrador.
     * 
     * @param aparcament a administrar
     */
    public void administraAparcament (Aparcament aparcament){
        
    }

}

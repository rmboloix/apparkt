package apparkt;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * Classe que hereta de persona, especifica pels usuaris.
 * 
 * @author Moisés
 */
@Entity
@DiscriminatorValue(value="Usuari")
public class Usuari extends Persona {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    private String dadesFacturacio;
    private String matricula;

    /**
     * Constructor per defecte
     * 
     */
    public Usuari() {
    }

    /**
     * Constructor que rep les dades de facturació i matricula per paràmetre.
     * 
     * @param dadesFacturacio
     * @param matricula 
     */
    public Usuari(String dadesFacturacio, String matricula) {
        this.dadesFacturacio = dadesFacturacio;
        this.matricula = matricula;
    }
    
    /**
     * Mètode register sobreescrit
     * 
     */
    @Override
    public void register() {
        
    }
    
    //A continuació venen els getters i setters.

    public String getDadesFacturacio() {
        return dadesFacturacio;
    }

    public void setDadesFacturacio(String dadesFacturacio) {
        this.dadesFacturacio = dadesFacturacio;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

}

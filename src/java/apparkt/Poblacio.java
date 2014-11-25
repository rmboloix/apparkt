package apparkt;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Classe contenidora dels atributs relatius a les poblacions.
 * 
 * @author Moisés
 */
@Entity
@Table(name="poblacio")
public class Poblacio implements Serializable {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    @Id
    @Column(length=100)
    private String nom;
    @ManyToOne
    @JoinColumn(name="provincia", referencedColumnName="nom", insertable=false, updatable=false)
    private Provincia provincia;
    
    public Poblacio() {
        
    }
    
    public Poblacio(String nom, Provincia provincia) {
        this.nom = nom;
        this.provincia = provincia;
    }
    
    //A continuació venen els getters i setters.

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Provincia getProvincia() {
        return provincia;
    }

    public void setProvincia(Provincia provincia) {
        this.provincia = provincia;
    }  
}
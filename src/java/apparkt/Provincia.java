package apparkt;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classe contenidora dels atributs relatius a les provincies.
 * 
 * @author Moisés
 */
@Entity
@Table(name="provincia")
public class Provincia implements Serializable {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    @Id
    @Column(length=100)
    private String nom;

    public Provincia() {
    }
    
    public Provincia(String nom) {
        this.nom = nom;
    }

    //A continuació venen els getters i setters.
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
package apparkt;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="zona")
public class Zona implements Serializable {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    @Id
    @Column(length=100)
    private String nom;

    public Zona() {
    }
    
    public Zona(String nom) {
        this.nom = nom;
    }
    
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
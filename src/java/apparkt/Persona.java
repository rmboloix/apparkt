package apparkt;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Classe que contindrà els atributs i mètodes pels usuaris i administradors.
 * 
 * @author Moisés
 */
@Entity
@Table(name="usuari")
@Inheritance(strategy= InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "tipususuari", discriminatorType = DiscriminatorType.STRING, length = 15)
public abstract class Persona implements Serializable {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    @Id
    private String dni;
    @Column(length=45)
    private String nom;
    @Column(length=45)
    private String cognom1;
    @Column(length=45)
    private String cognom2;
    @Embedded
    private Contacte contacte = new Contacte();
    @Column(length=15)
    private String nomusuari;
    @Column(length=15)
    private String password;
    
    
    @OneToMany(mappedBy = "usuari", fetch= FetchType.LAZY)
    private List<Reserva> reservas;
    
    /**
     * Mètode login
     * 
     */
    public void login(){
        
    }
    
    /**
     * Mètode register. Aquest mètode és abstracte i s'haurà de sobreescriure
     * donat que el procés de registre es diferent per un usuari o un admin.
     * 
     */
    public abstract void register();
    
    /**
     * Mètode per consultar les reserves fetes.
     * 
     * @return ha de retornar una llista de reserves.
     */
    public List consultaReserva(){
        return null;
    }

    //A continuació venen els getters i setters.
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getCognom1() {
        return cognom1;
    }

    public void setCognom1(String cognom1) {
        this.cognom1 = cognom1;
    }

    public String getCognom2() {
        return cognom2;
    }

    public void setCognom2(String cognom2) {
        this.cognom2 = cognom2;
    }
    
    public Contacte getContacte() {
        return contacte;
    }
    
    public void setContacte(Contacte contacte) {
        this.contacte = contacte;
    }

    public String getNomUsuari() {
        return nomusuari;
    }

    public void setNomUsuari(String nomUsuari) {
        this.nomusuari = nomUsuari;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
        @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + Objects.hashCode(this.dni);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Persona other = (Persona) obj;
        if (!Objects.equals(this.dni, other.dni)) {
            return false;
        }
        return true;
    }
    
    @Override
    public String toString() {
        return dni+" "+nom+" "+cognom1+" "+cognom2+" "+contacte.getDireccio()
                +" "+contacte.getPoblacio().getNom()+" "+contacte.getCodiPostal()
                +" "+contacte.getProvincia()+" "+contacte.getTelefon()
                +" "+contacte.geteMail()+" "+nomusuari+" "+password;
    }    
}

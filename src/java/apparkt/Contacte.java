package apparkt;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Mixi
 */
@Embeddable
public class Contacte implements Serializable{
    private static final long serialVersionUID = 1L;
    @Column(length=45)
    private String direccio;
    
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="poblacio", referencedColumnName="nom")
    private Poblacio poblacio;
    @Column(length=45)
    private String provincia;
    @Column(length=5)
    private String codiPostal;
    @Column
    private int telefon;
    @Column(length=45)
    private String eMail;
    
    public Contacte() {
        
    }
    
    public Contacte(String direccio, String codiPostal, Poblacio poblacio) {
        this.direccio = direccio;
        this.codiPostal = codiPostal;
        this.poblacio = poblacio;
    }

    public String getDireccio() {
        return direccio;
    }

    public void setDireccio(String direccio) {
        this.direccio = direccio;
    }

    public String getCodiPostal() {
        return codiPostal;
    }

    public void setCodiPostal(String codiPostal) {
        this.codiPostal = codiPostal;
    }

    public Poblacio getPoblacio() {
        return poblacio;
    }

    public void setPoblacio(Poblacio poblacio) {
        this.poblacio = poblacio;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }
    
    public int getTelefon() {
        return telefon;
    }

    public void setTelefon(int telefon) {
        this.telefon = telefon;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }
}

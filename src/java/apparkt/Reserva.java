package apparkt;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Classe que contindrà els atributs relatius a les reserves.
 * 
 * @author Moisés
 */
@Entity
@Table(name="reserva", uniqueConstraints={@UniqueConstraint(columnNames={"dni","hora_inici","hora_fi"})})
public class Reserva implements Serializable {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idReserva;
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="idplaca", referencedColumnName="idplaca")
    private Placa placa;
//    @ManyToOne
//    @JoinColumn(name="idaparcament", referencedColumnName="idaparcament")
//    private Aparcament aparcament;
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="dni", referencedColumnName="dni")
    private Usuari usuari;
    private java.sql.Timestamp hora_inici;
    private java.sql.Timestamp hora_fi;
    private Boolean utilitzada;
    private java.sql.Timestamp hora_inici_real;
    private java.sql.Timestamp hora_fi_real;
    private Double preu; // s'ha canviat el nom de l'atribut import per preu.
    private Boolean passada;
    private Boolean anulada;
    
    
    //A continuació venen els getters i setters.

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdPlaca() {
        return placa.getIdplaca();
    }

    public Usuari getUsuari() {
        return usuari;
    }

    public void setUsuari(Usuari usuari) {
        this.usuari = usuari;
    }

    public java.sql.Timestamp getHora_inici() {
        return hora_inici;
    }

    public void setHora_inici(java.sql.Timestamp hora_inici) {
        this.hora_inici = hora_inici;
    }

    public java.sql.Timestamp getHora_fi() {
        return hora_fi;
    }

    public void setHora_fi(java.sql.Timestamp hora_fi) {
        this.hora_fi = hora_fi;
    }

    public Boolean isUtilitzada() {
        return utilitzada;
    }

    public void setUtilitzada(Boolean utilitzada) {
        this.utilitzada = utilitzada;
    }

    public java.sql.Timestamp getHora_inici_real() {
        return hora_inici_real;
    }

    public void setHora_inici_real(java.sql.Timestamp hora_inici_real) {
        this.hora_inici_real = hora_inici_real;
    }

    public java.sql.Timestamp getHora_fi_real() {
        return hora_fi_real;
    }

    public void setHora_fi_real(java.sql.Timestamp hora_fi_real) {
        this.hora_fi_real = hora_fi_real;
    }

    public Double getPreu() {
        return preu;
    }

    public void setPreu(Double preu) {
        this.preu = preu;
    }

    public Boolean isPassada() {
        return passada;
    }

    public void setPassada(Boolean passada) {
        this.passada = passada;
    }
    
    public Placa getPlaca() {
        return placa;
    }

    public void setPlaca(Placa placa) {
        this.placa = placa;
    }

    public Boolean isAnulada() {
        return anulada;
    }

    public void setAnulada(Boolean anulada) {
        this.anulada = anulada;
    }
    
    @Override
    public String toString() {
        if ((hora_inici_real==null)||(hora_fi_real==null)) {
            return idReserva+" "+placa.getIdplaca()/*+" "+aparcament.getIdAparcament()*/+" "+usuari.getDni()
                +" "+usuari.getMatricula()+" "+hora_inici.toString()+" "+hora_fi.toString()+" "+utilitzada
                +" "+hora_inici_real+" "+hora_fi_real+" "+preu+" "+passada+" "+anulada;
        } else {
            return idReserva+" "+placa.getIdplaca()/*+" "+aparcament.getIdAparcament()*/+" "+usuari.getDni()
                +" "+usuari.getMatricula()+" "+hora_inici.toString()+" "+hora_fi.toString()+" "+utilitzada
                +" "+hora_inici_real.toString()+" "+hora_fi_real.toString()+" "+preu+" "+passada+" "+anulada;
        }        
    }
}

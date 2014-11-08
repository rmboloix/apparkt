package apparkt;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Classe contenidora dels atributs relatius a les places.
 * 
 * @author Moisés
 */
@Entity
@Table(name="placa")
public class Placa implements Serializable {
    private static final long serialVersionUID = 1L;
    //Definició dels atributs
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idplaca;
    @ManyToOne
    @JoinColumn(name="idaparcament", referencedColumnName="idaparcament")
    private Aparcament aparcament;
    private int planta;
    private int numero;
    @Enumerated(EnumType.STRING)
    private TipusPlaca tipusplaca;
    private boolean activa;
    
    
    //A continuació venen els getters i setters.

    public int getIdplaca() {
        return idplaca;
    }

    public void setIdplaca(int idplaca) {
        this.idplaca = idplaca;
    }

    public Aparcament getAparcament() {
        return aparcament;
    }

    public void setAparcament(Aparcament aparcament) {
        this.aparcament = aparcament;
    }

    public int getPlanta() {
        return planta;
    }

    public void setPlanta(int planta) {
        this.planta = planta;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public TipusPlaca getTipusplaca() {
        return tipusplaca;
    }

    public void setTipusplaca(TipusPlaca tipusplaca) {
        this.tipusplaca = tipusplaca;
    }

    public boolean isActiva() {
        return activa;
    }

    public void setActiva(boolean activa) {
        this.activa = activa;
    }
    
    @Override
    public String toString() {
        return idplaca+" "+aparcament.getIdAparcament()+" "+planta+" "+numero+" "+tipusplaca
                +" "+activa;
    }
}

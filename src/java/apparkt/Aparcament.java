package apparkt;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Classe encarregada de la gestió principal de l'aparcament.
 * 
 * @author Moisés
 */
@Entity
@Table(name="aparcament")
public class Aparcament implements Serializable {
    
    //Definició dels atributs
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int idAparcament;
    private String nom;
    private String direccio;
    private int telefon;
    @Column(length=45)
    private String eMail;
    @JoinColumn(name ="admin", referencedColumnName="dni")
    @ManyToOne(fetch= FetchType.LAZY)
    private Admin admin;
    @Column(name="latitude")
    private double latitud;
    @Column(name="longitude")
    private double longitud;
    @ManyToOne(fetch= FetchType.LAZY)
    @JoinColumn(name="zona", referencedColumnName="nom")
    private Zona zona;
    @OneToMany(mappedBy = "aparcament", cascade={CascadeType.ALL}, fetch= FetchType.LAZY)
    private List<Placa> llistaPlacas;
    @OneToMany(mappedBy = "aparcament", cascade={CascadeType.ALL}, fetch= FetchType.LAZY)
    private List<Reserva> llistaReserves;

    /**
     * Constructor per defecte
     * 
     */
    public Aparcament() {
    }

    /**
     * Constructor que rep els paràmetres minims necessaris per donar d'alta un aparcament.
     * 
     * @param nom
     * @param admin
     * @param latitud
     * @param longitud
     * @param zona
     */
    public Aparcament(String nom, Admin admin, double latitud, double longitud, Zona zona) {
        this.nom = nom;
        this.admin = admin;
        this.latitud = latitud;
        this.longitud = longitud;
        this.zona = zona;
    }
    
    
    
    /**
     * Mètode per consultar els aparcaments.
     * 
     * @return una llista amb els aparcaments.
     */
    public List consultaAparcament(){
        return null;
    }
    
    /**
     * Mètode per modificar un aparcament.
     * 
     */
    public void modificaAparcament(){
        
    }
    
    /**
     * Métode per eliminar un aparcament.
     * 
     */
    public void eliminaAparcament(){
        
    }
    
    /**
     * Mètode que permet consultar les places.
     * 
     * @return una llista de les places.
     */
    public List consultaPlaca(){
        return null;
    }
    
    /**
     * Mètode per modificar una plaça en concret.
     * 
     * @param placa la plaça a modificar.
     */
    public void modificaPlaca (Placa placa){
        
    }
    
    /**
     * Mètode que permet activar o desactivar una plaça en concret.
     * 
     * @param placa la plaça a activar o desactivar.
     */
    public void actDesPlaca (Placa placa){
        
    }
    
    /**
     * Mètode que permet, donada una plaça, eliminarla.
     * 
     * @param placa la plaça a eliminar.
     */
    public void eliminaPlaca (Placa placa){
        
    }
    
    /**
     * Mètode per crear una plaça nova.
     * 
     */
    public void creaPlaca(){
        
    }
    
    /**
     * Mètode que fa el càlcul de la tarifa en funciuó d'una reserva.
     * 
     * @param reserva la reserva de la qual s'ha de fer el càlcul.
     */
    public void calculaTarifa (Reserva reserva){
        
    }
    
    /**
     * Mètode que, donada una reserva, fa el cobrament.
     * 
     * @param reserva 
     */
    public void efectuaCobrament (Reserva reserva){
        
    }
    
    /**
     * Mètode que permet alliberar una reserva.
     * 
     * @param reserva la reserva a alliberar.
     */
    public void alliberaReserva (Reserva reserva){
        
    }
    
    /**
     * Mètode que permet fer una reserva.
     * 
     */
    public void fesReserva(){
        
    }
    
    /**
     * Mètode que permet modificar una reserva.
     * 
     * @param reserva la reserva a modificar.
     */
    public void modificaReserva (Reserva reserva){
        
    }
    
    /**
     * Mètode per cancel·lar una reserva.
     * 
     * @param reserva la reserva a cancel·lar.
     */
    public void cancelaReserva (Reserva reserva){
        
    }
    
    /**
     * Mètode per iniciar el periode d'estacionament en arribar l'usuari.
     * 
     * @param matricula de l'usuari.
     */
    public void iniciEstacionament (String matricula){
        
    }
    
    /**
     * Mètode per finalitzar un periode d'estacionament.
     * 
     * @param matricula de l'usuari.
     */
    public void finalEstacionament (String matricula){
        
    }
    
    //A continuació venen els getters i setters.

    public int getIdAparcament() {
        return idAparcament;
    }

    public void setIdAparcament(int idAparcament) {
        this.idAparcament = idAparcament;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getDireccio() {
        return direccio;
    }

    public void setDireccio(String direccio) {
        this.direccio = direccio;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public List getLlistaPlacas() {
        return llistaPlacas;
    }

    public void setLlistaPlacas(List llistaPlacas) {
        this.llistaPlacas = llistaPlacas;
    }

    public List getLlistaReserves() {
        return llistaReserves;
    }

    public void setLlistaReserves(List llistaReserves) {
        this.llistaReserves = llistaReserves;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public String getZona() {
        return zona.toString();
    }

    public void setZones(Zona zona) {
        this.zona = zona;
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
    
    @Override
    public String toString() {
        return idAparcament+" "+nom+" "+direccio+" "+telefon+" "+eMail
                +" "+admin.getNom()+" "+zona.getNom()+" "+latitud+" "+longitud;
    }
}
package Persistencia;

import apparkt.Persona;
import apparkt.Usuari;
import apparkt.Admin;
import apparkt.Aparcament;
import apparkt.Placa;
import apparkt.Reserva;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import utilitatsBD.LogSupport;
import utilitatsBD.UtilitatPersistenciaException;

/**
 *
 *@author Miquel Àngel Vélez Serrano
 */
public class GestorPersistenciaJPA implements GestorPersistencia{
    EntityManagerFactory emf;
    EntityManager em;
    String unitatPersistencia;
  
    /**
     * Constructor al qual li passem com a parametre el nom de la unitat de persistencia
     * @param unitatPersistencia nom de la unitat de persistencia amb que es treballara
     */    
    public GestorPersistenciaJPA(String unitatPersistencia) {
        this.unitatPersistencia=unitatPersistencia;
    }
    
    
    /**
     * Crea els EntityManager i EntityManagerFactory necessaris per treballar amb la BD Hibernate
     * @throws utilitatsBD.UtilitatPersistenciaException no llenca mai l'excepcio 
     */    
    
    @Override
    public void obrir() throws UtilitatPersistenciaException{

           emf = Persistence.createEntityManagerFactory(unitatPersistencia); 
           em = emf.createEntityManager(); 

    }

    

    @Override
    public void iniciar() throws UtilitatPersistenciaException {
        
    }

    /**
     * Tanca l'EntityManager i l'EntityManagerFactory
     * 
     */     

    @Override
    public void tancar() {
        em.close();
        emf.close();
    }

    @Override
    public void inserir(Persona p) throws UtilitatPersistenciaException {
        gestionaAlta(p);
    }

    
    @Override
    public void inserir(Aparcament a) throws UtilitatPersistenciaException {
        gestionaAlta(a);
    }

    @Override
    public void inserir(Placa p) throws UtilitatPersistenciaException {
        gestionaAlta(p);
    }

    @Override
    public void inserir(Reserva r) throws UtilitatPersistenciaException {
        gestionaAlta(r);
    }
    
    @Override
    public Admin nouAdminTemporal(String dni) throws UtilitatPersistenciaException {
        Admin nou = new Admin();
        nou.setDni(dni);
        return nou;
    }

    @Override
    public Usuari nouUsuariTemporal(String dni) throws UtilitatPersistenciaException {
        Usuari nou = new Usuari();
        nou.setDni(dni);
        return nou;
    }
    
    @Override
    public void modificar(Persona p) throws UtilitatPersistenciaException {
        gestionaModificacio(p);
    }

    @Override
    public void modificar(Aparcament a) throws UtilitatPersistenciaException {
        gestionaModificacio(a);
    }

    @Override
    public void modificar(Placa p) throws UtilitatPersistenciaException {
        gestionaModificacio(p);
    }

    @Override
    public void modificar(Reserva r) throws UtilitatPersistenciaException {
        gestionaModificacio(r);
    }
    
    @Override
    public void eliminar(Persona p) throws UtilitatPersistenciaException {
        gestionaEliminacio(p);
    }

    @Override
    public void eliminar(Aparcament a) throws UtilitatPersistenciaException {
        gestionaEliminacio(a);
    }

    @Override
    public void eliminar(Placa p) throws UtilitatPersistenciaException {
        gestionaEliminacio(p);
    }
    
    @Override
    public Persona obtenirPersona(String dni) throws UtilitatPersistenciaException {
        return gestionaConsulta(Persona.class,dni);
    }
    
    
    @Override
    public Persona obtenirPersonaPerNomUsuari(String nomUsuari){
        Persona user=null;
        Query qry;

        qry = em.createQuery("Select u from Persona u where u.nomusuari = :nomUsuari");
        qry.setParameter("nomUsuari", nomUsuari);
        
        try {
            user=(Persona) qry.getSingleResult();
        } catch (javax.persistence.NoResultException ex) {
            
        }
        return user;
    }
    
    @Override
    public Usuari obtenirUsuariPerNomUsuari(String nomUsuari){
        Usuari user=null;
        Query qry;

        qry = em.createQuery("Select u from Usuari u where u.nomusuari = :nomUsuari");
        qry.setParameter("nomUsuari", nomUsuari);
        
        try {
            user=(Usuari) qry.getSingleResult();
        } catch (javax.persistence.NoResultException ex) {
            
        }
        return user;
    }
    
    @Override
    public List<Persona> obtenirTotesLesPersones() throws UtilitatPersistenciaException {
        Query qry;

        qry = em.createQuery("Select p from Persona p");

        return (List<Persona>) qry.getResultList();
    }

    @Override
    public Aparcament obtenirAparcament(int idAparcament) throws UtilitatPersistenciaException {
        return gestionaConsulta(Aparcament.class,idAparcament);
    }
    
    @Override
    public List<Aparcament> obtenirTotsElsAparcaments() throws UtilitatPersistenciaException {
        Query qry;

        qry = em.createQuery("Select a from Aparcament a");

        return (List<Aparcament>) qry.getResultList();
    }
    
    @Override
    public List<Placa> obtenirTotesLesPlaces() throws UtilitatPersistenciaException {
        Query qry;

        qry = em.createQuery("Select p from Placa p");

        return (List<Placa>) qry.getResultList();
    }
    
    @Override
    public Reserva obtenirReserva(int idReserva) throws UtilitatPersistenciaException {
        return gestionaConsulta(Reserva.class,idReserva);
    }
    
    @Override
    public List<Reserva> obtenirTotesLesReserves() throws UtilitatPersistenciaException {
        Query qry;

        qry = em.createQuery("Select r from Reserva r");

        return (List<Reserva>) qry.getResultList();
    }
    
    @Override
    public Placa obtenirPlaca(int idPlaca) throws UtilitatPersistenciaException {
        return gestionaConsulta(Placa.class,idPlaca);
    }
    
    @Override
    public List<Placa> obtenirPlacesDunAparcament(int idAparcament) throws UtilitatPersistenciaException {
        Query qry;

        qry = em.createQuery("Select p from Placa p where p.aparcament.idAparcament = :idAparcament");
        qry.setParameter("idAparcament", idAparcament);

        return (List<Placa>) qry.getResultList();
    }

    @Override
    public List<Reserva> obtenirReservesDunUsuari(String dni) throws UtilitatPersistenciaException {
        Query qry;

        qry = em.createQuery("Select r from Reserva r where r.usuari.dni = :dni");
        qry.setParameter("dni", dni);

        return (List<Reserva>) qry.getResultList();
    }

    @Override
    public List<Reserva> obtenirReservesDunAparcament(int idAparcament) throws UtilitatPersistenciaException {
        Query qry;
        
        //qry = em.createQuery("Select r from Reserva r where r.aparcament.idAparcament = :idAparcament");
        qry = em.createQuery("Select r from Reserva r where r.placa.aparcament.idAparcament = :idAparcament");
        qry.setParameter("idAparcament", idAparcament);

        return (List<Reserva>) qry.getResultList();
    }
    
    private void iniciTransaccio() {
         em.getTransaction().begin();
    }

    private void fiTransaccio() {
       em.getTransaction().commit();
    }

    private void gestionaAlta(Object nou) throws UtilitatPersistenciaException {
        try{
            iniciTransaccio();
            em.persist(nou);
            fiTransaccio();
       }catch(EntityExistsException e){
           throw new UtilitatPersistenciaException("Hi ha un objecte amb la mateixa clau a la base de dades");
       }catch(Exception e){
           LogSupport.grava(e);
           throw new UtilitatPersistenciaException(e.getMessage());
       }
    
    }
    private void gestionaEliminacio(Object vell) throws UtilitatPersistenciaException {
        try{
            iniciTransaccio();
            em.remove(vell);
            fiTransaccio();
        }catch(IllegalArgumentException e){
            throw new UtilitatPersistenciaException("L'objecte a esborrar no existeix");
        }
    }
    
    private void gestionaModificacio(Object nou) throws UtilitatPersistenciaException {
        try{
            iniciTransaccio();
            if(!em.contains(nou)){
                throw new UtilitatPersistenciaException("L'objecte no existeix a la base de dades");
            }
            else em.persist(nou);
            fiTransaccio();
        }catch(UtilitatPersistenciaException e){
            throw e;
        }catch(Exception e){
           LogSupport.grava(e);
           throw new UtilitatPersistenciaException(e.getMessage());
        }
    }
        
    private <T> T gestionaConsulta(Class <T> classe, Object clau)throws UtilitatPersistenciaException {
        T resultat;
        
        try{
            resultat=em.find(classe, clau);
            
        }catch(Exception e){
            LogSupport.grava(e);
            throw new UtilitatPersistenciaException(e.getMessage());
        }
        if(resultat==null){
            throw new UtilitatPersistenciaException("L'objecte no existeix a la base de dades");
        }else{
            return resultat;            
        }
    }    

    @Override
    public Reserva obtenirReservaPerMatricula (String matricula, int idAparcament, Timestamp data) throws UtilitatPersistenciaException {
        Reserva res = null;
        Query qry;

        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(data.getTime());
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Timestamp inici = new Timestamp(cal.getTime().getTime());
        cal.add(Calendar.HOUR, 23);
        cal.add(Calendar.MINUTE, 59);
        cal.add(Calendar.SECOND, 59);
        cal.add(Calendar.MILLISECOND, 0);
        Timestamp fi = new Timestamp (cal.getTime().getTime());

        qry = em.createQuery("Select r from Reserva r where r.usuari.matricula = :matricula "
                + "and r.placa.aparcament.idAparcament = :idAparcament and r.anulada = false "
                + "and r.hora_inici between :inici and :fi");
        qry.setParameter("matricula", matricula);
        qry.setParameter("idAparcament", idAparcament);
        qry.setParameter("inici", inici);
        qry.setParameter("fi", fi);

        try {
            res = (Reserva) qry.getSingleResult();
        } catch (javax.persistence.NoResultException ex) {

        }
        return res;
    }
    
    @Override
    public void enregistraEntrada(String matricula, int idAparcament, Timestamp hora_inici_real) throws UtilitatPersistenciaException {
        Reserva res = obtenirReservaPerMatricula(matricula, idAparcament, hora_inici_real);
        res.setHora_inici_real(hora_inici_real);
        res.setUtilitzada(Boolean.TRUE);
        gestionaModificacio(res);
    }

    @Override
    public void enregistraSortida(String matricula, int idAparcament, Timestamp hora_fi_real) throws UtilitatPersistenciaException {
        Reserva res = obtenirReservaPerMatricula(matricula, idAparcament, hora_fi_real);
        res.setHora_fi_real(hora_fi_real);
        res.setPassada(Boolean.TRUE);
        gestionaModificacio(res);
    }
}
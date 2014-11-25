package Persistencia;

import utilitatsBD.UtilitatPersistenciaException;
import apparkt.*;
import java.util.List;

/**
 * Interface que permet la persistencia dels objectes de manera independent de la resta de l'aplicacio
 * 
 * @author Miquel Àngel Vélez Serrano
 */

public interface GestorPersistencia {
    /**
    * Assigna els valors de configuracio de la connexio a partir
    * d'un sistema d'inicialitzacio concretat a cada instancia
    * d'aquesta interficie.
     * @throws utilitatsBD.UtilitatPersistenciaException
    */
    void iniciar () throws UtilitatPersistenciaException;

    /**
     * Estableix la connexio amb l'SGBD
     * @throws UtilitatPersistenciaException si es produexi ha algun error en establir la connexio
     */
    
    void obrir() throws UtilitatPersistenciaException;
    
    /**
     * Tanca la connexio amb l'SGBD
     */    
    
    void tancar();   

   /**
     * Insereix una persona a la base de dades amb un nif que no te cap altre persona a la base de dades
     * @param p Persona que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha una altre persona a la base de dades amb el mateix
     * dni o si es produeix un error a la base de dades
     */
    void inserir(Persona p) throws UtilitatPersistenciaException;

    /**
     * Insereix un aparcament a la base de dades amb un idaparcament que no te cap altre client a la base de dades
     * @param a aparcament que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha un altre aparcament a la base de dades amb el mateix
     * idaparcament o si es produeix un error a la base de dades
     */
    void inserir(Aparcament a) throws UtilitatPersistenciaException;
    
    /**
     * Insereix una plaça a la base de dades amb un idplaca que no te cap altre plaça a la base de dades
     * @param p plaça que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha una altre plaça a la base de dades amb el mateix
     * idplaca o si es produeix un error a la base de dades
     */
    void inserir(Placa p) throws UtilitatPersistenciaException;
    
    /**
     * Insereix una reserva a la base de dades amb un idreserva que no te cap altre reserva a la base de dades
     * @param r reserva que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha una altre reserva a la base de dades amb el mateix
     * idreserva o si es produeix un error a la base de dades
     */
    void inserir(Reserva r) throws UtilitatPersistenciaException;
    
    /**
     * Crea un objecte de tipus Admin amb un dni determinat, pero no l'insereix a la base
     * de dades.  La resta de dades prenen la seva inicialitzacio per defecte.
     * @param dni dni que s'assigna al Admin creat
     * @return referencia al admin creat
     */    
    Admin nouAdminTemporal(String dni) throws UtilitatPersistenciaException;

    /**
     * Crea un objecte de tipus Usuari amb un dni determinat, pero no l'insereix a la base
     * de dades.  La resta de dades prenen la seva inicialitzacio per defecte.
     * @param dni dni que s'assigna al usuari creat
     * @return referencia al usuari creat
     */        
    Usuari nouUsuariTemporal(String dni) throws UtilitatPersistenciaException;


    /**
     * Assigna les dades del parametre a una persona existent a l'SGBD amb el mateix dni
     * @param p persaona que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap persona amb el mateix dni que el parametre
     * o si es produeix un error a l'SGBD
     */            
    void modificar(Persona p) throws UtilitatPersistenciaException;

    /**
     * Assigna les dades del parametre a un aparcament existent a l'SGBD amb el mateix idaparcament
     * @param a aparcament que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap aparcament amb el mateix idaparcament que el parametre
     * o si es produeix un error a l'SGBD
     */  
    void modificar(Aparcament a) throws UtilitatPersistenciaException;
    
    /**
     * Assigna les dades del parametre a una plaça existent a l'SGBD amb el mateix idplaca
     * @param p plaça que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap plaça amb el mateix idplaca que el parametre
     * o si es produeix un error a l'SGBD
     */
    void modificar(Placa p) throws UtilitatPersistenciaException;
    
    /**
     * Assigna les dades del parametre a una reserva existent a l'SGBD amb el mateix idreserva
     * @param r reserva que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap reserva amb el mateix idreserva que el parametre
     * o si es produeix un error a l'SGBD
     */
    void modificar(Reserva r) throws UtilitatPersistenciaException;
    
    /**
     * Elimina de la base de dades la persona amb el mateix dni que el de la persona que es passa com a parametre
     * @param p persona a eliminar de la base de dades
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap persona amb el mateix dni que el del parametre o 
     * si es produeix un error a l'SGBD
     */
    void eliminar(Persona p) throws UtilitatPersistenciaException;

    /**
     * Elimina de la base de dades l'aparcament amb el mateix idaparcament que el del aparcament que es passa com a parametre
     * @param a aparcament a eliminar de la base de dades
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap aparcament amb el mateix idaparcament que el del parametre o 
     * si es produeix un error a l'SGBD
     */
    void eliminar(Aparcament a) throws UtilitatPersistenciaException;
    
    /**
     * Elimina de la base de dades la plaça amb el mateix idplaca que el de la plaça que es passa com a parametre
     * @param p plaça a eliminar de la base de dades
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap plaça amb el mateix idplaca que el del parametre o 
     * si es produeix un error a l'SGBD
     */
    void eliminar(Placa p) throws UtilitatPersistenciaException;
    

   /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de persona, 
     * identificada amb el dni que es passa per parametre. 
     * @param dni dni que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el dni assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    Persona obtenirPersona (String dni) throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de Usuari, 
     * identificada amb el nom d'usuari que es passa per parametre. 
     * @param nomUsuari nom d'usuari que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nom d'usuari assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    Usuari obtenirUsuariPerNomUsuari(String nomUsuari) throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de Persona, 
     * identificada amb el nom d'usuari que es passa per parametre. 
     * @param nomUsuari nom d'usuari que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nom d'usuari assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Persona obtenirPersonaPerNomUsuari(String nomUsuari) throws UtilitatPersistenciaException;
    
    
    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Persona, 
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Persona
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */ 
    List <Persona> obtenirTotesLesPersones () throws UtilitatPersistenciaException;

   /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de Aparcament, 
     * identificada amb el idaparcament que es passa per parametre. 
     * @param idAparcament idaparcament que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el idaparcament assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Aparcament obtenirAparcament (int idAparcament) throws UtilitatPersistenciaException;  
    
    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Aparcament, 
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Aparcament
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */ 
    List <Aparcament> obtenirTotsElsAparcaments () throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de Reserva, 
     * identificada amb el idreserva que es passa per parametre. 
     * @param idReserva idreserva que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el idreserva assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Reserva obtenirReserva (int idReserva) throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de Placa, 
     * identificada amb el idplaca que es passa per parametre. 
     * @param idPlaca idplaca que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el idplaca assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Placa obtenirPlaca (int idPlaca) throws UtilitatPersistenciaException;
    
    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Placa, 
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Placa
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */
    List <Placa> obtenirTotesLesPlaces () throws UtilitatPersistenciaException;
    
    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Reserva, 
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Reserva
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */ 
    List <Reserva> obtenirTotesLesReserves () throws UtilitatPersistenciaException;
    
    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Placa, pertanyents
     * a la instància d' Aparcament identificat amb el idaparcament que es passa per parametre.
     * @param idAparcament idaparcament que identifica l'entitat aparcament del que es desitja recuperar les places
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Placa, pertanyents
     * a la instància d' Aparcament identificat amb el idaparcament que es passa per parametre.
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */    
    List <Placa> obtenirPlacesDunAparcament(int idAparcament) throws UtilitatPersistenciaException;

    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Reserva, pertanyents
     * a la instància d' Usuari identificat amb el dni que es passa per parametre.
     * @param dni dni que identifica l'entitat Usuari del que es desitja recuperar les reserves
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Reserva, pertanyents
     * a la instància d' Usuari identificat amb el dni que es passa per parametre.
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */     
    List <Reserva> obtenirReservesDunUsuari(String dni) throws UtilitatPersistenciaException;
    
    /**
     * Obte la llista de totes les instancies persistents (emmagatzemades a la base de dades) de Reserva, pertanyents
     * a la instància d' Aparcament identificat amb el idaparcament que es passa per parametre.
     * @param idAparcament idaparcament que identifica l'entitat Aparcament del que es desitja recuperar les reserves
     * @return llista de totes les instancies persistents (emmagatzemades a la base de dades) de Reserva, pertanyents
     * a la instància d' Aparcament identificat amb el idaparcament que es passa per parametre.
     * @throws UtilitatPersistenciaException si es produeix un error al SGBD
     */    
    List <Reserva> obtenirReservesDunAparcament(int idAparcament) throws UtilitatPersistenciaException; 
}

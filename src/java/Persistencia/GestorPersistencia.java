/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia;

import utilitatsBD.UtilitatPersistenciaException;
import apparkt.*;
import java.util.List;

/**
 * Interface que permet la persistencia dels objectes de manera independent de la resta de l'aplicacio
 * 
 * @author professor
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
     * Insereix un empleat a la base de dades amb un codi que no te cap altre empleat a la base de dades
     * @param e empleat que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha un altre empleat a la base de dades amb el mateix
     * codi o si es produeix un error a la base de dades
     */
    void inserir(Persona p) throws UtilitatPersistenciaException;

    /**
     * Insereix un client a la base de dades amb un nif que no te cap altre client a la base de dades
     * @param c client que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha un altre client a la base de dades amb el mateix
     * nif o si es produeix un error a la base de dades
     */
    void inserir(Aparcament a) throws UtilitatPersistenciaException;
    
    /**
     * Insereix un client a la base de dades amb un nif que no te cap altre client a la base de dades
     * @param c client que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha un altre client a la base de dades amb el mateix
     * nif o si es produeix un error a la base de dades
     */
    void inserir(Placa p) throws UtilitatPersistenciaException;
    
    /**
     * Insereix un client a la base de dades amb un nif que no te cap altre client a la base de dades
     * @param c client que s'ha d'inserir
     * @throws UtilitatPersistenciaException si ja hi ha un altre client a la base de dades amb el mateix
     * nif o si es produeix un error a la base de dades
     */
    void inserir(Reserva r) throws UtilitatPersistenciaException;
    
    /**
     * Crea un objecte de tipus Comercial amb un codi d'empleat determinat, pero no l'insereix a la base
     * de dades.  La resta de dades prenen la seva inicialitzacio per defecte.
     * @param codi codi que s'assigna al comercial creat
     * @return referencia al comercial creat
     */    
    Admin nouAdminTemporal(String dni) throws UtilitatPersistenciaException;

    /**
     * Crea un objecte de tipus client amb un nif determinat, pero no l'insereix a la base
     * de dades.  La resta de dades prenen la seva inicialitzacio per defecte.
     * @param nif nif que s'assigna al client creat
     * @return referencia al client creat
     */        
    Usuari nouUsuariTemporal(String dni) throws UtilitatPersistenciaException;


    /**
     * Assigna les dades del parametre a un empleat existent a l'SGBD amb el mateix codi d'empleat
     * @param e empleat que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap empleat amb el mateix codi que el parametre
     * o si es produeix un error a l'SGBD
     */            
    void modificar(Persona p) throws UtilitatPersistenciaException;

    /**
     * Assigna les dades del parametre a un client existent a l'SGBD amb el mateix nif
     * @param c client que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap client amb el mateix nif que el parametre
     * o si es produeix un error a l'SGBD
     */
    void modificar(Aparcament a) throws UtilitatPersistenciaException;
    
    /**
     * Assigna les dades del parametre a un client existent a l'SGBD amb el mateix nif
     * @param c client que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap client amb el mateix nif que el parametre
     * o si es produeix un error a l'SGBD
     */
    void modificar(Placa p) throws UtilitatPersistenciaException;
    
    /**
     * Assigna les dades del parametre a un client existent a l'SGBD amb el mateix nif
     * @param c client que conte les dades a assignar
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap client amb el mateix nif que el parametre
     * o si es produeix un error a l'SGBD
     */
    void modificar(Reserva r) throws UtilitatPersistenciaException;
    
    /**
     * Elimina de la base de dades l'empleat amb el mateix codi que el de l'empleat que es passa com a parametre
     * @param e empleat a eliminar de la base de dades
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap empleat amb el mateix codi que el del parametre o 
     * si es produeix un error a l'SGBD
     */
    void eliminar(Persona p) throws UtilitatPersistenciaException;

    /**
     * Elimina de la base de dades el client amb el mateix nif que el del client que es passa com a parametre
     * @param c client a eliminar de la base de dades
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap client amb el mateix nif que el del parametre o 
     * si es produeix un error a l'SGBD
     */
    void eliminar(Aparcament a) throws UtilitatPersistenciaException;
    
    /**
     * Elimina de la base de dades el client amb el mateix nif que el del client que es passa com a parametre
     * @param c client a eliminar de la base de dades
     * @throws UtilitatPersistenciaException si a la base de dades no hi ha cap client amb el mateix nif que el del parametre o 
     * si es produeix un error a l'SGBD
     */
    void eliminar(Placa p) throws UtilitatPersistenciaException;
    

   /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de client, 
     * identificada amb el nif que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nif assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    Persona obtenirPersona (String dni) throws UtilitatPersistenciaException;
    
    Usuari obtenirUsuariPerNomUsuari(String nomUsuari) throws UtilitatPersistenciaException;
    
    Persona obtenirPersonaPerNomUsuari(String nomUsuari) throws UtilitatPersistenciaException;
    
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de client, 
     * identificada amb el nif que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nif assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    List <Persona> obtenirTotesLesPersones () throws UtilitatPersistenciaException;

   /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) d'empleat, 
     * identificada amb el codi que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el codi assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Aparcament obtenirAparcament (int idAparcament) throws UtilitatPersistenciaException;  
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de client, 
     * identificada amb el nif que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nif assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    List <Aparcament> obtenirTotsElsAparcaments () throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) d'empleat, 
     * identificada amb el codi que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el codi assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Reserva obtenirReserva (int idReserva) throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) d'empleat, 
     * identificada amb el codi que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el codi assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */
    Placa obtenirPlaca (int idPlaca) throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de client, 
     * identificada amb el nif que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nif assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    List <Placa> obtenirTotesLesPlaces () throws UtilitatPersistenciaException;
    
    /**
     * Obte una instancia persistent (emmagatzemada a la base de dades) de client, 
     * identificada amb el nif que es passa per parametre. 
     * @param nif nif que identifica l'entitat que es desitja recuperar
     * @return Instancia de l'entitat recuperada amb les dades emmagatzemades.
     * @throws UtilitatPersistenciaException si no existeix cap instancia amb el nif assenyalat pel parametre o 
     * si es produeix un error al SGBD
     */ 
    List <Reserva> obtenirTotesLesReserves () throws UtilitatPersistenciaException;
    
    /**
     * Obte la llista de tots els clients de la base de dades ordenada per nom
     * @return llista de tots els clients de la base de dades ordenada per nom
     * @throws UtilitatPersistenciaException si es produeix un error a l'SGBD.
     */    
    List <Placa> obtenirPlacesDunAparcament(int idAparcament) throws UtilitatPersistenciaException;

    /**
     * Obte la llista de tots els empleats de la base de dades ordenada per nom
     * @return llista de tots els e,empleats de la base de dades ordenada per nom
     * @throws UtilitatPersistenciaException si es produeix un error a l'SGBD.
     */    
    List <Reserva> obtenirReservesDunUsuari(String dni) throws UtilitatPersistenciaException;
    
    /**
     * Obte la llista de tots els empleats de la base de dades ordenada per nom
     * @return llista de tots els e,empleats de la base de dades ordenada per nom
     * @throws UtilitatPersistenciaException si es produeix un error a l'SGBD.
     */    
    List <Reserva> obtenirReservesDunAparcament(int idAparcament) throws UtilitatPersistenciaException; 
}

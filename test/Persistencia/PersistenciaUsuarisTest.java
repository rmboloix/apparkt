/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import apparkt.Contacte;
import apparkt.Persona;
import apparkt.Poblacio;
import apparkt.Provincia;
import apparkt.Usuari;
import javax.persistence.EntityManager;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;
import utilitatsBD.UtilitatPersistenciaException;

/**
 *
 * @author Mixi
 */
public class PersistenciaUsuarisTest {
    private Usuari usuari;
    private Usuari usuari2;
    
    public PersistenciaUsuarisTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        usuari = new Usuari();
        usuari.setDni("46942299N");
        usuari.setNom("Miquel Angel");
        usuari.setCognom1("Vélez");
        usuari.setCognom2("Serrano");
        usuari.setNomUsuari("iocmvelez");
        usuari.setPassword("1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2");
        usuari.setDadesFacturacio("1111-2222-3333-4444-10/2020-333");
        usuari.setMatricula("1111AAA");

        Provincia p = new Provincia();
        p.setNom("Barcelona");
        Poblacio pobl = new Poblacio();
        pobl.setNom("Ripollet");
        pobl.setProvincia(p);

        Contacte c = new Contacte();
        c.setCodiPostal("08291");
        c.setDireccio("C/Afores, 27, 3r");
        c.setTelefon(626125872);
        c.seteMail("mvelezserrano@outlook.es");
        c.setPoblacio(pobl);

        usuari.setContacte(c);
        
        usuari2 = new Usuari();
        usuari2.setDni("00000000X");
        usuari2.setNom("0000");
        usuari2.setCognom1("0000");
        usuari2.setCognom2("0000");
        usuari2.setNomUsuari("ioc0000");
        usuari2.setPassword("1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2");
        usuari2.setDadesFacturacio("0000-0000-0000-0000-o0/0000-000");
        usuari2.setMatricula("0000AAA");

        Provincia p2 = new Provincia();
        p2.setNom("Barcelona");
        Poblacio pobl2 = new Poblacio();
        pobl2.setNom("Ripollet");
        pobl2.setProvincia(p2);

        Contacte c2 = new Contacte();
        c2.setCodiPostal("08291");
        c2.setDireccio("C/Afores, 27, 3r");
        c2.setTelefon(626125872);
        c2.seteMail("mvelezserrano@outlook.es");
        c2.setPoblacio(pobl2);

        usuari2.setContacte(c2);
    }
    
    @After
    public void tearDown() {
    }
    
    //@Ignore
    @Test
    public void testObtenirPersona() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        Persona resultat = db.obtenirPersona(usuari.getDni());
        db.tancar();
        assertEquals(resultat,usuari);
    }
    
    //@Ignore
    @Test
    public void testInserirPersona() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        db.inserir(usuari2);
        Persona pers = db.obtenirPersona(usuari2.getDni());
        db.tancar();
        assertNotNull(pers.getDni());
    }
    
    @Test
    public void testEliminarPersona() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        Persona perso = db.obtenirPersona(usuari2.getDni());
        db.eliminar(perso);
        perso = db.obtenirPersona(usuari2.getDni());
        db.tancar();
        assertNull(perso);
    }
    
    @Test
    public void testModificarPersona() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        Persona pers =  db.obtenirPersona(usuari.getDni());
        String nomOriginal = pers.getNom();
        pers.setNom("Nom modificat");
        db.modificar(pers);
        Persona pers2 =  db.obtenirPersona(usuari.getDni());
        
        assertEquals(pers.getNom(), pers2.getNom());
        
        pers.setNom(nomOriginal);
        db.modificar(pers);
        db.tancar();        
    }
}

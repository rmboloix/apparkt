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
import utilitatsBD.UtilitatPersistenciaException;

/**
 *
 * @author Mixi
 */
public class PersistenciaUsuarisTest {
    private Usuari usuari;
    
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
    }
    
    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    @Test
    public void testObtenirPersona() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        Persona resultat = db.obtenirPersona(usuari.getDni());
        db.tancar();
        assertEquals(resultat,usuari);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import apparkt.Aparcament;
import apparkt.Placa;
import apparkt.TipusPlaca;
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
public class PersistenciaPlacesTest {
    private Placa placa;
    private final int NUMPLACA=38;
    
    public PersistenciaPlacesTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() throws UtilitatPersistenciaException {
    }
    
    @After
    public void tearDown() {
    }
    
    //@Ignore
    @Test
    public void testObtenirPlaca() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        assertNotNull(db.obtenirPlaca(18));
        db.tancar();
    }
    
    //@Ignore
    @Test
    public void testInserirPlaca() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        
        Aparcament aparcament = db.obtenirAparcament(3);
        
        placa = new Placa();
        placa.setAparcament(aparcament);
        placa.setPlanta(3);
        placa.setNumero(1);
        placa.setTipusplaca(TipusPlaca.Normal);
        placa.setActiva(Boolean.TRUE);
        db.inserir(placa);
        placa = db.obtenirPlaca(NUMPLACA);
        System.out.println("id placa: "+placa.getIdplaca());
        db.tancar();
        assertNotNull(placa.getIdplaca());
    }
    
    //@Ignore
    @Test
    public void testModificarPlaca() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        placa = db.obtenirPlaca(NUMPLACA);
        placa.setActiva(Boolean.FALSE);
        db.modificar(placa);
        assertEquals(Boolean.FALSE, db.obtenirPlaca(NUMPLACA).isActiva());
        db.tancar();
    }
    
    @Ignore
    @Test
    public void testEliminarPlaca() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        placa = db.obtenirPlaca(NUMPLACA);
        db.eliminar(placa);
        assertNull(db.obtenirPlaca(NUMPLACA));
        db.tancar();
    }
}
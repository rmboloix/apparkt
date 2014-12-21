/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import apparkt.Placa;
import apparkt.Reserva;
import apparkt.Usuari;
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
public class PersistenciaReservesTest {
    private Usuari usuari;
    private Reserva reserva;
    
    public PersistenciaReservesTest() {
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
    public void testObtenirReserva() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        assertNotNull(db.obtenirReserva(13));
        db.tancar();
    }
    
    //@Ignore
    @Test
    public void testInserirReserva() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        
        usuari = (Usuari)db.obtenirPersona("46942299N");
        Placa placa = db.obtenirPlaca(1);
        
        java.sql.Timestamp tsEntrada = java.sql.Timestamp.valueOf("2014-12-25 13:00:00.0");
        java.sql.Timestamp tsSortida = java.sql.Timestamp.valueOf("2014-12-25 14:00:00.0");
        
        reserva = new Reserva();
        reserva.setPlaca(placa);
        reserva.setUsuari(usuari);
        reserva.setMatricula(usuari.getMatricula());
        reserva.setHora_inici(tsEntrada);
        reserva.setHora_fi(tsSortida);
        reserva.setUtilitzada(Boolean.FALSE);
        reserva.setAnulada(Boolean.FALSE);
        reserva.setPassada(Boolean.FALSE);

        db.inserir(reserva);
        Reserva res = db.obtenirReserva(reserva.getIdReserva());
        db.tancar();
        assertNotNull(res.getIdReserva());
    }
    
    //@Ignore
    @Test
    public void testAnularReserva() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        Reserva res = db.obtenirReserva(19);
        db.anularReserva(res.getIdReserva());
        res = db.obtenirReserva(res.getIdReserva());
        
        assertEquals(res.isAnulada(), Boolean.TRUE);
        res = db.obtenirReserva(res.getIdReserva());
        res.setAnulada(Boolean.FALSE);
        db.modificar(res);
        db.tancar();
    }
    
    //@Ignore
    @Test
    public void testEnregistraEntradaISortida() throws UtilitatPersistenciaException {
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        db.iniciar();
        db.obrir();
        Reserva res = db.obtenirReserva(19);
        db.enregistraEntrada(res.getMatricula(), res.getPlaca().getAparcament().getIdAparcament(), res.getHora_inici());
        db.enregistraSortida(res.getMatricula(), res.getPlaca().getAparcament().getIdAparcament(), res.getHora_fi());
        res = db.obtenirReserva(res.getIdReserva());
        db.tancar();
        assertNotNull(res.getPreu());
    }
}
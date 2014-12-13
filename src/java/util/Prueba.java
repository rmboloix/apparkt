/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Reserva;
import java.sql.Timestamp;
import java.util.List;
import utilitatsBD.UtilitatPersistenciaException;

/**
 *
 * @author Raf
 */
public class Prueba {
    public static void main (String[]args){
        try {
            GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
            db.iniciar();
            db.obrir();
            //System.out.println(db.obtenirPersona("46942299N"));
            
            /*TESTEJAR ENTRADA I SORTIDA DE COTXES ********************************
            Timestamp hora_entrada = new Timestamp(new java.util.Date().getTime());
            Timestamp hora_sortida = new Timestamp(new java.util.Date().getTime()+300000);
            
            System.out.println(db.obtenirReservaPerMatricula("1111AAA", 3, hora_entrada));
            db.enregistraEntrada("1111AAA", 3, hora_entrada);
            System.out.println(db.obtenirReservaPerMatricula("1111AAA", 3, hora_entrada));
            db.enregistraSortida("1111AAA", 3, hora_sortida);
            System.out.println(db.obtenirReservaPerMatricula("1111AAA", 3, hora_entrada));
            ***************************************************************************/
            
            //TESTEJAR OBTENIR PLACES LLIURES ********************************
            Timestamp hora_entrada = new Timestamp(new java.util.Date().getTime());
            Timestamp hora_sortida = new Timestamp(new java.util.Date().getTime()+300000);
            List<Object[]> disponibles = db.obtenirPlacesDisponibles(hora_entrada, hora_sortida);
            for (Object[] o : disponibles) {
                System.out.println("idAparcament= " + o[0] + " numero de places lliures= " + o[1]);
            }
            //***************************************************************************/
            
            /*TESTEJAR OBTENIR RESERVES VIGENTS O NO D'UN USUARI*************************
            List<Reserva> llista = db.obtenirReservesDunUsuari("46942299N", true);
            for (Reserva r: llista) {
                System.out.println(r.toString());
            }
            ***************************************************************************/
            
            db.tancar();
        } catch (UtilitatPersistenciaException ex) {
            System.out.println("Error :"+ex);
        }
    }
}

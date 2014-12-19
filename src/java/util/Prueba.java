/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Placa;
import apparkt.Reserva;
import apparkt.Usuari;
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
            //***************************************************************************/
            
            //TESTEJAR OBTENIR PLACES LLIURES ********************************
            /*Timestamp hora_entrada = new Timestamp(new java.util.Date().getTime());
            Timestamp hora_sortida = new Timestamp(new java.util.Date().getTime()+300000);
            
            List<Object[]> disponibles = db.obtenirPlacesDisponibles(hora_entrada, hora_sortida);
            
            for (Object[] o : disponibles) {
                System.out.println("idAparcament= " + o[0] + " numero de places lliures= " + o[1]);
            }
            //***************************************************************************/
            
            
            //TESTEJAR FORMALITZAR RESERVA AMB LA PRIMERA PLAÇA LLIURE AL APARCAMENT SELECCIONAT *
           /* Object[] o = disponibles.get(2);
            int idAparcament = (Integer) o[0];

            Placa placaLliure = db.obtenirPlacaPerReserva(hora_entrada, hora_sortida, idAparcament);
            
            Usuari usuari = (Usuari)db.obtenirPersona("46942299N");
            
            Reserva reserva = new Reserva();
            reserva.setPlaca(placaLliure);
            reserva.setUsuari(usuari);
            reserva.setMatricula(usuari.getMatricula());
            reserva.setHora_inici(hora_entrada);
            reserva.setHora_fi(hora_sortida);
            reserva.setUtilitzada(Boolean.FALSE);
            reserva.setAnulada(Boolean.FALSE);
            reserva.setPassada(Boolean.FALSE);
            
            db.inserir(reserva);
            
            System.out.println(reserva.toString());
            //***************************************************************************/
            
            /*TESTEJAR OBTENIR RESERVES VIGENTS O NO D'UN USUARI*************************
            List<Reserva> llista = db.obtenirReservesDunUsuari("46942299N", true);
            for (Reserva r: llista) {
                System.out.println(r.toString());
            }
            //***************************************************************************/
            
            //TESTEJAR ANULAR RESERVA***************************************************
            //db.anularReserva(4);
            //***************************************************************************/
            
            //TESTEJAR ACTIVA PLAÇA***************************************************
            //db.activaPlaca(1);
            //***************************************************************************/
            
            //TESTEJAR PLACES LLIURES D'UN APARCAMENT ARA MATEIX**************************
            //System.out.println("Places lliures: "+db.obtenirPlacesDisponiblesAparcament(3));
            //***************************************************************************/
            
            /*TESTEJAR OBTENIR RESERVES VIGENTS O NO D'UN APARCAMENT*************************
            List<Reserva> llista = db.obtenirReservesDunAparcament(3, true);
            for (Reserva r: llista) {
                System.out.println(r.toString());
            }
            //***************************************************************************/
            
            //TESTEJAR ACTUALITZA RESERVES **************************************************
            db.actualitzaReserves();
            //***************************************************************************/
            
            db.tancar();
        } catch (UtilitatPersistenciaException ex) {
            System.out.println("Error :"+ex);
        }
    }
}

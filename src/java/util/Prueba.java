/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import java.sql.Timestamp;
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
            Timestamp hora_entrada = new Timestamp(new java.util.Date().getTime());
            Timestamp hora_sortida = new Timestamp(new java.util.Date().getTime()+300000);
            
            System.out.println(db.obtenirReservaPerMatricula("1111AAA", 3, hora_entrada));
            db.enregistraEntrada("1111AAA", 3, hora_entrada);
            System.out.println(db.obtenirReservaPerMatricula("1111AAA", 3, hora_entrada));
            db.enregistraSortida("1111AAA", 3, hora_sortida);
            System.out.println(db.obtenirReservaPerMatricula("1111AAA", 3, hora_entrada));
            db.tancar();
        } catch (UtilitatPersistenciaException ex) {
            System.out.println("Error :"+ex);
        }
    }
}

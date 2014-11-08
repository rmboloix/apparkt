/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
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
            System.out.println(db.obtenirPersona("46942299N"));
            db.tancar();
        } catch (UtilitatPersistenciaException ex) {
            System.out.println("Error :"+ex);
        }
    }
}

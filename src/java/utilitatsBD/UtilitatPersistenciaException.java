/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utilitatsBD;

/**
 * Exceptcio produida al gestor de persistencia
 *@author professor
 */
public class UtilitatPersistenciaException extends Exception {
    public UtilitatPersistenciaException (String missatge){
        super(missatge);
    }
}

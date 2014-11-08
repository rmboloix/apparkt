/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitatsBD;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/**
 * utilitats per gravar les excepcions en un fitxer de log crea el fitxer de log
 * a la carpeta de l'aplicacio es diu personesyyyymmddhhmmss (on yyyymmddhhmmss
 * representen la data i l'hora de creacio del fitxer)
 *
 * @author professor
 */
public class LogSupport {

    private static final Logger log = Logger.getLogger("Empresa");
    private static FileHandler fileTxt = null;
    private static SimpleFormatter formatterTxt;

    public static void grava(Exception e) {
        if (fileTxt == null) {  //el primer cop que cridem a l'eina cal inicialitzar el log

            try {

                fileTxt = new FileHandler("./LogEmpresa" + (new SimpleDateFormat("yyyymmddHHmmss")).format(new Date()) + ".txt", true);
            } catch (Exception ex) {
                throw new RuntimeException("Error a l'inicialitzar el logger. " + ex.getMessage());
            }


            // Crear txt Formatter  
            formatterTxt = new SimpleFormatter();
            fileTxt.setFormatter(formatterTxt);
            log.addHandler(fileTxt);

        }
        // gravem la informacio sobre l'excepcio produida
        log.log(Level.SEVERE, e.getMessage(), e);
    }
}

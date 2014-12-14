package servlets;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Contacte;
import apparkt.Poblacio;
import apparkt.Provincia;
import apparkt.Usuari;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rafael Mateo Boloix
 */
public class RegistreServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
            db.iniciar();
            db.obrir();
            
            Usuari user = db.obtenirUsuariPerNomUsuari(request.getParameter("usuari"));
            if (user==null) {
                Usuari u = new Usuari();
                u.setDni(request.getParameter("dni"));
                u.setNom(request.getParameter("nom"));
                u.setCognom1(request.getParameter("cognom1"));
                u.setCognom2(request.getParameter("cognom2"));
                u.setNomUsuari(request.getParameter("usuari"));
                u.setPassword(util.Util.generateSHA256SecurePassword(request.getParameter("contrasenya")));
                u.setDadesFacturacio(request.getParameter("compte"));
                u.setMatricula(request.getParameter("matricula"));


                Provincia p = new Provincia();
                p.setNom("Barcelona");
                Poblacio pobl = new Poblacio();
                //pobl.setNom("Barcelona");
                pobl.setNom(request.getParameter("poblacio"));
                pobl.setProvincia(p);

                Contacte c = new Contacte();
                c.setCodiPostal(request.getParameter("codi-postal"));
                c.setDireccio(request.getParameter("domicili"));
                c.setTelefon(Integer.parseInt(request.getParameter("telefon")));
                c.seteMail(request.getParameter("email"));
                c.setPoblacio(pobl);
                //c.setProvincia(p.getNom());

                u.setContacte(c);

                db.inserir(u);
                response.sendRedirect(request.getContextPath()+"/login.jsp?code=ok"); //Registre realitzat correctament
            } else {
                response.sendRedirect(request.getContextPath()+"/registre-client.jsp?code=1"); //Nom usuari ja existent
            }
            
            db.tancar();
        }catch(Exception ex){
            System.out.println("Error: "+ex);
            response.sendRedirect(request.getContextPath()+"/registre-client.jsp?code=2");  //Usuari amb dni ja existent
        }
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

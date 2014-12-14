/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class ModificarDadesServlet extends HttpServlet {

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
            //System.out.println("NOM USUARI->"+request.getParameter("usuari"));
            //System.out.println("DNI->"+request.getParameter("dni"));
            System.out.println("USUARI->"+user.toString());
            if (user != null) {
                user.setDni(request.getParameter("dni"));
                user.setNomUsuari(request.getParameter("usuari"));
                user.setNom(request.getParameter("nom"));
                user.setCognom1(request.getParameter("cognom1"));
                user.setCognom2(request.getParameter("cognom2"));
                if(request.getParameter("contrasenya") != null){
                    user.setPassword(util.Util.generateSHA256SecurePassword(request.getParameter("contrasenya")));
                }
                user.setDadesFacturacio(request.getParameter("compte"));
                user.setMatricula(request.getParameter("matricula"));

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
                c.setProvincia(p.getNom());
                user.setContacte(c);
                db.modificar(user);
                request.getSession().setAttribute("usuari", user);
                response.sendRedirect(request.getContextPath()+"/client/dades-client.jsp?code=ok"); //Modificació realitzada correctament
            } else {
                response.sendRedirect(request.getContextPath()+"/client/dades-client.jsp?code=1"); //Nom usuari no existent
            }
            
            db.tancar();
        }catch(Exception ex){
            System.out.println("Error: "+ex);
            ex.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/client/dades-client.jsp?code=2");  //Usuari amb dni ja existent
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

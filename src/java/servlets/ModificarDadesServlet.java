/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Admin;
import apparkt.Contacte;
import apparkt.Persona;
import apparkt.Poblacio;
import apparkt.Provincia;
import apparkt.Usuari;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        request.setCharacterEncoding("UTF-8");
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        if(request.getParameter("type") != null){
            if(request.getParameter("type").equals("client")){
                //Modificació de les dades del client
                try{
                    db.iniciar();
                    db.obrir();

                    Usuari user = db.obtenirUsuariPerNomUsuari(request.getParameter("usuari"));
                    //System.out.println("NOM USUARI->"+request.getParameter("usuari"));
                    //System.out.println("DNI->"+request.getParameter("dni"));
                    System.out.println("USUARI->"+user.toString());
                    if (user != null) {
                        //user.setDni(request.getParameter("dni"));
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
                        //c.setProvincia(p.getNom());

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
            }else if(request.getParameter("type").equals("admin")){
                //Modificació de les dades del ADMIN.
                try{
                    db.iniciar();
                    db.obrir();
                    Admin user = (Admin)db.obtenirPersonaPerNomUsuari(comprovaParametre(("nom-usuari"),request,response));
                    if(user != null) {
                        //user.setDni(request.getParameter("dni"));
                        user.setNomUsuari(comprovaParametre(("nom-usuari"),request,response));
                        if(request.getParameter("contrasenya") != null){
                            user.setPassword(util.Util.generateSHA256SecurePassword(request.getParameter("contrasenya")));
                        }
                        user.setNom(comprovaParametre(("nom"),request,response));
                        user.setCognom1(comprovaParametre(("cognom1"),request,response));
                        user.setCognom2(comprovaParametre(("cognom2"),request,response));
                        
                        Provincia p = new Provincia();
                        p.setNom("Barcelona");
                        Poblacio pobl = new Poblacio();
                        //pobl.setNom("Barcelona");
                        pobl.setNom(comprovaParametre(("poblacio"),request,response));
                        pobl.setProvincia(p);

                        Contacte c = new Contacte();
                        c.setCodiPostal(comprovaParametre(("codi-postal"),request,response));
                        c.setDireccio(comprovaParametre(("domicili"),request,response));
                        c.setTelefon(Integer.parseInt(comprovaParametre(("telefon"),request,response)));
                        c.seteMail(comprovaParametre(("email"),request,response));
                        c.setPoblacio(pobl);
                        //c.setProvincia(p.getNom());

                        user.setContacte(c);
                        db.modificar(user);
                        request.getSession().setAttribute("usuari", user);
                        response.sendRedirect(request.getContextPath()+"/admin/dades-admin.jsp?code=ok"); //Modificació realitzada correctament
                    } else {
                        response.sendRedirect(request.getContextPath()+"/admin/dades-admin.jsp?code=1"); //Nom usuari no existent
                    }

                    db.tancar();
                }catch(Exception ex){
                    System.out.println("Error: "+ex);
                    ex.printStackTrace();
                    response.sendRedirect(request.getContextPath()+"/admin/dades-admin.jsp?code=2");  //Usuari amb dni ja existent
                }
            }
        }
        
    }
    
    private String comprovaParametre(String parametre, HttpServletRequest request, HttpServletResponse response){
        String reqParam = request.getParameter(parametre);
        if(reqParam == null){
            try {
                response.sendRedirect(request.getContextPath()+"/admin/dades-admin.jsp?code=3");
            } catch (IOException ex) {
                Logger.getLogger(ModificarDadesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return reqParam;
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

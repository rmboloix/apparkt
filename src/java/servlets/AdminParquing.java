/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Placa;
import apparkt.TipusPlaca;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilitatsBD.UtilitatPersistenciaException;

/**
 *
 * @author Raf
 */
public class AdminParquing extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AdminParquing</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AdminParquing at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            if(request.getParameter("acc")!= null){
                GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
                db.iniciar();
                db.obrir();
                if(request.getParameter("acc").equals("activar") || request.getParameter("acc").equals("desactivar")){
                    int idPlaca = Integer.parseInt(request.getParameter("idPlaca"));
                    db.activaPlaca(idPlaca);
                    response.sendRedirect(request.getContextPath()+"/admin/parquings.jsp?app="+request.getParameter("app")+"&code=activa");
                }else if(request.getParameter("acc").equals("crear")){
                    String planta = request.getParameter("planta");
                    String numero = request.getParameter("numero");
                    String tipus = request.getParameter("tipus");
                    System.out.println(planta+" "+numero+" "+tipus);
                    Placa p = new Placa();
                    p.setActiva(true);
                    p.setAparcament(db.obtenirAparcament(Integer.parseInt(request.getParameter("app"))));
                    p.setNumero(Integer.parseInt(numero));
                    p.setPlanta(Integer.parseInt(planta));
                    if(tipus.equals("minusvalid")){
                        p.setTipusplaca(TipusPlaca.Minusvalids);
                    }else if(tipus.equals("petita")){
                        p.setTipusplaca(TipusPlaca.Petita);
                    }else if(tipus.equals("normal")){
                        p.setTipusplaca(TipusPlaca.Normal);
                    }
                    db.inserir(p);
                    response.sendRedirect(request.getContextPath()+"/admin/parquings.jsp?app="+request.getParameter("app")+"&code=nova");
                }else if(request.getParameter("acc").equals("eliminar")){
                    String sIdPlaca = request.getParameter("idPlaca");
                    int idPlaca = Integer.parseInt(sIdPlaca);
                    Placa p = db.obtenirPlaca(idPlaca);
                    db.eliminar(p);
                    response.sendRedirect(request.getContextPath()+"/admin/parquings.jsp?app="+request.getParameter("app")+"&code=eliminada");
                }
                db.tancar();
            }
        } catch (UtilitatPersistenciaException ex) {
            Logger.getLogger(AdminParquing.class.getName()).log(Level.SEVERE, null, ex);
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

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
        
        String usuari = request.getParameter("usuari");
        String contrasenya = request.getParameter("contrasenya");
        String nom = request.getParameter("nom");
        String cognom1 = request.getParameter("cognom1");
        String cognom2 = request.getParameter("cognom2"); //Opcional
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String dni = request.getParameter("dni");
        String domicili = request.getParameter("domicili");
        String codiPostal = request.getParameter("codi-postal");
        String poblacio = request.getParameter("poblacio");
        String matricula = request.getParameter("matricula");
        String tipusCompte = request.getParameter("tipus-compte");
        String compte = request.getParameter("compte");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("<ul>");
            out.println("<li>"+usuari+"</li>");
            out.println("<li>"+contrasenya+"</li>");
            out.println("<li>"+nom+"</li>");
            out.println("<li>"+cognom1+"</li>");
            out.println("<li>"+cognom2+"</li>");
            out.println("<li>"+email+"</li>");
            out.println("<li>"+telefon+"</li>");
            out.println("<li>"+dni+"</li>");
            out.println("<li>"+domicili+"</li>");
            out.println("<li>"+codiPostal+"</li>");
            out.println("<li>"+poblacio+"</li>");
            out.println("<li>"+matricula+"</li>");
            out.println("<li>"+tipusCompte+"</li>");
            out.println("<li>"+compte+"</li>");
            out.println("</ul>");
            out.println("</body>");
            out.println("</html>");
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

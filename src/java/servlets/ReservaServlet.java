/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Aparcament;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raf
 */
public class ReservaServlet extends HttpServlet {

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
        GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
        PrintWriter out = null;    
        try{
            db.iniciar();
            db.obrir();
            out = response.getWriter();
            
            Calendar cal = Calendar.getInstance();
            cal.set(2014, 12, 18, 12, 30);
            java.sql.Timestamp time = new java.sql.Timestamp(cal.getTime().getTime());
            
//            String data = request.getParameter("data");
//            String horaInici = request.getParameter("horaInici");
//            String horaFi = request.getParameter("horaFi");

            List<Aparcament> aparcaments = new ArrayList<>();
            
            Aparcament AparcamentA = db.obtenirAparcament(1);
            Aparcament AparcamentB = db.obtenirAparcament(2);
            Aparcament AparcamentC = db.obtenirAparcament(3);
            
            aparcaments.add(AparcamentA);
            aparcaments.add(AparcamentB);
            aparcaments.add(AparcamentC);
            
            StringBuilder json = new StringBuilder();
            json.append("[");
            int index = 0; 
            for(Aparcament ap : aparcaments){
                json.append("{");
                json.append("\"id\":");
                json.append(ap.getIdAparcament());
                json.append(",");
                json.append("\"nombre\":\"");
                json.append(ap.getNom());
                json.append("\",");
                json.append("\"lat\":");
                json.append(ap.getLatitud());
                json.append(",");
                json.append("\"lng\":");
                json.append(ap.getLongitud());
                json.append(",");
                json.append("\"places\":");
                json.append(ap.getLlistaPlacas().size());
                json.append("}");
                if(index < aparcaments.size() -1){json.append(",");}
                index++;
            }
            json.append("]");
            out.println(json.toString());
//            System.out.println(AparcamentA+" "+AparcamentB+" "+AparcamentC);
//            out.println("[\n" +
//"            {\"id\":1,\n" +
//"             \"nombre\":\"ParkingA\",\n" +
//"             \"lat\":41.45125089473105,\n" +
//"             \"lng\": 2.2157567739486694,\n" +
//"             \"places\":2\n" +
//"            },\n" +
//"            {\"id\":2,\n" +
//"             \"nombre\":\"ParkingB\",\n" +
//"             \"lat\":41.45026656994247,\n" +
//"             \"lng\": 2.212838160821531,\n" +
//"             \"places\":21\n" +
//"            },\n" +
//"            {\"id\":3,\n" +
//"             \"nombre\":\"ParkingC\",\n" +
//"             \"lat\":41.44957824763211,\n" +
//"             \"lng\": 2.214941382408142,\n" +
//"             \"places\":41},\n" +
//"            { \n" +
//"             \"id\":4,\n" +
//"             \"nombre\":\"ParkingD\",\n" +
//"             \"lat\":41.448259399320726,\n" +
//"             \"lng\": 2.213396430015564,\n" +
//"             \"places\":7\n" +
//"            }\n" +
//"        ]");
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ReservaServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ReservaServlet at " + request.getContextPath() + "</h1>");
//            out.println(request.getParameter("hora-inici"));
//            out.println(request.getParameter("hora-fi"));
//            out.println(request.getParameter("data"));
//            out.println("</body>");
//            out.println("</html>");
        }catch(Exception ex){
            System.err.println("Error Reserva: "+ex);
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

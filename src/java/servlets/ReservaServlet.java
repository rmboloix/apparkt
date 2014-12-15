/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Persistencia.GestorPersistencia;
import Persistencia.GestorPersistenciaJPA;
import apparkt.Aparcament;
import apparkt.Placa;
import apparkt.Reserva;
import apparkt.Usuari;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
        String fData = request.getParameter("data");
        String fHoraEntrada = request.getParameter("horaInici");
        String fHoraSortida = request.getParameter("horaFi");
        //Data
        String[] sData = fData.split("-");
        int any = Integer.parseInt(sData[0]);
        int mes = Integer.parseInt(sData[1]) - 1;
        int dia = Integer.parseInt(sData[2]);
        //Hora entrada
        String[] sHoraEntrada = fHoraEntrada.split(":");
        int horaEntrada = Integer.parseInt(sHoraEntrada[0]);
        int minutoEntrada = Integer.parseInt(sHoraEntrada[1]);
        //Hora sortida
        String[] sHoraSortida = fHoraSortida.split(":");
        int horaSortida = Integer.parseInt(sHoraSortida[0]);
        int minutoSortida = Integer.parseInt(sHoraSortida[1]);
        //Timestamp Entrada
        Calendar cal = new GregorianCalendar(any, mes, dia, horaEntrada, minutoEntrada);
        java.sql.Timestamp tsEntrada = new java.sql.Timestamp(cal.getTime().getTime());
        //Timestamp Sortida
        cal = new GregorianCalendar(any, mes, dia, horaSortida, minutoSortida);
        java.sql.Timestamp tsSortida = new java.sql.Timestamp(cal.getTime().getTime());
        
        if(request.getParameter("acc").equals("buscar")){
            //Búsqueda de parquins per ajax.
            PrintWriter out = null;    
            try{
                db.iniciar();
                db.obrir();
                out = response.getWriter();
                //List<Aparcament> aparcaments = new ArrayList<>();
                Map<Aparcament,  Long> placesYAparcaments = new HashMap<>();
                List<Object[]> places = db.obtenirPlacesDisponibles(tsEntrada, tsSortida);
                for(Object[] obj :places){
                    Aparcament aparcament = db.obtenirAparcament((int)obj[0]);
                    placesYAparcaments.put(aparcament, (long)obj[1]); //Aparcament, places lliures
                }

                StringBuilder json = new StringBuilder();
                json.append("[");
                int index = 0; 
                Iterator iterator = placesYAparcaments.entrySet().iterator();
                while (iterator.hasNext()) {
                        Map.Entry mapEntry = (Map.Entry) iterator.next();
                        Aparcament ap = (Aparcament)mapEntry.getKey();
                        long placesLliures = (long)mapEntry.getValue();
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
                        json.append(placesLliures);
                        json.append("}");
                        if(index < placesYAparcaments.size() -1){json.append(",");}
                        index++;
                }
                json.append("]");
                out.println(json.toString());

            }catch(Exception ex){
                System.err.println("Error proceso búsqueda de parquings: "+ex);
                ex.printStackTrace();
            }
        }else if(request.getParameter("acc").equals("reservar")){
            try {
                db.iniciar();
                db.obrir();
                int idAparcament = Integer.parseInt(request.getParameter("idAparcament"));
                
                //Procés de reserva
                Usuari usuari = (Usuari)request.getSession().getAttribute("usuari");
                
                Placa placaLliure = db.obtenirPlacaPerReserva(tsEntrada, tsSortida, idAparcament);
                
                Reserva reserva = new Reserva();
                reserva.setPlaca(placaLliure);
                reserva.setUsuari(usuari);
                reserva.setMatricula(usuari.getMatricula());
                reserva.setHora_inici(tsEntrada);
                reserva.setHora_fi(tsSortida);
                reserva.setUtilitzada(Boolean.FALSE);
                reserva.setAnulada(Boolean.FALSE);
                reserva.setPassada(Boolean.FALSE);
                
                db.inserir(reserva);
                System.out.println("Reserva correcta");
                db.tancar();
            } catch (UtilitatPersistenciaException ex) {
                System.out.println("Reserva incorrecta");
            }
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

<%-- 
    Document   : Index Client
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page import="java.util.Arrays"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="apparkt.Reserva"%>
<%@page import="java.util.List"%>
<%@page import="Persistencia.GestorPersistenciaJPA"%>
<%@page import="Persistencia.GestorPersistencia"%>
<%@page import="apparkt.Usuari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<% 
    System.out.println("Home Client");
    Usuari usuari = (Usuari)request.getSession().getAttribute("usuari");
    
    GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
    db.iniciar();
    db.obrir();
    List<Reserva> reservasVigentes = db.obtenirReservesDunUsuari(usuari.getDni(), true);
    System.out.println(reservasVigentes);
    pageContext.setAttribute("reservasVigentes", reservasVigentes);
    List<Reserva> reservasPasadas = db.obtenirReservesDunUsuari(usuari.getDni(), false);
    System.out.println(reservasPasadas);
    db.tancar();
    
%>
<html>
    <t:head title="Registre de client"/>
    <%@include file="../WEB-INF/jspf/menu-client.jspf" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <article id="main-article" class="row reservas">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Benvingut <%=usuari.getNom() %></p>
            <p>Reserves actives</p>
            <table>
                <thead>
                    <tr>
                        <th>Matricula</th>
                        <th>Aparcament</th>
                        <th>Data</th>
                        <th>Hora Inici</th>
                        <th>Hora Fi</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Reserva r: reservasVigentes){
                        String data = r.getHora_inici().toString().split(" ")[0];
                        String[] horaInici = r.getHora_inici().toString().split(" ")[1].replace(data," ").trim().split(":");
                        String sHoraInici = horaInici[0]+":"+horaInici[1];
                        String[] horaFi = r.getHora_fi().toString().split(" ")[1].replace(data," ").trim().split(":");
                        String sHoraFi = horaFi[0]+":"+horaFi[1];
                %>
                        <tr>
                            <td><%=r.getMatricula() %></td>
                            <td><%=r.getPlaca().getAparcament().getNom() %></td>
                            <td><%=data %></td>
                            <td><%=sHoraInici %></td>
                            <td><%=sHoraFi %></td>
                            <td><a class="anular" href="<%=request.getContextPath() %>/ReservaServlet?acc=anular&idReserva=<%=r.getIdReserva() %>">Anul·lar</a></td>
                        </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <p>Reserves pasadas/Anul·lades</p>
            <table>
                <thead>
                    <tr>
                        <th>Matricula</th>
                        <th>Aparcament</th>
                        <th>Data</th>
                        <th>Hora Inici</th>
                        <th>Hora Fi</th>
                        <th>Preu</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Reserva r: reservasPasadas){
                        String data = r.getHora_inici().toString().split(" ")[0];
                        String[] horaInici = r.getHora_inici().toString().split(" ")[1].replace(data," ").trim().split(":");
                        String sHoraInici = horaInici[0]+":"+horaInici[1];
                        String[] horaFi = r.getHora_fi().toString().split(" ")[1].replace(data," ").trim().split(":");
                        String sHoraFi = horaFi[0]+":"+horaFi[1];
                        Double preu = r.getPreu();
                        String sPreu = "";
                        if(preu != null){
                            sPreu = String.valueOf(preu);
                        }
                %>
                <% if(r.isAnulada()){ %>
                    <tr class="anulada">
                <% }else{ %>    
                    <tr>
                <%}%>
                        
                            <td><%=r.getMatricula() %></td>
                            <td><%=r.getPlaca().getAparcament().getNom() %></td>
                            <td><%=data %></td>
                            <td><%=sHoraInici %></td>
                            <td><%=sHoraFi %></td>
                            <td><%=sPreu %></td>
                        </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <div class="col-md-2">
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
    <script type="text/javascript" >
        $('.anular').click(function (e){
            e.preventDefault();
            var confirmar = confirm("Està segur que vol anul·lar aquesta reserva?");
            if(confirmar){
                console.log("confirmado");
                window.location = $(this).attr("href");
            }
        });
        
    </script>
</html>

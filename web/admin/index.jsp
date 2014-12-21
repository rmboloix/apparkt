<%-- 
    Document   : Index Client
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>
<%@page import="Persistencia.GestorPersistenciaJPA"%>
<%@page import="Persistencia.GestorPersistencia"%>
<%@page import="apparkt.Aparcament"%>
<%@page import="java.util.List"%>
<%@page import="apparkt.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<% 
    System.out.println("Home Admin");
    Admin admin = (Admin)request.getSession().getAttribute("usuari");
    GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
    db.iniciar();
    db.obrir();
    admin = (Admin)db.obtenirPersonaPerNomUsuari(admin.getNomUsuari());
    List<Aparcament> aparcaments = admin.getAparcaments();
    
    
%>
<html>
    <t:head title="Inici Administrador"/>
    <%@include file="../WEB-INF/jspf/menu-admin.jspf" %>
    <article id="main-article" class="row reservas">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Benvingut <%=admin.getNom() %></p>
            <p>Aparcaments</p>
            <table>
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Direccio</th>
                        <th>Telèfon</th>
                        <th>Places</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Aparcament a: aparcaments){
                %>
                        <tr>
                            <td><%=a.getNom() %></td>
                            <td><%=a.getDireccio() %></td>
                            <td><%=a.getTelefon() %></td>
                            <td><%=a.getLlistaPlacas().size() %></td>
                            <td><a class="anular" href="<%=request.getContextPath() %>/admin/parquings.jsp?app=<%=a.getIdAparcament() %>">Gestionar </a></td>
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
    <% db.tancar(); %>
</html>

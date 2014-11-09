<%-- 
    Document   : Index Client
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page import="apparkt.Usuari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<% 
    System.out.println("Home Client");
    Usuari usuari = (Usuari)request.getSession().getAttribute("usuari");

%>
<html>
    <t:head title="Registre de client"/>
    <%@include file="../WEB-INF/jspf/menu-client.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Benvingut <%=usuari.getNom() %></p>
        </div>
        <div class="col-md-2">
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
</html>

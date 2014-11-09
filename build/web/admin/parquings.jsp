<%-- 
    Document   : Parquings
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>
<%@page import="apparkt.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<% 
    System.out.println("Home Admin");
    Admin usuari = (Admin)request.getSession().getAttribute("usuari");

%>
<html>
    <t:head title="Inici Administrador"/>
    <%@include file="../WEB-INF/jspf/menu-admin.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Parquings</p>
        </div>
        <div class="col-md-2">
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
</html>

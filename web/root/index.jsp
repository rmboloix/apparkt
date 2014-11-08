<%-- 
    Document   : index root
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page import="model.UsuariBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<% 
    
    UsuariBean usuari = (UsuariBean)request.getSession().getAttribute("usuari");

%>
<html>
    <t:head title="Registre de client"/>
    <%@include file="../WEB-INF/jspf/menu.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Les meves dades de Root</p>
            <%=usuari.getUserName() %>
            <%=usuari.getContrasenya() %>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
        <div class="col-md-2">
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
</html>

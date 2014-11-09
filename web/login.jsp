<%-- 
    Document   : login
    Created on : 26-oct-2014, 10:08:30
    Author     : Rafael Mateo Boloix
--%>

<%@page import="model.UsuariBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<% 
    if(session.getAttribute("usuari") != null){
        RequestDispatcher dispatcher = null;
        if(request.isUserInRole("ADMIN")){
            dispatcher = request.getRequestDispatcher("/admin/index.jsp");
        }else if(request.isUserInRole("USER")){
            dispatcher = request.getRequestDispatcher("/client/index.jsp");
        }else if(request.isUserInRole("ROOT")){
            dispatcher = request.getRequestDispatcher("/root/index.jsp");
        }
        dispatcher.forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="es">
    <t:head title="Login"/>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <article id="main-article" class="row">
        <div class="col-md-4 col-md-offset-4" id="cuadre-central">
            <p class="benvingut">Benvingut a Apparkt! <br/>La teva web per a la reserva de pàrquing</p>
            <c:if test="${param.code == 'ok'}">
            <p class="code-ok">Usuari registrat correctament!</p>
            </c:if>
            <p>Inicia sessió</p>
            <form id="login-form" class="login-form" method="post" action="j_security_check">
                <input name="type" type="hidden" value="login"/>
                <input name="j_username" type="text" class="validate[required,minSize[8]]" placeholder="Usuari">
                <input name="j_password" type="password" class="validate[required,minSize[8]]" placeholder="Contrasenya"/>
                <input type="submit" value="Accedir"/>
            </form>
            <p>Ets nou y vols fer una reserva? Registra't <a href='registre-client.jsp' title="Registre">aquí</a><p>
        </div>
    </article>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>

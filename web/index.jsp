<%-- 
    Document   : index
    Created on : 26-oct-2014, 10:38:33
    Author     : Rafael Mateo Boloix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<html lang="es">
    <t:head title="Reserva ara el teu pàrquing"/>
    <%@include file="/WEB-INF/jspf/menu.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-4 col-md-offset-4" id="cuadre-central">
            <p class="benvingut">Benvingut a Apparkt! <br/>La teva web per a la reserva de pàrquing</p>
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

<%-- 
    Document   : registre
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<html>
    <t:head title="Registre de client"/>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-4 col-md-offset-4" id="cuadre-central">
            <p class="benvingut">Nou client
            <p>Inicia sessió</p>
            <form id="login-form" class="login-form" method="post" action="login">
                <input name="type" type="hidden" value="login"/>
                <input name="usuari" type="text" class="validate[required,minSize[8]]" placeholder="Usuari">
                <input name="contrasenya" type="password" class="validate[required,minSize[8]]" placeholder="Contrasenya"/>
                <input type="submit" value="Accedir"/>
            </form>
        </div>
    </article>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>

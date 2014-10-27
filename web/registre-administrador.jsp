<%-- 
    Document   : registre administradors
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<html>
    <t:head title="Registre d'administradors"/>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Nou Administrador</p>
            <form id="administrador-form" method="post" action="login">
                <input name="type" type="hidden" value="nou-client"/>
                <table>
                    <tr >
                        <td colspan="3"> 
                            <p class="dades">Dades d'Usuari</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="usuari" type="text" class="validate[required]" placeholder="Usuari">
                        </td>
                        <td>
                            <input name="contrasenya" id="contrasenya" type="password" class="validate[required]" placeholder="Contrasenya"/>
                        </td>
                        <td>
                            <input name="contrasenya-2" type="password" class="validate[required,equals[contrasenya]]" placeholder="Confirma contrasenya"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <p class="dades">Dades Personals</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="nom" type="text" class="validate[required]" placeholder="Nom">
                        </td>
                        <td>
                            <input name="cognom1" type="text" class="validate[required]" placeholder="Cognom 1"/>
                        </td>
                        <td>
                            <input name="cognom2" type="text" placeholder="Cognom 2"/>
                        </td>
                    </tr>
                    <tr>
                        <td> <input name="email" type="text" class="validate[required,custom[email]]" placeholder="E-mail"/></td>
                        <td><input name="dni" type="text" class="validate[required]" placeholder="DNI/NIF"/></td>
                        <td><input name="telefon" type="text" class="validate[required,custom[phone]]" placeholder="Telèfon"/></td>
                    </tr>
                    <tr>
                        <td><input name="domicili" type="text" class="validate[required]" placeholder="Domicili"/></td>
                        <td><input name="codi-postal" type="text" class="validate[required,custom[number]]" placeholder="Codi Postal"/></td>
                        <td><input name="poblacio" type="text" class="validate[required]" placeholder="Població"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><p class="politica">Acepto la <a href="#">Política de privadesa</a> <input type="checkbox" name="privadesa" class="validate[required]"/></p></td>
                        <td><input type="submit" value="Registrar-me"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </article>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
</html>


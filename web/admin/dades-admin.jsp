<%-- 
    Document   : dades admin
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page import="apparkt.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%
    Admin user = (Admin)request.getSession().getAttribute("usuari");
    
%>
<!DOCTYPE html>
<html>
    <t:head title="Dades Administrador"/>
    <%@include file="../WEB-INF/jspf/menu-admin.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Les meves dades</p>
            <form id="client-form" method="post" action="registre">
                <input name="type" type="hidden" value="nou-client"/>
                <table>
                    <tr >
                        <td colspan="3"> 
                            <p class="dades">Dades d'Administrador</p>
                        </td>
                    </tr>
                    <tr>
                        
                        <td>
                            <input name="usuari" type="text" class="validate[required]" placeholder="Usuari" value="<%=user.getNomUsuari() %>">
                        </td>
                        <td>
                            <!--<input name="contrasenya" id="contrasenya" type="password" class="validate[required]" placeholder="Contrasenya"/>-->
                        </td>
                        <td>
                            <!--<input name="contrasenya-2" type="password" class="validate[required,equals[contrasenya]]" placeholder="Confirma contrasenya"/>-->
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <p class="dades">Dades Personals</p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="nom" type="text" class="validate[required]" placeholder="Nom" value="<%=user.getNom() %>">
                        </td>
                        <td>
                            <input name="cognom1" type="text" class="validate[required]" placeholder="Cognom 1" value="<%=user.getCognom1() %>"/>
                        </td>
                        <td>
                            <input name="cognom2" type="text" placeholder="Cognom 2" value="<%=user.getCognom2() %>"/>
                        </td>
                    </tr>
                    <tr>
                        <td> <input name="email" type="text" class="validate[required,custom[email]]" placeholder="E-mail" value="<%=user.getContacte().geteMail() %>"/></td>
                        <td><input name="dni" type="text" class="validate[required]" placeholder="DNI/NIF" value="<%=user.getDni() %>"/></td>
                        <td><input name="telefon" type="text" class="validate[required,custom[phone]]" placeholder="Telèfon"/></td>
                    </tr>
                    <tr>
                        <td><input name="domicili" type="text" class="validate[required]" placeholder="Domicili" value="<%=user.getContacte().getDireccio() %>"/></td>
                        <td><input name="codi-postal" type="text" class="validate[required,custom[number]]" placeholder="Codi Postal" value="<%=user.getContacte().getCodiPostal() %>"/></td>
                        <td><input name="poblacio" type="text" class="validate[required]" placeholder="Població" value="<%=user.getContacte().getPoblacio().getNom() %>"/></td>
                    </tr>
                    <!--<tr>
                        <td></td>
                        <td><p class="politica">Acepto la <a target="_blank" href="${pageContext.request.contextPath}/privacitat.jsp">Política de privadesa</a> <input type="checkbox" name="privadesa" class="validate[required]"/></p></td>
                        <td><input type="submit" value="Registrar-me"/></td>
                    </tr>-->
                </table>
            </form>
        </div>
        <div class="col-md-2">
            <div class="anunci">
                <p><img alt="client" src="../img/client.png"/>Des d'aqui pots realitzar:</p>
                <ul>
                    <li>Administrar les places</li>
                    <li>Gestionar les reserves</li>
                    <li>Afegir places</li>
                    <li>Esborrar places</li>
                </ul>
            </div>
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
</html>

<%-- 
    Document   : dades client.
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page import="apparkt.Usuari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<%
    Usuari user = (Usuari)request.getSession().getAttribute("usuari");
    
%>
<!DOCTYPE html>
<html>
    <t:head title="Registre de client"/>
    <%@include file="../WEB-INF/jspf/menu-client.jspf" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Les meves dades</p>
            <form id="client-form" method="post" action="<%=request.getContextPath() %>/modificar">
                <input name="type" type="hidden" value="client"/>
                <table>
                    <tr >
                        <td colspan="3"> 
                            <p class="dades">Dades d'Usuari</p>
                        </td>
                    </tr>
                    <% 
                        String codeClass = "hidden";
                        if(request.getParameter("code") != null){
                            codeClass = "visible";
                        }
                    %>
                    <tr class="<%=codeClass %>">
                        <c:if test="${param.code == 'ok'}" var="code" scope="request">
                            <td colspan="3" class="code-ok">La modificació se ha realitzat correctament</td>
                        </c:if>
                        <c:if test="${param.code == '1'}" var="code" scope="request">
                            <td colspan="3" class="code-error">Error en la modificació de les dades. Nom d'usuari no existent</td>
                        </c:if>
                        <c:if test="${param.code == '2'}" var="code" scope="request">
                            <td colspan="3" class="code-error">Error en la modificació de les dades.</td>
                        </c:if>
                    </tr>
                    <tr>
                        <td>
                            <input name="usuari" type="text" class="validate[required,minSize[8]]" placeholder="Usuari" value="<%=user.getNomUsuari() %>" readonly="readonly">
                        </td>
                        <td>
                            <input name="modificar" type="checkbox" id="modificar-contrasenya" /><span>Modificar contrasenya</span>
                            <input class="hidden" name="contrasenya" id="contrasenya" type="password" class="validate[required]" placeholder="Contrasenya" disabled/>
                        </td>
                        <td>
                            <input class="hidden" name="contrasenya-2" type="password" class="validate[required,equals[contrasenya]]" placeholder="Confirma contrasenya" disabled/>
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
                        <td><input name="dni" type="text" class="validate[required]" placeholder="DNI/NIF" value="<%=user.getDni() %>" readonly="readonly"/></td>
                        <td><input name="telefon" type="text" class="validate[required,custom[phone]]" placeholder="Telèfon" value="<%=user.getContacte().getTelefon() %>"/></td>
                    </tr>
                    <tr>
                        <td><input name="domicili" type="text" class="validate[required]" placeholder="Domicili" value="<%=user.getContacte().getDireccio() %>"/></td>
                        <td><input name="codi-postal" type="text" class="validate[required,custom[number]]" placeholder="Codi Postal" value="<%=user.getContacte().getCodiPostal() %>"/></td>
                        <td><input name="poblacio" type="text" class="validate[required]" placeholder="Població" value="<%=user.getContacte().getPoblacio().getNom() %>"/></td>
                    </tr>
                    <tr>
                        <td><p class="cotxe">Dades del cotxe</p></td>
                        <td colspan="2"><p class="facturacio">Dades de Facturació</p></td>
                    </tr>
                    <tr>
                        <td><input name="matricula" type="text" class="validate[required]" placeholder="Matrícula" value="<%=user.getMatricula() %>"/></td>
                        <td>
                            <select id="selector-compte" name="tipus-compte">
                                <option value="IBAN">Compte Bancari (IBAN)</option>
                                <option value="VISA">VISA/MASTERCARD</option>
                            </select>
                        </td>
                        <td><input name="compte" type="text" class="validate[required]" placeholder="Número" value="<%=user.getDadesFacturacio() %>"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><input type="submit" value="Modificar dades"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="col-md-2">
            <div class="anunci">
                <p><img alt="client" src="../img/client.png"/>Des d'aqui pots realitzar:</p>
                <ul>
                    <li>Reserva la plaça quan vulguis i com vulguis</li>
                    <li>Modificar la teva reserva comodament</li>
                    <li>Programar la teva reserva</li>
                    <li>Pagament fàcil i cómode</li>
                </ul>
            </div>
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
</html>
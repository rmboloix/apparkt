<%-- 
    Document   : Parquings
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="apparkt.Placa"%>
<%@page import="apparkt.Placa"%>
<%@page import="apparkt.Aparcament"%>
<%@page import="Persistencia.GestorPersistenciaJPA"%>
<%@page import="Persistencia.GestorPersistencia"%>
<%@page import="apparkt.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<% 
    Admin usuari = (Admin)request.getSession().getAttribute("usuari");
    String sIdAparcament = request.getParameter("app");
    int idAparcament = -1;
    if(sIdAparcament != null){
        idAparcament = Integer.parseInt(sIdAparcament);
    } 
    GestorPersistencia db = new GestorPersistenciaJPA("UnitatDePersistenciaAmbJpa");
    db.iniciar();
    db.obrir();
    Aparcament aparcament = db.obtenirAparcament(idAparcament);
    List<Placa> places = aparcament.getLlistaPlacas();
    Comparator<Placa> comparator = new Comparator<Placa>() {
        @Override
        public int compare(Placa o1, Placa o2) {
            if(o1.getPlanta() > o2.getPlanta()){
                return 1;
            }else if(o1.getPlanta() == o2.getPlanta()){
                if(o1.getNumero() > o2.getNumero()){
                    return 1;
                }else {
                    return -1;
                }
            }else {
                return -1;
            }
        }
    };
    Collections.sort(places, comparator);
    List<Placa> placesActives = new ArrayList<Placa>();
    List<Placa> placesNoActives = new ArrayList<Placa>();
    for(Placa p: places){
        if(p.isActiva()){
            placesActives.add(p);
        }else{
            placesNoActives.add(p);
        }
    }
%>
<html>
    <t:head title="Parquings"/>
    <%@include file="../WEB-INF/jspf/menu-admin.jspf" %>
    <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <article id="main-article" class="row reservas">
        <div class="col-md-3" >
            <div id="form-buscador">
                <p class="benvingut">Afegir Plaça</p>
                <form id="form-buscar-reserva" action="<%=request.getContextPath() %>/AdminParquing" method="post">
                    <input type="hidden" name="acc" value="crear">
                    <input type="hidden" name="app" value="<%=idAparcament %>"/>
                    <label for="planta">Planta</label>
                    <input name="planta" id="planta" placeholder="Planta"/>
                    <label for="numero">Numero</label>
                    <input name="numero" id="numero" placeholder="Numero"/>
                    <label for="tipus">Tipus</label>
                    <select name="tipus" id="tipus">
                        <option value="normal">Normal</option>
                        <option value="minusvalid">Minusvàlid</option>
                        <option value="petita">Petita</option>
                    </select>
                    <input id="submit-buscar-reserva" type="submit" value="Afegir"/>
                    <div class="clearer"></div>
                </form>
            </div>
        </div>
        <div class="col-md-6" id="cuadre-central">
            <p class="benvingut"><%= aparcament.getNom() %></p>
            <c:if test="${param.code == 'activa'}" var="code" scope="request">
                <p colspan="3" class="code-ok">Plaça activada/desactivada correctament</p>
            </c:if>
            <c:if test="${param.code == 'nova'}" var="code" scope="request">
                <p colspan="3" class="code-ok">Plaça afegida correctament</p>
            </c:if>
                <c:if test="${param.code == 'eliminada'}" var="code" scope="request">
                <p colspan="3" class="code-ok">Plaça eliminada correctament</p>
            </c:if>
            <p>Places actives</p>
            <table>
                <thead>
                    <tr>
                        <th>Planta</th>
                        <th>Numero</th>
                        <th>Tipus Placa</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Placa p: placesActives){
                %>
                        <tr>
                            <td><%=p.getPlanta() %></td>
                            <td><%=p.getNumero() %></td>
                            <td><%=p.getTipusplaca().name() %></td>
                            <td><a class="anular" href="<%=request.getContextPath() %>/AdminParquing?app=<%=sIdAparcament %>&amp;acc=desactivar&amp;idPlaca=<%=p.getIdplaca() %>">Desactivar</a></td>
                            <td><a class="anular" href="<%=request.getContextPath() %>/AdminParquing?app=<%=sIdAparcament %>&amp;acc=eliminar&amp;idPlaca=<%=p.getIdplaca() %>">Eliminar</a></td>
                        </tr>
                <%
                    }
                %>
                </tbody>
            </table>
             <% if(placesNoActives.size() > 0 ){ %>
            <p>Places inactives</p>
            <table>
                <thead>
                    <tr>
                        <th>Planta</th>
                        <th>Numero</th>
                        <th>Tipus Placa</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(Placa p: placesNoActives){
                %>
                        <tr>
                            <td><%=p.getPlanta() %></td>
                            <td><%=p.getNumero() %></td>
                            <td><%=p.getTipusplaca().name() %></td>
                            <td><a class="anular" href="<%=request.getContextPath() %>/AdminParquing?app=<%=sIdAparcament %>&amp;acc=activar&idPlaca=<%=p.getIdplaca() %>">Activar</a></td>
                            <td><a class="anular" href="<%=request.getContextPath() %>/AdminParquing?app=<%=sIdAparcament %>&amp;acc=eliminar&amp;idPlaca=<%=p.getIdplaca() %>">Eliminar</a></td>
                        </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <% } %>
            
            
        </div>
        <div class="col-md-2">
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
    <% db.tancar(); %>
</html>

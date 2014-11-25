<%-- 
    Document   : Reservar
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<!DOCTYPE html>
<html>
    <t:head title="Privacitat"/>
    <%@include file="../WEB-INF/jspf/menu-client.jspf" %>
    <article id="main-article" class="row">
        <div class="col-md-6 col-md-offset-3" id="cuadre-central">
            <p class="benvingut">Reserva</p>
            <div id="mapDiv" style="width:100%; height:400px;"></div>
        </div>
        <div class="col-md-2">
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
    
    <script type="text/javascript">
        var map;
        var marker;
        var barcelona = new google.maps.LatLng(41.3842113,2.1648133,14);
        function initMap(){
            google.maps.visualRefresh = true;
            var mapOptions = {
                //center: barcelona,
                //zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var mapElement = document.getElementById("mapDiv");
            map = new google.maps.Map(mapElement, mapOptions);
            //Marcador
            
            if(navigator.geolocation){
                navigator.geolocation.getCurrentPosition(function (position){
                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    var devCenter = new google.maps.LatLng(lat,lng);
                    map.setCenter(devCenter);
                    map.setZoom(16);
                    marker = new google.maps.Marker({
                        position:devCenter,
                        animation:google.maps.Animation.BOUNCE
                    });
                    marker.setMap(map);
                });
            }else{
                map.setCenter(barcelona);
                map.setZoom(15);
            }
            
        }
        
        google.maps.event.addDomListener(window,'load',initMap);
        
        
    </script>
</html>
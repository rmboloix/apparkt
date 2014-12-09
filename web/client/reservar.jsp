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
        <div class="col-md-3" >
            <div id="form-buscador">
                <p class="benvingut">Buscar</p>
                <form action="reserva">
                    <input type="text" name="carrer" placeholder="Carrer"/>
                    <input type="text" name="inici" placeholder="Data"/>
                    <input type="text" name="time-in" placeholder="Hora entrada"/>
                    <input type="text" name="time-out" placeholder="Hora sortida"/>
                    <input type="submit" value="Buscar"/>
                </form>
            </div>
        </div>
        <div class="col-md-6" id="cuadre-central">
            <p class="benvingut">Reserva</p>
            <div id="mapDiv" style="width:100%; height:400px;"></div>
            <p id='parquings-trobats'>S'han trobat 4 parquings</p>
        </div>
        <div class="col-md-3">
            <div id="form-reserva">
                <p class="benvingut">Resumen reserva</p>
                <form action="reserva">
                    <p id="nombre-parquing">Carrer</p>
                    <p id="dia-parquing">12 Enero 2014</p>
                    <p id="hora-entrada-parquing">21:00</p>
                    <p id="hora-salida-parquing">22:00</p>
                    <input type="submit" value="Realitzar Reserva"/>
                </form>
                
            </div>
            
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
    
    <script type="text/javascript">
        var map;
        var aparcamentSeleccionat;
        var markerSelected;
        var circle;
        var barcelona = new google.maps.LatLng(41.3842113,2.1648133,14);
        //var markerNumPlaces;
        //var aparcament;
        var aparcaments = [
            {"id":1,
             "nombre":"ParkingA",
             "lat":41.45125089473105,
             "lng": 2.2157567739486694,
             "places":2
            },
            {"id":2,
             "nombre":"ParkingB",
             "lat":41.45026656994247,
             "lng": 2.212838160821531,
             "places":21
            },
            {"id":3,
             "nombre":"ParkingC",
             "lat":41.44957824763211,
             "lng": 2.214941382408142,
             "places":41},
            { 
             "id":4,
             "nombre":"ParkingD",
             "lat":41.448259399320726,
             "lng": 2.213396430015564,
             "places":7
            }
        ];
        
        function getAparcament(id){
            for(i = 0; i < aparcaments.length; i++){
                if(aparcaments[i].id === id){
                    return aparcaments[i];
                }
            }
        }
        
        
        /*
         * Mètode que inicialitza el mapa.
         * @param {type} numeroPlaces
         * @returns {String}
         */
        function initMap(){
            google.maps.visualRefresh = true;
            var mapOptions = {
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var mapElement = document.getElementById("mapDiv");
            map = new google.maps.Map(mapElement, mapOptions);
            
            if(navigator.geolocation){
                navigator.geolocation.getCurrentPosition(function (position){
                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    var devCenter = new google.maps.LatLng(lat,lng);
                    map.setCenter(devCenter);
                    map.setZoom(16);
                    insereixAparcaments();
                });
                google.maps.event.addListener(map, 'click',function(e){
                    console.log(e.latLng.toString());
                });
            }else{
                //Si no hi ha geolocation, posicionem el mapa a Barcelona Centre.
                map.setCenter(barcelona);
                map.setZoom(15);
            }
        }
        
        google.maps.event.addDomListener(window,'load',initMap);
        
        function insereixAparcaments(){
            for(i = 0; i < aparcaments.length;i++){
                insereixParquing(aparcaments[i]);
            }
        }
        
        /*
         * Mètode que retorna el icono corresponent a la quantitat de places.
         * @returns {undefined}
         */
        function getIcon(numeroPlaces){
            var icon = "../img/p-logo-map";
            if(numeroPlaces <11){
                icon += "-"+ numeroPlaces+".png"; 
            }else if(numeroPlaces > 10 && numeroPlaces < 20){
                icon += "-mas-10.png"; 
            }else if(numeroPlaces > 20 && numeroPlaces< 30){
                icon += "-mas-20.png"; 
            }else if(numeroPlaces > 30 && numeroPlaces < 40){
                icon += "-mas-30.png"; 
            }else if(numeroPlaces > 40 && numeroPlaces < 50){
                icon += "-mas-40.png"; 
            }else if(numeroPlaces > 50 ){
                icon += "-mas-50.png"; 
            }
            return icon;
        }
        
        /*
         * Mètode que insereix el parquing al mapa i l'afegeix els events.
         * @param {type} aparcament
         * @returns {undefined}
         * 
         */
        function insereixParquing(aparcament){
            //Creem el marker amb les dades del aparcament
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(aparcament.lat, aparcament.lng),
                title:aparcament.nombre,
                icon:getIcon(aparcament.places)
            });
            marker.setMap(map); //afegim el marker al map.
           
            google.maps.event.addListener(marker, 'click', function() {
                //Definim l'acció onclick
                if(aparcamentSeleccionat === undefined){ //No hay cap seleccionat
                    //Marcador nou seleccionat
                    aparcamentSeleccionat = aparcament;
                    markerSelected = marker;
                    marker.setIcon('../img/p-logo-map-selected.png');
                }else if(aparcamentSeleccionat === aparcament){ //deseleccionem el marcador
                    aparcamentSeleccionat = undefined;
                    marker.setIcon(getIcon(aparcament.places));
                    markerSelected = undefined;
                }else{    
                    //Si ja habia un altre escollit.
                    //Camviem el marcador.
                    markerSelected.setIcon(getIcon(aparcamentSeleccionat.places));
                    marker.setIcon('../img/p-logo-map-selected.png');
                    markerSelected = marker;
                    aparcamentSeleccionat = aparcament;
                }
                //console.log(aparcamentSeleccionat);
            });
        }
        function getLatLng(carrer){
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({
                        'address':carrer,
                        'region':'ES'
                    },
                    function(results, status){
                        if(status === google.maps.GeocoderStatus.OK){
                            var markerCarrer = new google.maps.Marker({
                                       position:results[0].geometry.location
                                   }
                            );
                            markerCarrer.setMap(map);
                            map.setCenter(results[0].geometry.location);
                        }
                    }
            );
        }
        getLatLng("Doctor Pages Santa Coloma");
        
    </script>
</html>

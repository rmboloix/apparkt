<%-- 
    Document   : Reservar
    Created on : 26-oct-2014, 13:08:41
    Author     : Rafael Mateo Boloix
--%>

<%@page import="apparkt.Usuari"%>
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
                <form id="form-buscar-reserva" action="<%=request.getContextPath()%>/ReservaServlet" method="post">
                    <label for="form-carrer">Carrer</label>
                    <input type="text" name="carrer" id="form-carrer"/>
                    <label for="form-codi-postal">Codi Postal</label>
                    <input type="text" name="codi-postal" id="form-codi-postal"/>
                    <label for="form-carrer">Data</label>
                    <input type="date" name="data" id="form-data"/>
                    <label for="form-hora-entrada">Hora entrada</label>
                    <input type="time" name="hora-entrada" id="form-hora-entrada"/>
                    <label for="form-hora-sortida">Hora sortida</label>
                    <input type="time" name="hora-sortida" id="form-hora-sortida"/>
                    <input id="submit-buscar-reserva" type="submit" value="Buscar Aparcaments"/>
                    <div class="clearer"></div>
                </form>
            </div>
        </div>
        <div class="col-md-6" id="cuadre-central">
            <p class="benvingut">Reserva</p>
            <div id="mapDiv" style="width:100%; height:400px;"></div>
            <p id='parquings-trobats'>S'han trobat <span>0</span> parquings</p>
        </div>
        <div class="col-md-3">
            <div id="form-reserva">
                <p class="benvingut">Confirmar reserva</p>
                <p>Parquing: <span id="nombre-parquing"></span></p>
                <p>Data: <span id="dia-parquing"></span></p>
                <p>Hora entrada: <span id="hora-entrada-parquing"></span></p>
                <p>Hora sortida: <span id="hora-salida-parquing"></span></p>
                <button id="btn-reserva">Realitzar Reserva</button>
            </div>
        </div>
    </article>
    <%@include file="../WEB-INF/jspf/footer.jspf" %>
    
    <script type="text/javascript">
        var map;
        var aparcamentSeleccionat;
        var markerSelected;
        var markers = [];
        var circle;
        var barcelona = new google.maps.LatLng(41.3842113,2.1648133,14);
        $('#submit-buscar-reserva').on('click', function(event) {
            event.preventDefault();
            $.post('/Apparkt/ReservaServlet', {
                    'horaInici': $('input[name="hora-entrada"]').val(), 
                    'horaFi':$('input[name="hora-sortida"]').val(),
                    'data':$('input[name="data"]').val(),
                    'acc':'buscar'
            }, function(data) {
                limpiarMapa();
                console.log(data);
                aparcaments = JSON.parse(data);
                insereixAparcaments();
                movingToStreet($('input[name="carrer"]').val(),$('input[name="codi-postal"]').val());
                $('#parquings-trobats span').html(aparcaments.length);
                $('#dia-parquing').text($('input[name="data"]').val());
                $('#hora-entrada-parquing').text($('input[name="hora-entrada"]').val());
                $('#hora-salida-parquing').text($('input[name="hora-sortida"]').val());
            });
        });
        $('#btn-reserva').on('click', function(event) {
            event.preventDefault();
            $.post('/Apparkt/ReservaServlet', {
                    'horaInici': $('#hora-entrada-parquing').val(), 
                    'horaFi':$('#hora-salida-parquing').val(),
                    'data':$('#dia-parquing').val(),
                    'idAparcament':aparcamentSeleccionat.id,
                    'acc':'reservar'
            }, function(data) {
                console.log(data);
            });
        });
    /*
        
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
        */
       
       function limpiarMapa(){
           for(i = 0; i < markers.length; i++){
               markers[i].setMap(null);
           }
           markers = [];
       }
       
       
       /**
        * Mètode que obté un objecte Javascript per id d'aparcament.
        * @param {id} id Aparcament
        * @returns {aparcament}
        */
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
                    //insereixAparcaments();
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
            console.log(aparcament);
            //Creem el marker amb les dades del aparcament
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(aparcament.lat, aparcament.lng),
                title:aparcament.nombre,
                icon:getIcon(aparcament.places)
            });
            markers.push(marker);
            marker.setMap(map); //afegim el marker al map.
           
            google.maps.event.addListener(marker, 'click', function() {
                //Definim l'acció onclick
                if(aparcamentSeleccionat === undefined){ //No hay cap seleccionat
                    //Marcador nou seleccionat
                    aparcamentSeleccionat = aparcament;
                    $('#nombre-parquing').text(aparcament.nombre);
                    markerSelected = marker;
                    marker.setIcon('../img/p-logo-map-selected.png');
                }else if(aparcamentSeleccionat === aparcament){ //deseleccionem el marcador
                    aparcamentSeleccionat = undefined;
                    marker.setIcon(getIcon(aparcament.places));
                    $('#nombre-parquing').text("");
                    markerSelected = undefined;
                }else{    
                    //Si ja habia un altre escollit.
                    //Camviem el marcador.
                    markerSelected.setIcon(getIcon(aparcamentSeleccionat.places));
                    marker.setIcon('../img/p-logo-map-selected.png');
                    markerSelected = marker;
                    aparcamentSeleccionat = aparcament;
                    $('#nombre-parquing').text(aparcament.nombre);
                }
                //console.log(aparcamentSeleccionat);
            });
        }
        function movingToStreet(carrer,codiPostal){
            var geocoder = new google.maps.Geocoder();
            if(codiPostal){
                geocoder.geocode({
                            'address':carrer,
                            'region':'es',
                            'componentRestrictions': {'country': 'ES','administrativeArea':'Barcelona','postalCode':codiPostal}
                        },
                        function(results, status){
                            console.log(results);
                            if(status === google.maps.GeocoderStatus.OK){
                                if(results.length > 0 ){
                                    var markerCarrer = new google.maps.Marker({
                                                position:results[0].geometry.location
                                            }
                                    );
                                    markers.push(markerCarrer);
                                    markerCarrer.setMap(map);
                                    map.setCenter(results[0].geometry.location);
                                    map.setZoom(16);
                                }
                            }
                        }
                );
            }else{
                    geocoder.geocode({
                            'address':carrer,
                            'region':'es',
                            'componentRestrictions': {'country': 'ES','administrativeArea':'Barcelona'}
                        },
                        function(results, status){
                            //console.log(results);
                            if(status === google.maps.GeocoderStatus.OK){
                                if(results.length > 0 ){
                                    var markerCarrer = new google.maps.Marker({
                                                position:results[0].geometry.location
                                            }
                                    );
                                    markers.push(markerCarrer);
                                    markerCarrer.setMap(map);
                                    map.setCenter(results[0].geometry.location);
                                    map.setZoom(16);
                                }
                            }
                        }
                );
            }
            
        }
        //getLatLng("Doctor Pages Santa Coloma");
        
    </script>
</html>
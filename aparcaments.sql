CREATE TABLE "aparcament" (

"idaparcament" serial4 NOT NULL,

"nom" varchar(45) NOT NULL,

"direccio" varchar(45) NOT NULL,

"telefon" int4 DEFAULT NULL,

"email" varchar(45) DEFAULT NULL,

"admin" varchar(9) NOT NULL,

"zona" varchar(45) NOT NULL,

"latitude" decimal(20,14) NOT NULL,

"longitude" decimal(20,14) NOT NULL,

PRIMARY KEY ("idaparcament") 

);



CREATE UNIQUE INDEX "Aparcament_UNIQUE" ON "aparcament" ("nom", "direccio", "latitude", "longitude");

CREATE INDEX "Aparcament_Admin_idx" ON "aparcament" ("admin");

CREATE INDEX "FK_Aparcament_Zona_idx" ON "aparcament" ("zona");

COMMENT ON TABLE "aparcament" IS '		';



CREATE TABLE "placa" (

"idplaca" serial4 NOT NULL,

"idaparcament" int4 NOT NULL,

"planta" int4 NOT NULL,

"numero" int4 NOT NULL,

"tipusplaca" varchar(45) NOT NULL,

"activa" bool NOT NULL,

PRIMARY KEY ("idplaca") 

);



CREATE UNIQUE INDEX "IdPlaca_UNIQUE" ON "placa" ("idaparcament", "planta", "numero");

CREATE INDEX "IdPlaca_Aparcament_idx" ON "placa" ("idaparcament");

CREATE INDEX "IdTipusPlaca_idx" ON "placa" ("tipusplaca");



CREATE TABLE "poblacio" (

"nom" varchar(45) NOT NULL,

"provincia" varchar(45) NOT NULL,

PRIMARY KEY ("nom", "provincia") 

);



CREATE UNIQUE INDEX "IdPoblacio_UNIQUE" ON "poblacio" ("nom");

CREATE INDEX "Provincia_idx" ON "poblacio" ("provincia");



CREATE TABLE "provincia" (

"nom" varchar(45) NOT NULL,

PRIMARY KEY ("nom") 

);



CREATE UNIQUE INDEX "IdProvincia_UNIQUE" ON "provincia" ("nom");



CREATE TABLE "reserva" (

"idreserva" serial4,

"idplaca" int4 NOT NULL,

"dni" varchar(9) NOT NULL,

"matricula" varchar(10) NOT NULL,

"hora_inici" timestamp NOT NULL,

"hora_fi" timestamp NOT NULL,

"utilitzada" bool,

"hora_inici_real" timestamp DEFAULT NULL,

"hora_fi_real" timestamp DEFAULT NULL,

"preu" numeric(4,2) DEFAULT NULL,

"passada" bool DEFAULT NULL,

"anulada" bool DEFAULT NULL,

PRIMARY KEY ("idreserva") 

);



CREATE UNIQUE INDEX "IdReserva_UNIQUE" ON "reserva" ("idplaca", "dni", "hora_inici", "hora_fi");

CREATE INDEX "IdUsuari_idx" ON "reserva" ("dni");

CREATE INDEX "IdPlaca_idx" ON "reserva" ("idplaca");



CREATE TABLE "tipus_placa" (

"tipusplaca" varchar(45) NOT NULL,

PRIMARY KEY ("tipusplaca") 

);



CREATE UNIQUE INDEX "tipusplaca_UNIQUE" ON "tipus_placa" ("tipusplaca");



CREATE TABLE "tipus_usuari" (

"tipususuari" varchar(45) NOT NULL,

PRIMARY KEY ("tipususuari") 

);



CREATE UNIQUE INDEX "tipususuari_UNIQUE" ON "tipus_usuari" ("tipususuari");



CREATE TABLE "usuari" (

"dni" varchar(9) NOT NULL,

"nom" varchar(45) NOT NULL,

"cognom1" varchar(45) NOT NULL,

"cognom2" varchar(45) NOT NULL,

"direccio" varchar(45) NOT NULL,

"poblacio" varchar(45) NOT NULL,

"codipostal" varchar(5) NOT NULL,

"telefon" int4 NOT NULL,

"email" varchar(45) NOT NULL,

"nomusuari" varchar(15) NOT NULL,

"password" varchar(256) NOT NULL,

"tipususuari" varchar(45) NOT NULL,

"dadesfacturacio" varchar(31) NOT NULL,

"matricula" varchar(10) NOT NULL,

PRIMARY KEY ("dni") 

);



CREATE UNIQUE INDEX "IdUsuari_UNIQUE" ON "usuari" ("dni");

CREATE INDEX "Usuari_Poblacio_idx" ON "usuari" ("poblacio");

CREATE INDEX "IdTipusUsuari_idx" ON "usuari" ("tipususuari");



CREATE TABLE "zona" (

"nom" varchar(45) NOT NULL,

PRIMARY KEY ("nom") 

);



CREATE UNIQUE INDEX "IdZona_UNIQUE" ON "zona" ("nom");





ALTER TABLE "aparcament" ADD CONSTRAINT "FK_Aparcament_Usuari" FOREIGN KEY ("admin") REFERENCES "usuari" ("dni");

ALTER TABLE "placa" ADD CONSTRAINT "FK_Placa_Aparcament" FOREIGN KEY ("idaparcament") REFERENCES "aparcament" ("idaparcament");

ALTER TABLE "placa" ADD CONSTRAINT "FK_Placa_Tipus_Placa" FOREIGN KEY ("tipusplaca") REFERENCES "tipus_placa" ("tipusplaca");

ALTER TABLE "poblacio" ADD CONSTRAINT "FK_Poblacio_Provincia" FOREIGN KEY ("provincia") REFERENCES "provincia" ("nom");

ALTER TABLE "reserva" ADD CONSTRAINT "FK_Reserva_NumPlaca" FOREIGN KEY ("idplaca") REFERENCES "placa" ("idplaca");

ALTER TABLE "reserva" ADD CONSTRAINT "FK_Reserva_Usuari" FOREIGN KEY ("dni") REFERENCES "usuari" ("dni");

ALTER TABLE "usuari" ADD CONSTRAINT "FK_Usuari_TipusUsuari" FOREIGN KEY ("tipususuari") REFERENCES "tipus_usuari" ("tipususuari");

ALTER TABLE "aparcament" ADD CONSTRAINT "FK_Aparcament_Zona" FOREIGN KEY ("zona") REFERENCES "zona" ("nom");

ALTER TABLE "usuari" ADD CONSTRAINT "FK_Usuari_Poblacio" FOREIGN KEY ("poblacio") REFERENCES "poblacio" ("nom");



-- -----------------------------------------------------
-- Data for table `aparcaments`.`PROVINCIA`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO provincia (nom) VALUES ('Barcelona');
INSERT INTO provincia (nom) VALUES ('Girona');
INSERT INTO provincia (nom) VALUES ('Lleida');
INSERT INTO provincia (nom) VALUES ('Tarragona');

--COMMIT;

-- -----------------------------------------------------
-- Data for table `aparcaments`.`POBLACIO`
-- -----------------------------------------------------
--START TRANSACTION;
INSERT INTO poblacio VALUES ('Abrera', 'Barcelona');
INSERT INTO poblacio VALUES ('Aguilar de Segarra', 'Barcelona');
INSERT INTO poblacio VALUES ('Aiguafreda', 'Barcelona');
INSERT INTO poblacio VALUES ('Alella', 'Barcelona');
INSERT INTO poblacio VALUES ('Alpens', 'Barcelona');
INSERT INTO poblacio VALUES ('L'' Ametlla del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Arenys de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Arenys de Munt', 'Barcelona');
INSERT INTO poblacio VALUES ('Argençola', 'Barcelona');
INSERT INTO poblacio VALUES ('Argentona', 'Barcelona');
INSERT INTO poblacio VALUES ('Artés', 'Barcelona');
INSERT INTO poblacio VALUES ('Avià', 'Barcelona');
INSERT INTO poblacio VALUES ('Avinyó', 'Barcelona');
INSERT INTO poblacio VALUES ('Avinyonet del Penedès', 'Barcelona');
INSERT INTO poblacio VALUES ('Badalona', 'Barcelona');
INSERT INTO poblacio VALUES ('Badia del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Bagà', 'Barcelona');
INSERT INTO poblacio VALUES ('Balenyà', 'Barcelona');
INSERT INTO poblacio VALUES ('Balsareny', 'Barcelona');
INSERT INTO poblacio VALUES ('Barberà del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Barcelona', 'Barcelona');
INSERT INTO poblacio VALUES ('Begues', 'Barcelona');
INSERT INTO poblacio VALUES ('Bellprat', 'Barcelona');
INSERT INTO poblacio VALUES ('Berga', 'Barcelona');
INSERT INTO poblacio VALUES ('Bigues i Riells', 'Barcelona');
INSERT INTO poblacio VALUES ('Borredà', 'Barcelona');
INSERT INTO poblacio VALUES ('El Bruc', 'Barcelona');
INSERT INTO poblacio VALUES ('El Brull', 'Barcelona');
INSERT INTO poblacio VALUES ('Les Cabanyes', 'Barcelona');
INSERT INTO poblacio VALUES ('Cabrera d''Anoia', 'Barcelona');
INSERT INTO poblacio VALUES ('Cabrera de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Cabrils', 'Barcelona');
INSERT INTO poblacio VALUES ('Calaf', 'Barcelona');
INSERT INTO poblacio VALUES ('Calders', 'Barcelona');
INSERT INTO poblacio VALUES ('Caldes de Montbui', 'Barcelona');
INSERT INTO poblacio VALUES ('Caldes d''Estrac', 'Barcelona');
INSERT INTO poblacio VALUES ('Calella', 'Barcelona');
INSERT INTO poblacio VALUES ('Calldetenes', 'Barcelona');
INSERT INTO poblacio VALUES ('Callús', 'Barcelona');
INSERT INTO poblacio VALUES ('Calonge de Segarra', 'Barcelona');
INSERT INTO poblacio VALUES ('Campins', 'Barcelona');
INSERT INTO poblacio VALUES ('Canet de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Canovelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Cànoves i Samalús', 'Barcelona');
INSERT INTO poblacio VALUES ('Canyelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Capellades', 'Barcelona');
INSERT INTO poblacio VALUES ('Capolat', 'Barcelona');
INSERT INTO poblacio VALUES ('Cardedeu', 'Barcelona');
INSERT INTO poblacio VALUES ('Cardona', 'Barcelona');
INSERT INTO poblacio VALUES ('Carme', 'Barcelona');
INSERT INTO poblacio VALUES ('Casserres', 'Barcelona');
INSERT INTO poblacio VALUES ('Castell de l''Areny', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellar de n''Hug', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellar del Riu', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellar del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellbell i el Vilar', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellbisbal', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellcir', 'Barcelona');
INSERT INTO poblacio VALUES ('Castelldefels', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellet i la Gornal', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellfollit de Riubregós', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellfollit del Boix', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellgalí', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellnou de Bages', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellolí', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellterçol', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellví de la Marca', 'Barcelona');
INSERT INTO poblacio VALUES ('Castellví de Rosanes', 'Barcelona');
INSERT INTO poblacio VALUES ('Centelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Cercs', 'Barcelona');
INSERT INTO poblacio VALUES ('Cerdanyola del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Cervelló', 'Barcelona');
INSERT INTO poblacio VALUES ('Collbató', 'Barcelona');
INSERT INTO poblacio VALUES ('Collsuspina', 'Barcelona');
INSERT INTO poblacio VALUES ('Copons', 'Barcelona');
INSERT INTO poblacio VALUES ('Corbera de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Cornellà de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Cubelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Dosrius', 'Barcelona');
INSERT INTO poblacio VALUES ('Esparreguera', 'Barcelona');
INSERT INTO poblacio VALUES ('Esplugues de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('L'' Espunyola', 'Barcelona');
INSERT INTO poblacio VALUES ('L'' Estany', 'Barcelona');
INSERT INTO poblacio VALUES ('Figaró-Montmany', 'Barcelona');
INSERT INTO poblacio VALUES ('Fígols', 'Barcelona');
INSERT INTO poblacio VALUES ('Fogars de la Selva', 'Barcelona');
INSERT INTO poblacio VALUES ('Fogars de Montclús', 'Barcelona');
INSERT INTO poblacio VALUES ('Folgueroles', 'Barcelona');
INSERT INTO poblacio VALUES ('Fonollosa', 'Barcelona');
INSERT INTO poblacio VALUES ('Font-rubí', 'Barcelona');
INSERT INTO poblacio VALUES ('Les Franqueses del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Gaià', 'Barcelona');
INSERT INTO poblacio VALUES ('Gallifa', 'Barcelona');
INSERT INTO poblacio VALUES ('La Garriga', 'Barcelona');
INSERT INTO poblacio VALUES ('Gavà', 'Barcelona');
INSERT INTO poblacio VALUES ('Gelida', 'Barcelona');
INSERT INTO poblacio VALUES ('Gironella', 'Barcelona');
INSERT INTO poblacio VALUES ('Gisclareny', 'Barcelona');
INSERT INTO poblacio VALUES ('La Granada', 'Barcelona');
INSERT INTO poblacio VALUES ('Granera', 'Barcelona');
INSERT INTO poblacio VALUES ('Granollers', 'Barcelona');
INSERT INTO poblacio VALUES ('Gualba', 'Barcelona');
INSERT INTO poblacio VALUES ('Guardiola de Berguedà', 'Barcelona');
INSERT INTO poblacio VALUES ('Gurb', 'Barcelona');
INSERT INTO poblacio VALUES ('L'' Hospitalet de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Els Hostalets de Pierola', 'Barcelona');
INSERT INTO poblacio VALUES ('Igualada', 'Barcelona');
INSERT INTO poblacio VALUES ('Jorba', 'Barcelona');
INSERT INTO poblacio VALUES ('La Llacuna', 'Barcelona');
INSERT INTO poblacio VALUES ('La Llagosta', 'Barcelona');
INSERT INTO poblacio VALUES ('Lliçà d''Amunt', 'Barcelona');
INSERT INTO poblacio VALUES ('Lliçà de Vall', 'Barcelona');
INSERT INTO poblacio VALUES ('Llinars del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Lluçà', 'Barcelona');
INSERT INTO poblacio VALUES ('Malgrat de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Malla', 'Barcelona');
INSERT INTO poblacio VALUES ('Manlleu', 'Barcelona');
INSERT INTO poblacio VALUES ('Manresa', 'Barcelona');
INSERT INTO poblacio VALUES ('Marganell', 'Barcelona');
INSERT INTO poblacio VALUES ('Martorell', 'Barcelona');
INSERT INTO poblacio VALUES ('Martorelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Les Masies de Roda', 'Barcelona');
INSERT INTO poblacio VALUES ('Les Masies de Voltregà', 'Barcelona');
INSERT INTO poblacio VALUES ('El Masnou', 'Barcelona');
INSERT INTO poblacio VALUES ('Masquefa', 'Barcelona');
INSERT INTO poblacio VALUES ('Matadepera', 'Barcelona');
INSERT INTO poblacio VALUES ('Mataró', 'Barcelona');
INSERT INTO poblacio VALUES ('Mediona', 'Barcelona');
INSERT INTO poblacio VALUES ('Moià', 'Barcelona');
INSERT INTO poblacio VALUES ('Molins de Rei', 'Barcelona');
INSERT INTO poblacio VALUES ('Mollet del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Monistrol de Calders', 'Barcelona');
INSERT INTO poblacio VALUES ('Monistrol de Montserrat', 'Barcelona');
INSERT INTO poblacio VALUES ('Montcada i Reixac', 'Barcelona');
INSERT INTO poblacio VALUES ('Montclar', 'Barcelona');
INSERT INTO poblacio VALUES ('Montesquiu', 'Barcelona');
INSERT INTO poblacio VALUES ('Montgat', 'Barcelona');
INSERT INTO poblacio VALUES ('Montmajor', 'Barcelona');
INSERT INTO poblacio VALUES ('Montmaneu', 'Barcelona');
INSERT INTO poblacio VALUES ('Montmeló', 'Barcelona');
INSERT INTO poblacio VALUES ('Montornès del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Montseny', 'Barcelona');
INSERT INTO poblacio VALUES ('Muntanyola', 'Barcelona');
INSERT INTO poblacio VALUES ('Mura', 'Barcelona');
INSERT INTO poblacio VALUES ('Navarcles', 'Barcelona');
INSERT INTO poblacio VALUES ('Navàs', 'Barcelona');
INSERT INTO poblacio VALUES ('La Nou de Berguedà', 'Barcelona');
INSERT INTO poblacio VALUES ('Òdena', 'Barcelona');
INSERT INTO poblacio VALUES ('Olèrdola', 'Barcelona');
INSERT INTO poblacio VALUES ('Olesa de Bonesvalls', 'Barcelona');
INSERT INTO poblacio VALUES ('Olesa de Montserrat', 'Barcelona');
INSERT INTO poblacio VALUES ('Olivella', 'Barcelona');
INSERT INTO poblacio VALUES ('Olost', 'Barcelona');
INSERT INTO poblacio VALUES ('Olvan', 'Barcelona');
INSERT INTO poblacio VALUES ('Orís', 'Barcelona');
INSERT INTO poblacio VALUES ('Oristà', 'Barcelona');
INSERT INTO poblacio VALUES ('Orpí', 'Barcelona');
INSERT INTO poblacio VALUES ('Òrrius', 'Barcelona');
INSERT INTO poblacio VALUES ('Pacs del Penedès', 'Barcelona');
INSERT INTO poblacio VALUES ('Palafolls', 'Barcelona');
INSERT INTO poblacio VALUES ('Palau-solità i Plegamans', 'Barcelona');
INSERT INTO poblacio VALUES ('Pallejà', 'Barcelona');
INSERT INTO poblacio VALUES ('La Palma de Cervelló', 'Barcelona');
INSERT INTO poblacio VALUES ('El Papiol', 'Barcelona');
INSERT INTO poblacio VALUES ('Parets del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Perafita', 'Barcelona');
INSERT INTO poblacio VALUES ('Piera', 'Barcelona');
INSERT INTO poblacio VALUES ('Pineda de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('El Pla del Penedès', 'Barcelona');
INSERT INTO poblacio VALUES ('La Pobla de Claramunt', 'Barcelona');
INSERT INTO poblacio VALUES ('La Pobla de Lillet', 'Barcelona');
INSERT INTO poblacio VALUES ('Polinyà', 'Barcelona');
INSERT INTO poblacio VALUES ('El Pont de Vilomara i Rocafort', 'Barcelona');
INSERT INTO poblacio VALUES ('Pontons', 'Barcelona');
INSERT INTO poblacio VALUES ('El Prat de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Prats de Lluçanès', 'Barcelona');
INSERT INTO poblacio VALUES ('Els Prats de Rei', 'Barcelona');
INSERT INTO poblacio VALUES ('Premià de Dalt', 'Barcelona');
INSERT INTO poblacio VALUES ('Premià de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Puigdàlber', 'Barcelona');
INSERT INTO poblacio VALUES ('Puig-reig', 'Barcelona');
INSERT INTO poblacio VALUES ('Pujalt', 'Barcelona');
INSERT INTO poblacio VALUES ('La Quar', 'Barcelona');
INSERT INTO poblacio VALUES ('Rajadell', 'Barcelona');
INSERT INTO poblacio VALUES ('Rellinars', 'Barcelona');
INSERT INTO poblacio VALUES ('Ripollet', 'Barcelona');
INSERT INTO poblacio VALUES ('La Roca del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Roda de Ter', 'Barcelona');
INSERT INTO poblacio VALUES ('Rubí', 'Barcelona');
INSERT INTO poblacio VALUES ('Rubió', 'Barcelona');
INSERT INTO poblacio VALUES ('Rupit i Pruit', 'Barcelona');
INSERT INTO poblacio VALUES ('Sabadell', 'Barcelona');
INSERT INTO poblacio VALUES ('Sagàs', 'Barcelona');
INSERT INTO poblacio VALUES ('Saldes', 'Barcelona');
INSERT INTO poblacio VALUES ('Sallent', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Adrià de Besòs', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Agustí de Lluçanès', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Andreu de la Barca', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Andreu de Llavaneres', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Antoni de Vilamajor', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Bartomeu del Grau', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Boi de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Boi de Lluçanès', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Cebrià de Vallalta', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Celoni', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Climent de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Cugat del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Cugat Sesgarrigues', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Esteve de Palautordera', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Esteve Sesrovires', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Feliu de Codines', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Feliu de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Feliu Sasserra', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Fost de Campsentelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Fruitós de Bages', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Hipòlit de Voltregà', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Iscle de Vallalta', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Jaume de Frontanyà', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Joan de Vilatorrada', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Joan Despí', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Julià de Cerdanyola', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Julià de Vilatorta', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Just Desvern', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Llorenç d''Hortons', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Llorenç Savall', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Martí d''Albars', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Martí de Centelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Martí de Tous', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Martí Sarroca', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Martí Sesgueioles', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Mateu de Bages', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Pere de Ribes', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Pere de Riudebitlles', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Pere de Torelló', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Pere de Vilamajor', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Pere Sallavinera', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Pol de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Quintí de Mediona', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Quirze de Besora', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Quirze del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Quirze Safaja', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Sadurní d''Anoia', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Sadurní d''Osormort', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Salvador de Guardiola', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Vicenç de Castellet', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Vicenç de Montalt', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Vicenç de Torelló', 'Barcelona');
INSERT INTO poblacio VALUES ('Sant Vicenç dels Horts', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Cecília de Voltregà', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Coloma de Cervelló', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Coloma de Gramenet', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Eugènia de Berga', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Eulàlia de Riuprimer', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Eulàlia de Ronçana', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Fe del Penedès', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Margarida de Montbui', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Margarida i els Monjos', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria de Besora', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria de Corcó', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria de Martorelles', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria de Merlès', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria de Miralles', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria de Palautordera', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Maria d''Oló', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Perpètua de Mogoda', 'Barcelona');
INSERT INTO poblacio VALUES ('Santa Susanna', 'Barcelona');
INSERT INTO poblacio VALUES ('Santpedor', 'Barcelona');
INSERT INTO poblacio VALUES ('Sentmenat', 'Barcelona');
INSERT INTO poblacio VALUES ('Seva', 'Barcelona');
INSERT INTO poblacio VALUES ('Sitges', 'Barcelona');
INSERT INTO poblacio VALUES ('Sobremunt', 'Barcelona');
INSERT INTO poblacio VALUES ('Sora', 'Barcelona');
INSERT INTO poblacio VALUES ('Subirats', 'Barcelona');
INSERT INTO poblacio VALUES ('Súria', 'Barcelona');
INSERT INTO poblacio VALUES ('Tagamanent', 'Barcelona');
INSERT INTO poblacio VALUES ('Talamanca', 'Barcelona');
INSERT INTO poblacio VALUES ('Taradell', 'Barcelona');
INSERT INTO poblacio VALUES ('Tavèrnoles', 'Barcelona');
INSERT INTO poblacio VALUES ('Tavertet', 'Barcelona');
INSERT INTO poblacio VALUES ('Teià', 'Barcelona');
INSERT INTO poblacio VALUES ('Terrassa', 'Barcelona');
INSERT INTO poblacio VALUES ('Tiana', 'Barcelona');
INSERT INTO poblacio VALUES ('Tona', 'Barcelona');
INSERT INTO poblacio VALUES ('Tordera', 'Barcelona');
INSERT INTO poblacio VALUES ('Torelló', 'Barcelona');
INSERT INTO poblacio VALUES ('La Torre de Claramunt', 'Barcelona');
INSERT INTO poblacio VALUES ('Torrelavit', 'Barcelona');
INSERT INTO poblacio VALUES ('Torrelles de Foix', 'Barcelona');
INSERT INTO poblacio VALUES ('Torrelles de Llobregat', 'Barcelona');
INSERT INTO poblacio VALUES ('Ullastrell', 'Barcelona');
INSERT INTO poblacio VALUES ('Vacarisses', 'Barcelona');
INSERT INTO poblacio VALUES ('Vallbona d''Anoia', 'Barcelona');
INSERT INTO poblacio VALUES ('Vallcebre', 'Barcelona');
INSERT INTO poblacio VALUES ('Vallgorguina', 'Barcelona');
INSERT INTO poblacio VALUES ('Vallirana', 'Barcelona');
INSERT INTO poblacio VALUES ('Vallromanes', 'Barcelona');
INSERT INTO poblacio VALUES ('Veciana', 'Barcelona');
INSERT INTO poblacio VALUES ('Vic', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilada', 'Barcelona');
INSERT INTO poblacio VALUES ('Viladecans', 'Barcelona');
INSERT INTO poblacio VALUES ('Viladecavalls', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilafranca del Penedès', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilalba Sasserra', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilanova de Sau', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilanova del Camí', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilanova del Vallès', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilanova i la Geltrú', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilassar de Dalt', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilassar de Mar', 'Barcelona');
INSERT INTO poblacio VALUES ('Vilobí del Penedès', 'Barcelona');
INSERT INTO poblacio VALUES ('Viver i Serrateix', 'Barcelona');
INSERT INTO poblacio VALUES ('Agullana', 'Girona');
INSERT INTO poblacio VALUES ('Aiguaviva', 'Girona');
INSERT INTO poblacio VALUES ('Albanyà', 'Girona');
INSERT INTO poblacio VALUES ('Albons', 'Girona');
INSERT INTO poblacio VALUES ('Alp', 'Girona');
INSERT INTO poblacio VALUES ('Amer', 'Girona');
INSERT INTO poblacio VALUES ('Anglès', 'Girona');
INSERT INTO poblacio VALUES ('Arbúcies', 'Girona');
INSERT INTO poblacio VALUES ('Argelaguer', 'Girona');
INSERT INTO poblacio VALUES ('L'' Armentera', 'Girona');
INSERT INTO poblacio VALUES ('Avinyonet de Puigventós', 'Girona');
INSERT INTO poblacio VALUES ('Banyoles', 'Girona');
INSERT INTO poblacio VALUES ('Bàscara', 'Girona');
INSERT INTO poblacio VALUES ('Begur', 'Girona');
INSERT INTO poblacio VALUES ('Bellcaire d''Empordà', 'Girona');
INSERT INTO poblacio VALUES ('Besalú', 'Girona');
INSERT INTO poblacio VALUES ('Bescanó', 'Girona');
INSERT INTO poblacio VALUES ('Beuda', 'Girona');
INSERT INTO poblacio VALUES ('La Bisbal d''Empordà', 'Girona');
INSERT INTO poblacio VALUES ('Biure', 'Girona');
INSERT INTO poblacio VALUES ('Blanes', 'Girona');
INSERT INTO poblacio VALUES ('Boadella i les Escaules', 'Girona');
INSERT INTO poblacio VALUES ('Bolvir', 'Girona');
INSERT INTO poblacio VALUES ('Bordils', 'Girona');
INSERT INTO poblacio VALUES ('Borrassà', 'Girona');
INSERT INTO poblacio VALUES ('Breda', 'Girona');
INSERT INTO poblacio VALUES ('Brunyola', 'Girona');
INSERT INTO poblacio VALUES ('Cabanelles', 'Girona');
INSERT INTO poblacio VALUES ('Cabanes', 'Girona');
INSERT INTO poblacio VALUES ('Cadaqués', 'Girona');
INSERT INTO poblacio VALUES ('Caldes de Malavella', 'Girona');
INSERT INTO poblacio VALUES ('Calonge', 'Girona');
INSERT INTO poblacio VALUES ('Camós', 'Girona');
INSERT INTO poblacio VALUES ('Campdevànol', 'Girona');
INSERT INTO poblacio VALUES ('Campelles', 'Girona');
INSERT INTO poblacio VALUES ('Campllong', 'Girona');
INSERT INTO poblacio VALUES ('Camprodon', 'Girona');
INSERT INTO poblacio VALUES ('Canet d''Adri', 'Girona');
INSERT INTO poblacio VALUES ('Cantallops', 'Girona');
INSERT INTO poblacio VALUES ('Capmany', 'Girona');
INSERT INTO poblacio VALUES ('Cassà de la Selva', 'Girona');
INSERT INTO poblacio VALUES ('Castellfollit de la Roca', 'Girona');
INSERT INTO poblacio VALUES ('Castelló d''Empúries', 'Girona');
INSERT INTO poblacio VALUES ('Castell-Platja d''Aro', 'Girona');
INSERT INTO poblacio VALUES ('La Cellera de Ter', 'Girona');
INSERT INTO poblacio VALUES ('Celrà', 'Girona');
INSERT INTO poblacio VALUES ('Cervià de Ter', 'Girona');
INSERT INTO poblacio VALUES ('Cistella', 'Girona');
INSERT INTO poblacio VALUES ('Colera', 'Girona');
INSERT INTO poblacio VALUES ('Colomers', 'Girona');
INSERT INTO poblacio VALUES ('Corçà', 'Girona');
INSERT INTO poblacio VALUES ('Cornellà del Terri', 'Girona');
INSERT INTO poblacio VALUES ('Crespià', 'Girona');
INSERT INTO poblacio VALUES ('Cruïlles Monells i Sant Sadurní de l''Heura', 'Girona');
INSERT INTO poblacio VALUES ('Darnius', 'Girona');
INSERT INTO poblacio VALUES ('Das', 'Girona');
INSERT INTO poblacio VALUES ('L'' Escala', 'Girona');
INSERT INTO poblacio VALUES ('Espinelves', 'Girona');
INSERT INTO poblacio VALUES ('Espolla', 'Girona');
INSERT INTO poblacio VALUES ('Esponellà', 'Girona');
INSERT INTO poblacio VALUES ('El Far d''Empordà', 'Girona');
INSERT INTO poblacio VALUES ('Figueres', 'Girona');
INSERT INTO poblacio VALUES ('Flaçà', 'Girona');
INSERT INTO poblacio VALUES ('Foixà', 'Girona');
INSERT INTO poblacio VALUES ('Fontanals de Cerdanya', 'Girona');
INSERT INTO poblacio VALUES ('Fontanilles', 'Girona');
INSERT INTO poblacio VALUES ('Fontcoberta', 'Girona');
INSERT INTO poblacio VALUES ('Forallac', 'Girona');
INSERT INTO poblacio VALUES ('Fornells de la Selva', 'Girona');
INSERT INTO poblacio VALUES ('Fortià', 'Girona');
INSERT INTO poblacio VALUES ('Garrigàs', 'Girona');
INSERT INTO poblacio VALUES ('Garrigoles', 'Girona');
INSERT INTO poblacio VALUES ('Garriguella', 'Girona');
INSERT INTO poblacio VALUES ('Ger', 'Girona');
INSERT INTO poblacio VALUES ('Girona', 'Girona');
INSERT INTO poblacio VALUES ('Gombrèn', 'Girona');
INSERT INTO poblacio VALUES ('Gualta', 'Girona');
INSERT INTO poblacio VALUES ('Guils de Cerdanya', 'Girona');
INSERT INTO poblacio VALUES ('Hostalric', 'Girona');
INSERT INTO poblacio VALUES ('Isòvol', 'Girona');
INSERT INTO poblacio VALUES ('Jafre', 'Girona');
INSERT INTO poblacio VALUES ('La Jonquera', 'Girona');
INSERT INTO poblacio VALUES ('Juià', 'Girona');
INSERT INTO poblacio VALUES ('Lladó', 'Girona');
INSERT INTO poblacio VALUES ('Llagostera', 'Girona');
INSERT INTO poblacio VALUES ('Llambilles', 'Girona');
INSERT INTO poblacio VALUES ('Llanars', 'Girona');
INSERT INTO poblacio VALUES ('Llançà', 'Girona');
INSERT INTO poblacio VALUES ('Llers', 'Girona');
INSERT INTO poblacio VALUES ('Llívia', 'Girona');
INSERT INTO poblacio VALUES ('Lloret de Mar', 'Girona');
INSERT INTO poblacio VALUES ('Les Llosses', 'Girona');
INSERT INTO poblacio VALUES ('Maçanet de Cabrenys', 'Girona');
INSERT INTO poblacio VALUES ('Maçanet de la Selva', 'Girona');
INSERT INTO poblacio VALUES ('Madremanya', 'Girona');
INSERT INTO poblacio VALUES ('Maià de Montcal', 'Girona');
INSERT INTO poblacio VALUES ('Masarac', 'Girona');
INSERT INTO poblacio VALUES ('Massanes', 'Girona');
INSERT INTO poblacio VALUES ('Meranges', 'Girona');
INSERT INTO poblacio VALUES ('Mieres', 'Girona');
INSERT INTO poblacio VALUES ('Mollet de Peralada', 'Girona');
INSERT INTO poblacio VALUES ('Molló', 'Girona');
INSERT INTO poblacio VALUES ('Montagut i Oix', 'Girona');
INSERT INTO poblacio VALUES ('Mont-ras', 'Girona');
INSERT INTO poblacio VALUES ('Navata', 'Girona');
INSERT INTO poblacio VALUES ('Ogassa', 'Girona');
INSERT INTO poblacio VALUES ('Olot', 'Girona');
INSERT INTO poblacio VALUES ('Ordis', 'Girona');
INSERT INTO poblacio VALUES ('Osor', 'Girona');
INSERT INTO poblacio VALUES ('Palafrugell', 'Girona');
INSERT INTO poblacio VALUES ('Palamós', 'Girona');
INSERT INTO poblacio VALUES ('Palau de Santa Eulàlia', 'Girona');
INSERT INTO poblacio VALUES ('Palau-sator', 'Girona');
INSERT INTO poblacio VALUES ('Palau-saverdera', 'Girona');
INSERT INTO poblacio VALUES ('Palol de Revardit', 'Girona');
INSERT INTO poblacio VALUES ('Pals', 'Girona');
INSERT INTO poblacio VALUES ('Pardines', 'Girona');
INSERT INTO poblacio VALUES ('Parlavà', 'Girona');
INSERT INTO poblacio VALUES ('Pau', 'Girona');
INSERT INTO poblacio VALUES ('Pedret i Marzà', 'Girona');
INSERT INTO poblacio VALUES ('La Pera', 'Girona');
INSERT INTO poblacio VALUES ('Peralada', 'Girona');
INSERT INTO poblacio VALUES ('Les Planes d''Hostoles', 'Girona');
INSERT INTO poblacio VALUES ('Planoles', 'Girona');
INSERT INTO poblacio VALUES ('Pont de Molins', 'Girona');
INSERT INTO poblacio VALUES ('Pontós', 'Girona');
INSERT INTO poblacio VALUES ('Porqueres', 'Girona');
INSERT INTO poblacio VALUES ('El Port de la Selva', 'Girona');
INSERT INTO poblacio VALUES ('Portbou', 'Girona');
INSERT INTO poblacio VALUES ('Les Preses', 'Girona');
INSERT INTO poblacio VALUES ('Puigcerdà', 'Girona');
INSERT INTO poblacio VALUES ('Quart', 'Girona');
INSERT INTO poblacio VALUES ('Queralbs', 'Girona');
INSERT INTO poblacio VALUES ('Rabós', 'Girona');
INSERT INTO poblacio VALUES ('Regencós', 'Girona');
INSERT INTO poblacio VALUES ('Ribes de Freser', 'Girona');
INSERT INTO poblacio VALUES ('Riells i Viabrea', 'Girona');
INSERT INTO poblacio VALUES ('Ripoll', 'Girona');
INSERT INTO poblacio VALUES ('Riudarenes', 'Girona');
INSERT INTO poblacio VALUES ('Riudaura', 'Girona');
INSERT INTO poblacio VALUES ('Riudellots de la Selva', 'Girona');
INSERT INTO poblacio VALUES ('Riumors', 'Girona');
INSERT INTO poblacio VALUES ('Roses', 'Girona');
INSERT INTO poblacio VALUES ('Rupià', 'Girona');
INSERT INTO poblacio VALUES ('Sales de Llierca', 'Girona');
INSERT INTO poblacio VALUES ('Salt', 'Girona');
INSERT INTO poblacio VALUES ('Sant Andreu Salou', 'Girona');
INSERT INTO poblacio VALUES ('Sant Aniol de Finestres', 'Girona');
INSERT INTO poblacio VALUES ('Sant Climent Sescebes', 'Girona');
INSERT INTO poblacio VALUES ('Sant Feliu de Buixalleu', 'Girona');
INSERT INTO poblacio VALUES ('Sant Feliu de Guíxols', 'Girona');
INSERT INTO poblacio VALUES ('Sant Feliu de Pallerols', 'Girona');
INSERT INTO poblacio VALUES ('Sant Ferriol', 'Girona');
INSERT INTO poblacio VALUES ('Sant Gregori', 'Girona');
INSERT INTO poblacio VALUES ('Sant Hilari Sacalm', 'Girona');
INSERT INTO poblacio VALUES ('Sant Jaume de Llierca', 'Girona');
INSERT INTO poblacio VALUES ('Sant Joan de les Abadesses', 'Girona');
INSERT INTO poblacio VALUES ('Sant Joan de Mollet', 'Girona');
INSERT INTO poblacio VALUES ('Sant Joan les Fonts', 'Girona');
INSERT INTO poblacio VALUES ('Sant Jordi Desvalls', 'Girona');
INSERT INTO poblacio VALUES ('Sant Julià de Ramis', 'Girona');
INSERT INTO poblacio VALUES ('Sant Julià del Llor i Bonmatí', 'Girona');
INSERT INTO poblacio VALUES ('Sant Llorenç de la Muga', 'Girona');
INSERT INTO poblacio VALUES ('Sant Martí de Llémena', 'Girona');
INSERT INTO poblacio VALUES ('Sant Martí Vell', 'Girona');
INSERT INTO poblacio VALUES ('Sant Miquel de Campmajor', 'Girona');
INSERT INTO poblacio VALUES ('Sant Miquel de Fluvià', 'Girona');
INSERT INTO poblacio VALUES ('Sant Mori', 'Girona');
INSERT INTO poblacio VALUES ('Sant Pau de Segúries', 'Girona');
INSERT INTO poblacio VALUES ('Sant Pere Pescador', 'Girona');
INSERT INTO poblacio VALUES ('Santa Coloma de Farners', 'Girona');
INSERT INTO poblacio VALUES ('Santa Cristina d''Aro', 'Girona');
INSERT INTO poblacio VALUES ('Santa Llogaia d''Àlguema', 'Girona');
INSERT INTO poblacio VALUES ('Santa Pau', 'Girona');
INSERT INTO poblacio VALUES ('Sarrià de Ter', 'Girona');
INSERT INTO poblacio VALUES ('Saus Camallera i Llampaies', 'Girona');
INSERT INTO poblacio VALUES ('La Selva de Mar', 'Girona');
INSERT INTO poblacio VALUES ('Serinyà', 'Girona');
INSERT INTO poblacio VALUES ('Serra de Daró', 'Girona');
INSERT INTO poblacio VALUES ('Setcases', 'Girona');
INSERT INTO poblacio VALUES ('Sils', 'Girona');
INSERT INTO poblacio VALUES ('Siurana', 'Girona');
INSERT INTO poblacio VALUES ('Susqueda', 'Girona');
INSERT INTO poblacio VALUES ('La Tallada d''Empordà', 'Girona');
INSERT INTO poblacio VALUES ('Terrades', 'Girona');
INSERT INTO poblacio VALUES ('Torrent', 'Girona');
INSERT INTO poblacio VALUES ('Torroella de Fluvià', 'Girona');
INSERT INTO poblacio VALUES ('Torroella de Montgrí', 'Girona');
INSERT INTO poblacio VALUES ('Tortellà', 'Girona');
INSERT INTO poblacio VALUES ('Toses', 'Girona');
INSERT INTO poblacio VALUES ('Tossa de Mar', 'Girona');
INSERT INTO poblacio VALUES ('Ullà', 'Girona');
INSERT INTO poblacio VALUES ('Ullastret', 'Girona');
INSERT INTO poblacio VALUES ('Ultramort', 'Girona');
INSERT INTO poblacio VALUES ('Urús', 'Girona');
INSERT INTO poblacio VALUES ('La Vajol', 'Girona');
INSERT INTO poblacio VALUES ('La Vall de Bianya', 'Girona');
INSERT INTO poblacio VALUES ('La Vall d''en Bas', 'Girona');
INSERT INTO poblacio VALUES ('Vallfogona de Ripollès', 'Girona');
INSERT INTO poblacio VALUES ('Vall-llobrega', 'Girona');
INSERT INTO poblacio VALUES ('Ventalló', 'Girona');
INSERT INTO poblacio VALUES ('Verges', 'Girona');
INSERT INTO poblacio VALUES ('Vidrà', 'Girona');
INSERT INTO poblacio VALUES ('Vidreres', 'Girona');
INSERT INTO poblacio VALUES ('Vilabertran', 'Girona');
INSERT INTO poblacio VALUES ('Vilablareix', 'Girona');
INSERT INTO poblacio VALUES ('Viladamat', 'Girona');
INSERT INTO poblacio VALUES ('Viladasens', 'Girona');
INSERT INTO poblacio VALUES ('Vilademuls', 'Girona');
INSERT INTO poblacio VALUES ('Viladrau', 'Girona');
INSERT INTO poblacio VALUES ('Vilafant', 'Girona');
INSERT INTO poblacio VALUES ('Vilajuïga', 'Girona');
INSERT INTO poblacio VALUES ('Vilallonga de Ter', 'Girona');
INSERT INTO poblacio VALUES ('Vilamacolum', 'Girona');
INSERT INTO poblacio VALUES ('Vilamalla', 'Girona');
INSERT INTO poblacio VALUES ('Vilamaniscle', 'Girona');
INSERT INTO poblacio VALUES ('Vilanant', 'Girona');
INSERT INTO poblacio VALUES ('Vila-sacra', 'Girona');
INSERT INTO poblacio VALUES ('Vilaür', 'Girona');
INSERT INTO poblacio VALUES ('Vilobí d''Onyar', 'Girona');
INSERT INTO poblacio VALUES ('Vilopriu', 'Girona');
INSERT INTO poblacio VALUES ('Abella de la Conca', 'Lleida');
INSERT INTO poblacio VALUES ('Àger', 'Lleida');
INSERT INTO poblacio VALUES ('Agramunt', 'Lleida');
INSERT INTO poblacio VALUES ('Aitona', 'Lleida');
INSERT INTO poblacio VALUES ('Els Alamús', 'Lleida');
INSERT INTO poblacio VALUES ('Alàs i Cerc', 'Lleida');
INSERT INTO poblacio VALUES ('L'' Albagés', 'Lleida');
INSERT INTO poblacio VALUES ('Albatàrrec', 'Lleida');
INSERT INTO poblacio VALUES ('Albesa', 'Lleida');
INSERT INTO poblacio VALUES ('L'' Albi', 'Lleida');
INSERT INTO poblacio VALUES ('Alcanó', 'Lleida');
INSERT INTO poblacio VALUES ('Alcarràs', 'Lleida');
INSERT INTO poblacio VALUES ('Alcoletge', 'Lleida');
INSERT INTO poblacio VALUES ('Alfarràs', 'Lleida');
INSERT INTO poblacio VALUES ('Alfés', 'Lleida');
INSERT INTO poblacio VALUES ('Algerri', 'Lleida');
INSERT INTO poblacio VALUES ('Alguaire', 'Lleida');
INSERT INTO poblacio VALUES ('Alins', 'Lleida');
INSERT INTO poblacio VALUES ('Almacelles', 'Lleida');
INSERT INTO poblacio VALUES ('Almatret', 'Lleida');
INSERT INTO poblacio VALUES ('Almenar', 'Lleida');
INSERT INTO poblacio VALUES ('Alòs de Balaguer', 'Lleida');
INSERT INTO poblacio VALUES ('Alpicat', 'Lleida');
INSERT INTO poblacio VALUES ('Alt Àneu', 'Lleida');
INSERT INTO poblacio VALUES ('Anglesola', 'Lleida');
INSERT INTO poblacio VALUES ('Arbeca', 'Lleida');
INSERT INTO poblacio VALUES ('Arres', 'Lleida');
INSERT INTO poblacio VALUES ('Arsèguel', 'Lleida');
INSERT INTO poblacio VALUES ('Artesa de Lleida', 'Lleida');
INSERT INTO poblacio VALUES ('Artesa de Segre', 'Lleida');
INSERT INTO poblacio VALUES ('Aspa', 'Lleida');
INSERT INTO poblacio VALUES ('Les Avellanes i Santa Linya', 'Lleida');
INSERT INTO poblacio VALUES ('Baix Pallars', 'Lleida');
INSERT INTO poblacio VALUES ('Balaguer', 'Lleida');
INSERT INTO poblacio VALUES ('Barbens', 'Lleida');
INSERT INTO poblacio VALUES ('La Baronia de Rialb', 'Lleida');
INSERT INTO poblacio VALUES ('Bassella', 'Lleida');
INSERT INTO poblacio VALUES ('Bausen', 'Lleida');
INSERT INTO poblacio VALUES ('Belianes', 'Lleida');
INSERT INTO poblacio VALUES ('Bellaguarda', 'Lleida');
INSERT INTO poblacio VALUES ('Bellcaire d''Urgell', 'Lleida');
INSERT INTO poblacio VALUES ('Bell-lloc d''Urgell', 'Lleida');
INSERT INTO poblacio VALUES ('Bellmunt d''Urgell', 'Lleida');
INSERT INTO poblacio VALUES ('Bellpuig', 'Lleida');
INSERT INTO poblacio VALUES ('Bellver de Cerdanya', 'Lleida');
INSERT INTO poblacio VALUES ('Bellvís', 'Lleida');
INSERT INTO poblacio VALUES ('Benavent de Segrià', 'Lleida');
INSERT INTO poblacio VALUES ('Biosca', 'Lleida');
INSERT INTO poblacio VALUES ('Es Bòrdes', 'Lleida');
INSERT INTO poblacio VALUES ('Les Borges Blanques', 'Lleida');
INSERT INTO poblacio VALUES ('Bossòst', 'Lleida');
INSERT INTO poblacio VALUES ('Bovera', 'Lleida');
INSERT INTO poblacio VALUES ('Cabanabona', 'Lleida');
INSERT INTO poblacio VALUES ('Cabó', 'Lleida');
INSERT INTO poblacio VALUES ('Camarasa', 'Lleida');
INSERT INTO poblacio VALUES ('Canejan', 'Lleida');
INSERT INTO poblacio VALUES ('Castell de Mur', 'Lleida');
INSERT INTO poblacio VALUES ('Castellar de la Ribera', 'Lleida');
INSERT INTO poblacio VALUES ('Castelldans', 'Lleida');
INSERT INTO poblacio VALUES ('Castellnou de Seana', 'Lleida');
INSERT INTO poblacio VALUES ('Castelló de Farfanya', 'Lleida');
INSERT INTO poblacio VALUES ('Castellserà', 'Lleida');
INSERT INTO poblacio VALUES ('Cava', 'Lleida');
INSERT INTO poblacio VALUES ('Cervera', 'Lleida');
INSERT INTO poblacio VALUES ('Cervià de les Garrigues', 'Lleida');
INSERT INTO poblacio VALUES ('Ciutadilla', 'Lleida');
INSERT INTO poblacio VALUES ('Clariana de Cardener', 'Lleida');
INSERT INTO poblacio VALUES ('El Cogul', 'Lleida');
INSERT INTO poblacio VALUES ('Coll de Nargó', 'Lleida');
INSERT INTO poblacio VALUES ('La Coma i la Pedra', 'Lleida');
INSERT INTO poblacio VALUES ('Conca de Dalt', 'Lleida');
INSERT INTO poblacio VALUES ('Corbins', 'Lleida');
INSERT INTO poblacio VALUES ('Cubells', 'Lleida');
INSERT INTO poblacio VALUES ('L'' Espluga Calba', 'Lleida');
INSERT INTO poblacio VALUES ('Espot', 'Lleida');
INSERT INTO poblacio VALUES ('Estamariu', 'Lleida');
INSERT INTO poblacio VALUES ('Estaràs', 'Lleida');
INSERT INTO poblacio VALUES ('Esterri d''Àneu', 'Lleida');
INSERT INTO poblacio VALUES ('Esterri de Cardós', 'Lleida');
INSERT INTO poblacio VALUES ('Farrera', 'Lleida');
INSERT INTO poblacio VALUES ('Fígols i Alinyà', 'Lleida');
INSERT INTO poblacio VALUES ('La Floresta', 'Lleida');
INSERT INTO poblacio VALUES ('Fondarella', 'Lleida');
INSERT INTO poblacio VALUES ('Foradada', 'Lleida');
INSERT INTO poblacio VALUES ('La Fuliola', 'Lleida');
INSERT INTO poblacio VALUES ('Fulleda', 'Lleida');
INSERT INTO poblacio VALUES ('Gavet de la Conca', 'Lleida');
INSERT INTO poblacio VALUES ('Gimenells i el Pla de la Font', 'Lleida');
INSERT INTO poblacio VALUES ('Golmés', 'Lleida');
INSERT INTO poblacio VALUES ('Gósol', 'Lleida');
INSERT INTO poblacio VALUES ('La Granadella', 'Lleida');
INSERT INTO poblacio VALUES ('La Granja d''Escarp', 'Lleida');
INSERT INTO poblacio VALUES ('Granyanella', 'Lleida');
INSERT INTO poblacio VALUES ('Granyena de les Garrigues', 'Lleida');
INSERT INTO poblacio VALUES ('Granyena de Segarra', 'Lleida');
INSERT INTO poblacio VALUES ('Guimerà', 'Lleida');
INSERT INTO poblacio VALUES ('La Guingueta d''Àneu', 'Lleida');
INSERT INTO poblacio VALUES ('Guissona', 'Lleida');
INSERT INTO poblacio VALUES ('Guixers', 'Lleida');
INSERT INTO poblacio VALUES ('Isona i Conca Dellà', 'Lleida');
INSERT INTO poblacio VALUES ('Ivars de Noguera', 'Lleida');
INSERT INTO poblacio VALUES ('Ivars d''Urgell', 'Lleida');
INSERT INTO poblacio VALUES ('Ivorra', 'Lleida');
INSERT INTO poblacio VALUES ('Josa i Tuixén', 'Lleida');
INSERT INTO poblacio VALUES ('Juncosa', 'Lleida');
INSERT INTO poblacio VALUES ('Juneda', 'Lleida');
INSERT INTO poblacio VALUES ('Les', 'Lleida');
INSERT INTO poblacio VALUES ('Linyola', 'Lleida');
INSERT INTO poblacio VALUES ('Lladorre', 'Lleida');
INSERT INTO poblacio VALUES ('Lladurs', 'Lleida');
INSERT INTO poblacio VALUES ('Llardecans', 'Lleida');
INSERT INTO poblacio VALUES ('Llavorsí', 'Lleida');
INSERT INTO poblacio VALUES ('Lleida', 'Lleida');
INSERT INTO poblacio VALUES ('Lles de Cerdanya', 'Lleida');
INSERT INTO poblacio VALUES ('Llimiana', 'Lleida');
INSERT INTO poblacio VALUES ('Llobera', 'Lleida');
INSERT INTO poblacio VALUES ('Maials', 'Lleida');
INSERT INTO poblacio VALUES ('Maldà', 'Lleida');
INSERT INTO poblacio VALUES ('Massalcoreig', 'Lleida');
INSERT INTO poblacio VALUES ('Massoteres', 'Lleida');
INSERT INTO poblacio VALUES ('Menàrguens', 'Lleida');
INSERT INTO poblacio VALUES ('Miralcamp', 'Lleida');
INSERT INTO poblacio VALUES ('Mollerussa', 'Lleida');
INSERT INTO poblacio VALUES ('La Molsosa', 'Lleida');
INSERT INTO poblacio VALUES ('Montellà i Martinet', 'Lleida');
INSERT INTO poblacio VALUES ('Montferrer i Castellbò', 'Lleida');
INSERT INTO poblacio VALUES ('Montgai', 'Lleida');
INSERT INTO poblacio VALUES ('Montoliu de Lleida', 'Lleida');
INSERT INTO poblacio VALUES ('Montoliu de Segarra', 'Lleida');
INSERT INTO poblacio VALUES ('Montornès de Segarra', 'Lleida');
INSERT INTO poblacio VALUES ('Nalec', 'Lleida');
INSERT INTO poblacio VALUES ('Naut Aran', 'Lleida');
INSERT INTO poblacio VALUES ('Navès', 'Lleida');
INSERT INTO poblacio VALUES ('Odèn', 'Lleida');
INSERT INTO poblacio VALUES ('Oliana', 'Lleida');
INSERT INTO poblacio VALUES ('Oliola', 'Lleida');
INSERT INTO poblacio VALUES ('Olius', 'Lleida');
INSERT INTO poblacio VALUES ('Les Oluges', 'Lleida');
INSERT INTO poblacio VALUES ('Els Omellons', 'Lleida');
INSERT INTO poblacio VALUES ('Els Omells de na Gaia', 'Lleida');
INSERT INTO poblacio VALUES ('Organyà', 'Lleida');
INSERT INTO poblacio VALUES ('Os de Balaguer', 'Lleida');
INSERT INTO poblacio VALUES ('Ossó de Sió', 'Lleida');
INSERT INTO poblacio VALUES ('El Palau d''Anglesola', 'Lleida');
INSERT INTO poblacio VALUES ('Penelles', 'Lleida');
INSERT INTO poblacio VALUES ('Peramola', 'Lleida');
INSERT INTO poblacio VALUES ('Pinell de Solsonès', 'Lleida');
INSERT INTO poblacio VALUES ('Pinós', 'Lleida');
INSERT INTO poblacio VALUES ('Els Plans de Sió', 'Lleida');
INSERT INTO poblacio VALUES ('El Poal', 'Lleida');
INSERT INTO poblacio VALUES ('La Pobla de Cérvoles', 'Lleida');
INSERT INTO poblacio VALUES ('La Pobla de Segur', 'Lleida');
INSERT INTO poblacio VALUES ('El Pont de Bar', 'Lleida');
INSERT INTO poblacio VALUES ('El Pont de Suert', 'Lleida');
INSERT INTO poblacio VALUES ('Ponts', 'Lleida');
INSERT INTO poblacio VALUES ('La Portella', 'Lleida');
INSERT INTO poblacio VALUES ('Prats i Sansor', 'Lleida');
INSERT INTO poblacio VALUES ('Preixana', 'Lleida');
INSERT INTO poblacio VALUES ('Preixens', 'Lleida');
INSERT INTO poblacio VALUES ('Prullans', 'Lleida');
INSERT INTO poblacio VALUES ('Puiggròs', 'Lleida');
INSERT INTO poblacio VALUES ('Puigverd d''Agramunt', 'Lleida');
INSERT INTO poblacio VALUES ('Puigverd de Lleida', 'Lleida');
INSERT INTO poblacio VALUES ('Rialp', 'Lleida');
INSERT INTO poblacio VALUES ('Ribera d''Ondara', 'Lleida');
INSERT INTO poblacio VALUES ('Ribera d''Urgellet', 'Lleida');
INSERT INTO poblacio VALUES ('Riner', 'Lleida');
INSERT INTO poblacio VALUES ('Riu de Cerdanya', 'Lleida');
INSERT INTO poblacio VALUES ('Rosselló', 'Lleida');
INSERT INTO poblacio VALUES ('Salàs de Pallars', 'Lleida');
INSERT INTO poblacio VALUES ('Sanaüja', 'Lleida');
INSERT INTO poblacio VALUES ('Sant Esteve de la Sarga', 'Lleida');
INSERT INTO poblacio VALUES ('Sant Guim de Freixenet', 'Lleida');
INSERT INTO poblacio VALUES ('Sant Guim de la Plana', 'Lleida');
INSERT INTO poblacio VALUES ('Sant Llorenç de Morunys', 'Lleida');
INSERT INTO poblacio VALUES ('Sant Martí de Riucorb', 'Lleida');
INSERT INTO poblacio VALUES ('Sant Ramon', 'Lleida');
INSERT INTO poblacio VALUES ('Sarroca de Bellera', 'Lleida');
INSERT INTO poblacio VALUES ('Sarroca de Lleida', 'Lleida');
INSERT INTO poblacio VALUES ('Senterada', 'Lleida');
INSERT INTO poblacio VALUES ('La Sentiu de Sió', 'Lleida');
INSERT INTO poblacio VALUES ('Seròs', 'Lleida');
INSERT INTO poblacio VALUES ('La Seu d''Urgell', 'Lleida');
INSERT INTO poblacio VALUES ('Sidamon', 'Lleida');
INSERT INTO poblacio VALUES ('El Soleràs', 'Lleida');
INSERT INTO poblacio VALUES ('Solsona', 'Lleida');
INSERT INTO poblacio VALUES ('Soriguera', 'Lleida');
INSERT INTO poblacio VALUES ('Sort', 'Lleida');
INSERT INTO poblacio VALUES ('Soses', 'Lleida');
INSERT INTO poblacio VALUES ('Sudanell', 'Lleida');
INSERT INTO poblacio VALUES ('Sunyer', 'Lleida');
INSERT INTO poblacio VALUES ('Talarn', 'Lleida');
INSERT INTO poblacio VALUES ('Talavera', 'Lleida');
INSERT INTO poblacio VALUES ('Tàrrega', 'Lleida');
INSERT INTO poblacio VALUES ('Tarrés', 'Lleida');
INSERT INTO poblacio VALUES ('Tarroja de Segarra', 'Lleida');
INSERT INTO poblacio VALUES ('Térmens', 'Lleida');
INSERT INTO poblacio VALUES ('Tírvia', 'Lleida');
INSERT INTO poblacio VALUES ('Tiurana', 'Lleida');
INSERT INTO poblacio VALUES ('Torà', 'Lleida');
INSERT INTO poblacio VALUES ('Els Torms', 'Lleida');
INSERT INTO poblacio VALUES ('Tornabous', 'Lleida');
INSERT INTO poblacio VALUES ('La Torre de Cabdella', 'Lleida');
INSERT INTO poblacio VALUES ('Torrebesses', 'Lleida');
INSERT INTO poblacio VALUES ('Torrefarrera', 'Lleida');
INSERT INTO poblacio VALUES ('Torrefeta i Florejacs', 'Lleida');
INSERT INTO poblacio VALUES ('Torregrossa', 'Lleida');
INSERT INTO poblacio VALUES ('Torrelameu', 'Lleida');
INSERT INTO poblacio VALUES ('Torres de Segre', 'Lleida');
INSERT INTO poblacio VALUES ('Torre-serona', 'Lleida');
INSERT INTO poblacio VALUES ('Tremp', 'Lleida');
INSERT INTO poblacio VALUES ('La Vall de Boí', 'Lleida');
INSERT INTO poblacio VALUES ('Vall de Cardós', 'Lleida');
INSERT INTO poblacio VALUES ('Vallbona de les Monges', 'Lleida');
INSERT INTO poblacio VALUES ('Vallfogona de Balaguer', 'Lleida');
INSERT INTO poblacio VALUES ('Les Valls d''Aguilar', 'Lleida');
INSERT INTO poblacio VALUES ('Les Valls de Valira', 'Lleida');
INSERT INTO poblacio VALUES ('La Vansa i Fórnols', 'Lleida');
INSERT INTO poblacio VALUES ('Verdú', 'Lleida');
INSERT INTO poblacio VALUES ('Vielha e Mijaran', 'Lleida');
INSERT INTO poblacio VALUES ('Vilagrassa', 'Lleida');
INSERT INTO poblacio VALUES ('Vilaller', 'Lleida');
INSERT INTO poblacio VALUES ('Vilamòs', 'Lleida');
INSERT INTO poblacio VALUES ('Vilanova de Bellpuig', 'Lleida');
INSERT INTO poblacio VALUES ('Vilanova de la Barca', 'Lleida');
INSERT INTO poblacio VALUES ('Vilanova de l''Aguda', 'Lleida');
INSERT INTO poblacio VALUES ('Vilanova de Meià', 'Lleida');
INSERT INTO poblacio VALUES ('Vilanova de Segrià', 'Lleida');
INSERT INTO poblacio VALUES ('Vila-sana', 'Lleida');
INSERT INTO poblacio VALUES ('El Vilosell', 'Lleida');
INSERT INTO poblacio VALUES ('Vinaixa', 'Lleida');
INSERT INTO poblacio VALUES ('Aiguamúrcia', 'Tarragona');
INSERT INTO poblacio VALUES ('Albinyana', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Albiol', 'Tarragona');
INSERT INTO poblacio VALUES ('Alcanar', 'Tarragona');
INSERT INTO poblacio VALUES ('Alcover', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Aldea', 'Tarragona');
INSERT INTO poblacio VALUES ('Aldover', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Aleixar', 'Tarragona');
INSERT INTO poblacio VALUES ('Alfara de Carles', 'Tarragona');
INSERT INTO poblacio VALUES ('Alforja', 'Tarragona');
INSERT INTO poblacio VALUES ('Alió', 'Tarragona');
INSERT INTO poblacio VALUES ('Almoster', 'Tarragona');
INSERT INTO poblacio VALUES ('Altafulla', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Ametlla de Mar', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Ampolla', 'Tarragona');
INSERT INTO poblacio VALUES ('Amposta', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Arboç', 'Tarragona');
INSERT INTO poblacio VALUES ('Arbolí', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Argentera', 'Tarragona');
INSERT INTO poblacio VALUES ('Arnes', 'Tarragona');
INSERT INTO poblacio VALUES ('Ascó', 'Tarragona');
INSERT INTO poblacio VALUES ('Banyeres del Penedès', 'Tarragona');
INSERT INTO poblacio VALUES ('Barberà de la Conca', 'Tarragona');
INSERT INTO poblacio VALUES ('Batea', 'Tarragona');
INSERT INTO poblacio VALUES ('Bellmunt del Priorat', 'Tarragona');
INSERT INTO poblacio VALUES ('Bellvei', 'Tarragona');
INSERT INTO poblacio VALUES ('Benifallet', 'Tarragona');
INSERT INTO poblacio VALUES ('Benissanet', 'Tarragona');
INSERT INTO poblacio VALUES ('La Bisbal de Falset', 'Tarragona');
INSERT INTO poblacio VALUES ('La Bisbal del Penedès', 'Tarragona');
INSERT INTO poblacio VALUES ('Blancafort', 'Tarragona');
INSERT INTO poblacio VALUES ('Bonastre', 'Tarragona');
INSERT INTO poblacio VALUES ('Les Borges del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Bot', 'Tarragona');
INSERT INTO poblacio VALUES ('Botarell', 'Tarragona');
INSERT INTO poblacio VALUES ('Bràfim', 'Tarragona');
INSERT INTO poblacio VALUES ('Cabacés', 'Tarragona');
INSERT INTO poblacio VALUES ('Cabra del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Calafell', 'Tarragona');
INSERT INTO poblacio VALUES ('Camarles', 'Tarragona');
INSERT INTO poblacio VALUES ('Cambrils', 'Tarragona');
INSERT INTO poblacio VALUES ('La Canonja', 'Tarragona');
INSERT INTO poblacio VALUES ('Capafonts', 'Tarragona');
INSERT INTO poblacio VALUES ('Capçanes', 'Tarragona');
INSERT INTO poblacio VALUES ('Caseres', 'Tarragona');
INSERT INTO poblacio VALUES ('Castellvell del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('El Catllar', 'Tarragona');
INSERT INTO poblacio VALUES ('Colldejou', 'Tarragona');
INSERT INTO poblacio VALUES ('Conesa', 'Tarragona');
INSERT INTO poblacio VALUES ('Constantí', 'Tarragona');
INSERT INTO poblacio VALUES ('Corbera d''Ebre', 'Tarragona');
INSERT INTO poblacio VALUES ('Cornudella de Montsant', 'Tarragona');
INSERT INTO poblacio VALUES ('Creixell', 'Tarragona');
INSERT INTO poblacio VALUES ('Cunit', 'Tarragona');
INSERT INTO poblacio VALUES ('Deltebre', 'Tarragona');
INSERT INTO poblacio VALUES ('Duesaigües', 'Tarragona');
INSERT INTO poblacio VALUES ('L'' Espluga de Francolí', 'Tarragona');
INSERT INTO poblacio VALUES ('Falset', 'Tarragona');
INSERT INTO poblacio VALUES ('La Fatarella', 'Tarragona');
INSERT INTO poblacio VALUES ('La Febró', 'Tarragona');
INSERT INTO poblacio VALUES ('La Figuera', 'Tarragona');
INSERT INTO poblacio VALUES ('Figuerola del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Flix', 'Tarragona');
INSERT INTO poblacio VALUES ('Forès', 'Tarragona');
INSERT INTO poblacio VALUES ('Freginals', 'Tarragona');
INSERT INTO poblacio VALUES ('La Galera', 'Tarragona');
INSERT INTO poblacio VALUES ('Gandesa', 'Tarragona');
INSERT INTO poblacio VALUES ('Garcia', 'Tarragona');
INSERT INTO poblacio VALUES ('Els Garidells', 'Tarragona');
INSERT INTO poblacio VALUES ('Ginestar', 'Tarragona');
INSERT INTO poblacio VALUES ('Godall', 'Tarragona');
INSERT INTO poblacio VALUES ('Gratallops', 'Tarragona');
INSERT INTO poblacio VALUES ('Els Guiamets', 'Tarragona');
INSERT INTO poblacio VALUES ('Horta de Sant Joan', 'Tarragona');
INSERT INTO poblacio VALUES ('El Lloar', 'Tarragona');
INSERT INTO poblacio VALUES ('Llorac', 'Tarragona');
INSERT INTO poblacio VALUES ('Llorenç del Penedès', 'Tarragona');
INSERT INTO poblacio VALUES ('Marçà', 'Tarragona');
INSERT INTO poblacio VALUES ('Margalef', 'Tarragona');
INSERT INTO poblacio VALUES ('Mas de Barberans', 'Tarragona');
INSERT INTO poblacio VALUES ('Masdenverge', 'Tarragona');
INSERT INTO poblacio VALUES ('Masllorenç', 'Tarragona');
INSERT INTO poblacio VALUES ('La Masó', 'Tarragona');
INSERT INTO poblacio VALUES ('Maspujols', 'Tarragona');
INSERT INTO poblacio VALUES ('El Masroig', 'Tarragona');
INSERT INTO poblacio VALUES ('El Milà', 'Tarragona');
INSERT INTO poblacio VALUES ('Miravet', 'Tarragona');
INSERT INTO poblacio VALUES ('El Molar', 'Tarragona');
INSERT INTO poblacio VALUES ('Montblanc', 'Tarragona');
INSERT INTO poblacio VALUES ('Montbrió del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Montferri', 'Tarragona');
INSERT INTO poblacio VALUES ('El Montmell', 'Tarragona');
INSERT INTO poblacio VALUES ('Mont-ral', 'Tarragona');
INSERT INTO poblacio VALUES ('Mont-roig del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Móra d''Ebre', 'Tarragona');
INSERT INTO poblacio VALUES ('Móra la Nova', 'Tarragona');
INSERT INTO poblacio VALUES ('El Morell', 'Tarragona');
INSERT INTO poblacio VALUES ('La Morera de Montsant', 'Tarragona');
INSERT INTO poblacio VALUES ('La Nou de Gaià', 'Tarragona');
INSERT INTO poblacio VALUES ('Nulles', 'Tarragona');
INSERT INTO poblacio VALUES ('Els Pallaresos', 'Tarragona');
INSERT INTO poblacio VALUES ('La Palma d''Ebre', 'Tarragona');
INSERT INTO poblacio VALUES ('Passanant i Belltall', 'Tarragona');
INSERT INTO poblacio VALUES ('Paüls', 'Tarragona');
INSERT INTO poblacio VALUES ('Perafort', 'Tarragona');
INSERT INTO poblacio VALUES ('El Perelló', 'Tarragona');
INSERT INTO poblacio VALUES ('Les Piles', 'Tarragona');
INSERT INTO poblacio VALUES ('El Pinell de Brai', 'Tarragona');
INSERT INTO poblacio VALUES ('Pira', 'Tarragona');
INSERT INTO poblacio VALUES ('El Pla de Santa Maria', 'Tarragona');
INSERT INTO poblacio VALUES ('La Pobla de Mafumet', 'Tarragona');
INSERT INTO poblacio VALUES ('La Pobla de Massaluca', 'Tarragona');
INSERT INTO poblacio VALUES ('La Pobla de Montornès', 'Tarragona');
INSERT INTO poblacio VALUES ('Poboleda', 'Tarragona');
INSERT INTO poblacio VALUES ('El Pont d''Armentera', 'Tarragona');
INSERT INTO poblacio VALUES ('Pontils', 'Tarragona');
INSERT INTO poblacio VALUES ('Porrera', 'Tarragona');
INSERT INTO poblacio VALUES ('Pradell de la Teixeta', 'Tarragona');
INSERT INTO poblacio VALUES ('Prades', 'Tarragona');
INSERT INTO poblacio VALUES ('Prat de Comte', 'Tarragona');
INSERT INTO poblacio VALUES ('Pratdip', 'Tarragona');
INSERT INTO poblacio VALUES ('Puigpelat', 'Tarragona');
INSERT INTO poblacio VALUES ('Querol', 'Tarragona');
INSERT INTO poblacio VALUES ('Rasquera', 'Tarragona');
INSERT INTO poblacio VALUES ('Renau', 'Tarragona');
INSERT INTO poblacio VALUES ('Reus', 'Tarragona');
INSERT INTO poblacio VALUES ('La Riba', 'Tarragona');
INSERT INTO poblacio VALUES ('Riba-roja d''Ebre', 'Tarragona');
INSERT INTO poblacio VALUES ('La Riera de Gaià', 'Tarragona');
INSERT INTO poblacio VALUES ('Riudecanyes', 'Tarragona');
INSERT INTO poblacio VALUES ('Riudecols', 'Tarragona');
INSERT INTO poblacio VALUES ('Riudoms', 'Tarragona');
INSERT INTO poblacio VALUES ('Rocafort de Queralt', 'Tarragona');
INSERT INTO poblacio VALUES ('Roda de Berà', 'Tarragona');
INSERT INTO poblacio VALUES ('Rodonyà', 'Tarragona');
INSERT INTO poblacio VALUES ('Roquetes', 'Tarragona');
INSERT INTO poblacio VALUES ('El Rourell', 'Tarragona');
INSERT INTO poblacio VALUES ('Salomó', 'Tarragona');
INSERT INTO poblacio VALUES ('Salou', 'Tarragona');
INSERT INTO poblacio VALUES ('Sant Carles de la Ràpita', 'Tarragona');
INSERT INTO poblacio VALUES ('Sant Jaume dels Domenys', 'Tarragona');
INSERT INTO poblacio VALUES ('Sant Jaume d''Enveja', 'Tarragona');
INSERT INTO poblacio VALUES ('Santa Bàrbara', 'Tarragona');
INSERT INTO poblacio VALUES ('Santa Coloma de Queralt', 'Tarragona');
INSERT INTO poblacio VALUES ('Santa Oliva', 'Tarragona');
INSERT INTO poblacio VALUES ('Sarral', 'Tarragona');
INSERT INTO poblacio VALUES ('Savallà del Comtat', 'Tarragona');
INSERT INTO poblacio VALUES ('La Secuita', 'Tarragona');
INSERT INTO poblacio VALUES ('La Selva del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Senan', 'Tarragona');
INSERT INTO poblacio VALUES ('La Sénia', 'Tarragona');
INSERT INTO poblacio VALUES ('Solivella', 'Tarragona');
INSERT INTO poblacio VALUES ('Tarragona', 'Tarragona');
INSERT INTO poblacio VALUES ('Tivenys', 'Tarragona');
INSERT INTO poblacio VALUES ('Tivissa', 'Tarragona');
INSERT INTO poblacio VALUES ('La Torre de Fontaubella', 'Tarragona');
INSERT INTO poblacio VALUES ('La Torre de l''Espanyol', 'Tarragona');
INSERT INTO poblacio VALUES ('Torredembarra', 'Tarragona');
INSERT INTO poblacio VALUES ('Torroja del Priorat', 'Tarragona');
INSERT INTO poblacio VALUES ('Tortosa', 'Tarragona');
INSERT INTO poblacio VALUES ('Ulldecona', 'Tarragona');
INSERT INTO poblacio VALUES ('Ulldemolins', 'Tarragona');
INSERT INTO poblacio VALUES ('Vallclara', 'Tarragona');
INSERT INTO poblacio VALUES ('Vallfogona de Riucorb', 'Tarragona');
INSERT INTO poblacio VALUES ('Vallmoll', 'Tarragona');
INSERT INTO poblacio VALUES ('Valls', 'Tarragona');
INSERT INTO poblacio VALUES ('Vandellòs i l''Hospitalet de l''Infant', 'Tarragona');
INSERT INTO poblacio VALUES ('El Vendrell', 'Tarragona');
INSERT INTO poblacio VALUES ('Vespella de Gaià', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilabella', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilalba dels Arcs', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilallonga del Camp', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilanova de Prades', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilanova d''Escornalbou', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilaplana', 'Tarragona');
INSERT INTO poblacio VALUES ('Vila-rodona', 'Tarragona');
INSERT INTO poblacio VALUES ('Vila-seca', 'Tarragona');
INSERT INTO poblacio VALUES ('Vilaverd', 'Tarragona');
INSERT INTO poblacio VALUES ('La Vilella Alta', 'Tarragona');
INSERT INTO poblacio VALUES ('La Vilella Baixa', 'Tarragona');
INSERT INTO poblacio VALUES ('Vimbodí i Poblet', 'Tarragona');
INSERT INTO poblacio VALUES ('Vinebre', 'Tarragona');
INSERT INTO poblacio VALUES ('Vinyols i els Arcs', 'Tarragona');
INSERT INTO poblacio VALUES ('Xerta', 'Tarragona');

--COMMIT;

-- -----------------------------------------------------
-- Data for table `aparcaments`.`TIPUS_USUARI`
-- -----------------------------------------------------
--START TRANSACTION;
INSERT INTO tipus_usuari VALUES ('Root');
INSERT INTO tipus_usuari VALUES ('Admin');
INSERT INTO tipus_usuari VALUES ('Usuari');

--COMMIT;

-- -----------------------------------------------------
-- Data for table `aparcaments`.`USUARI`
-- -----------------------------------------------------
--START TRANSACTION;

INSERT INTO usuari VALUES ('46942299N', 'Miquel Angel', 'Vélez', 'Serrano', 'C/Afores, 27, 3r', 'Ripollet', '08291', 626125872, 'mvelezserrano@outlook.es', 'iocmvelez', '1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2', 'Usuari', '1111-2222-3333-4444-10/2020-333', '1111AAA');
INSERT INTO usuari VALUES ('22222222V', 'Moisés', 'Escusa', 'Yustes', 'C/Desconegut', 'Barcelona', '08080', 637822195, 'moiescusa@gmail.com', 'iocmescusa', '1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2', 'Admin', '5555-6666-7777-8888-10/2020-333', '2222BBB');
INSERT INTO usuari VALUES ('33333333T', 'Rafael', 'Mateo', 'Boloix', 'C/Desconegut', 'Barcelona', '08080', 669106278, 'rafamateo@gmail.com', 'iocrmateo', '1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2', 'Usuari', '9999-0000-1111-2222-10/2020-333', '3333CCC');

--COMMIT;


-- -----------------------------------------------------
-- Data for table `aparcaments`.`ZONA`
-- -----------------------------------------------------
--START TRANSACTION;

INSERT INTO zona (nom) VALUES ('Ciutat Vella');
INSERT INTO zona (nom) VALUES ('Eixample');
INSERT INTO zona (nom) VALUES ('Gràcia');
INSERT INTO zona (nom) VALUES ('Horta - Guinardó');
INSERT INTO zona (nom) VALUES ('Les Corts');
INSERT INTO zona (nom) VALUES ('Nou Barris');
INSERT INTO zona (nom) VALUES ('Sant Andreu');
INSERT INTO zona (nom) VALUES ('Sant Martí');
INSERT INTO zona (nom) VALUES ('Sants - Montjuïc');
INSERT INTO zona (nom) VALUES ('Sarrià - St. Gervasi');

--COMMIT;


-- -----------------------------------------------------
-- Data for table `aparcaments`.`aparcament`
-- -----------------------------------------------------
--START TRANSACTION;

INSERT INTO aparcament (nom, direccio, telefon, email, admin, zona, latitude, longitude) VALUES ('Plafer Mallorca', 'C/Mallorca, 221', 934535384, 'aparcament1@aparcament.es', '22222222V', 'Eixample', 41.391770, 2.158931);
INSERT INTO aparcament (nom, direccio, telefon, email, admin, zona, latitude, longitude) VALUES ('BSM Marina - Port', 'C/Marina, 13', 932222222, 'aparcament2@aparcament.es', '22222222V', 'Ciutat Vella', 41.387914, 2.197427);
INSERT INTO aparcament (nom, direccio, telefon, email, admin, zona, latitude, longitude) VALUES ('Pàrking Parc Sanitari', 'C/Josefa Rosich s/n', 933333333, 'aparcament3@aparcament.es', '22222222V', 'Horta - Guinardó', 41.417384, 2.138461);

--COMMIT;


-- -----------------------------------------------------
-- Data for table `aparcaments`.`TIPUS_PLACA`
-- -----------------------------------------------------
--START TRANSACTION;

INSERT INTO tipus_placa VALUES ('Normal');
INSERT INTO tipus_placa VALUES ('Petita');
INSERT INTO tipus_placa VALUES ('Minusvalids');

--COMMIT;


-- -----------------------------------------------------
-- Data for table `aparcaments`.`PLACA`
-- -----------------------------------------------------
--START TRANSACTION;

INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (1, 0, 1, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (1, 0, 2, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (1, 1, 1, 'Petita', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (1, 1, 2, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (1, 2, 1, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (1, 2, 2, 'Minusvalids', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (2, 0, 1, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (2, 0, 2, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (2, 1, 1, 'Petita', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (2, 1, 2, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (2, 2, 1, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (2, 2, 2, 'Minusvalids', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (3, 0, 1, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (3, 0, 2, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (3, 1, 1, 'Petita', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (3, 1, 2, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (3, 2, 1, 'Normal', '1');
INSERT INTO placa (idaparcament, planta, numero, tipusplaca, activa) VALUES (3, 2, 2, 'Minusvalids', '1');


CREATE OR REPLACE VIEW v_user_role AS 
 SELECT u.nomusuari AS username,
    u.password,
    u.tipususuari AS group_name
   FROM usuari u;

COMMIT;




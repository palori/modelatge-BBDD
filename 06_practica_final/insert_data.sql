### INSERT data ###
INSERT INTO optica.adress (carrer, numero) #id_adress is AI
VALUES ("Carrer1", 1), #prov1
	   ("Carrer2", 2), #prov2
       ("Carrer3", 3), #prov3
       ("Carrer4", 4), #cli1
       ("Carrer5", 5); #cli2

#INSERT INTO optica.proveidors (nom, telefon, fax, nif, ADRESS_id_adress, MARQUES_nom_marca)
#VALUES ("Prov1", "930000001", "970000001", "B0001", 1, "Marca1"),
#	   ("Prov2", "930000002", "970000002", "B0002", 2, "Marca2"),
#       ("Prov3", "930000003", "970000003", "B0003", 3, "Marca3");
       
#INSERT INTO optica.marques (nom_marca)
#VALUES ("Marca1"),
#	   ("Marca2"),
#       ("Marca3");
       
#INSERT INTO optica.clients (nom, telefon, email, ADRESS_id_adress, CLIENTS_email) # no ve recomanat per ningu
#VALUES ("Cli1", "920000001", "cli1@gmail.com", 4, "no@recomanat.no");
#INSERT INTO optica.clients (nom, telefon, email, ADRESS_id_adress, CLIENTS_email) # recomanat pel client 1
#VALUES ("Cli2", "920000002", "cli2@gmail.com", 5, "cli1@gmail.com");

#INSERT INTO optica.ulleres (MARQUES_nom_marca, graduacio_ull_dret, graduacio_ull_esquerre, tipus_muntura, color_muntura, color_vidre_dret, color_vidre_esquerre, preu, CLIENTS_email)
#VALUES ("Marca1", "miop=3, estig=1.75", "miop=2.5, estig=1.75", "flotant", "transparent", "transparent", 149.90, "cli1@gmail.com"),
#	   ("Marca2", "miop=3.5", "miop=4.75", "pasta", "fosc i polaritzat", "fosc i polaritzat", 123.45, "cli2@gmail.com");

INSERT INTO optica.empleats (ULLERES_id_ullera)
VALUES (1),
	   (2);

### SELECT data ###
SELECT * FROM optica.adress;
SELECT * FROM optica.proveidors;
SELECT * FROM optica.marques;
SELECT * FROM optica.clients;
SELECT * FROM optica.ulleres;
SELECT * FROM optica.empleats;

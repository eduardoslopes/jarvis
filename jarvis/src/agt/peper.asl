// Agent peper in project jarvis

/* Initial beliefs and rules */

/* Initial goals */

/* Plans */

+!tony_jantar(Carne, Cebola, Macarrao, Molho, Refrigerante):true <-
	.send("tony", achieve, jantar(Carne, Cebola, Macarrao, Molho, Refrigerante)).
	
+!cozinhar(Confirmacao):Confirmacao == true <- 
	.print("Farei o jantar para você, Tony.").
	
+!cozinhar(Confirmacao):Confirmacao == false <- 
	.print("Ok, não farei o jantar, Tony.").

+hora_jantar: true <- 
	.send("jarvis", achieve, verificar_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante));
	!tony_jantar(Carne, Cebola, Macarrao, Molho, Refrigerante).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

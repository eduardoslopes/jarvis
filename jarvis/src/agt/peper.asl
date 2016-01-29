// Agent peper in project jarvis

/* Initial beliefs and rules */

/* Initial goals */
!criar_fogao.

/* Plans */

+!posicionar.
+!desposicionar.

+!criar_fogao : true <-
	makeArtifact("fogao", "jarvis.Fogao", [], IDArtifact);
	focus(IDArtifact).

+!tony_jantar(Carne, Cebola, Macarrao, Molho, Refrigerante):true <-
	.send("tony", achieve, jantar(Carne, Cebola, Macarrao, Molho, Refrigerante));
	.print("Quer jantar, Tony?").
	
+!cozinhar(Confirmacao) : Confirmacao == true <- 
	.send("jarvis", achieve, jantar_positivo);
	.print("Farei o jantar para voce, Tony.");
	colocar_no_fogo.
	
+!cozinhar(Confirmacao) : Confirmacao == false <- 
	.print("Ok, nao farei o jantar, Tony.").

+!hora_jantar : true <- 
	.send("jarvis", achieve, verificar_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante)).
	
+tem_na_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante) : true <-
	!tony_jantar(Carne, Cebola, Macarrao, Molho, Refrigerante).

+comida_pronta : true <-
	.print("Comida está pronta").


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

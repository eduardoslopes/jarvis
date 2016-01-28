// Agent esbagacador_armaduras in project jarvis

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+!julgar_armadura(Nome, Coord) : true 
	<- .print("Julgando ", Nome);
	!destruir_armadura(Nome, Coord) . 

+!destruir_armadura(Nome, Coord) : Coord > 2 & Coord < 5
	<- .print("Destruindo ", Nome);
	.send(jarvis, achieve, destruido(Nome));
	.kill_agent(Nome).
	
+!destruir_armadura(Nome, Coord) : Coord <= 2 | Coord >= 5
	<- .print( Nome, " Está salva!" ).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

// Agent tony in project jarvis

/* Initial beliefs and rules */

ir_reuniao(N).
aviso_perigo(Coord).
ir_reuniao(Horario).

/* Initial goals */


/* Plans */

+!posicionar.

+!desposicionar.

+ir_reuniao(Horario) : Horario >= 10 
	<- .print("Jarvis, confirme minha presença na reuniao").
	
+aviso_perigo(Coord): Coord > 1 & Coord < 5 
	<- .print("Jarvis, envie armaduras para coordenada ", Coord).
	
+aviso_perigo(Coord): Coord < 2 | Coord >= 5 
	<- .print("Jarvis, Nao me importo com este lugar! ", Coord).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

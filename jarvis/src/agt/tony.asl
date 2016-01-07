// Agent tony in project jarvis

/* Initial beliefs and rules */
ir_reuniao(Horario).

/* Initial goals */


/* Plans */

+ir_reuniao(Horario) : Horario >= 10 
	<- .print("Jarvis, confirme minha presença na reuniao").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

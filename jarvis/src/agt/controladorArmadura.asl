// Agent controladorArmadura in project jarvis

/* Initial beliefs and rules */
noite(N).
/* Initial goals */

/* Plans */

+noite(N) : N == "yes" 
	<- .print("Assumindo posicao").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

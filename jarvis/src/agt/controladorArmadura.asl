// Agent controladorArmadura in project jarvis

/* Initial beliefs and rules */
noite(N).
/* Initial goals */

/* Plans */

+noite(yes) : true
	<- .print("Assumindo posicao").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

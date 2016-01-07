// Agent controladorArmadura in project jarvis

/* Initial beliefs and rules */
posicionado.
desposicionado.
/* Initial goals */

/* Plans */

+posicionar : desposicionado
	<- .print("Assumindo posicao noturna");
	-desposicionado.

+desposicionar : posicionado
	<- .print("Fora da posicao noturna");
	-posicionado.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

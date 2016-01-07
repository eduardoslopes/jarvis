// Agent controladorArmadura in project jarvis

/* Initial beliefs and rules */

desposicionado.

/* Initial goals */

/* Plans */
	
+!posicionar : desposicionado
	<- .print("Assumindo posicao noturna");
	-desposicionado;
	+posicionado.

+!desposicionar : posicionado
	<- .print("Fora da posicao noturna");
	-posicionado;
	+desposicionado.

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

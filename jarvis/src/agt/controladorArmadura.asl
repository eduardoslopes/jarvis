// Agent controladorArmadura in project jarvis

/* Initial beliefs and rules */
posicionado("false").
/* Initial goals */

/* Plans */

+posicionar(A) : A == "true" & posicionado("false")
	<- .print("Assumindo posicao noturna");
	-+posicionado("true").

+posicionar(A) : A == "false" & posicionado("true")
	<- .print("Fora da posicao noturna");
	-+posicionado("false").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

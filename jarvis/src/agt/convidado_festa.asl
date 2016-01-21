// Agent convidado_festa in project jarvis

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

//
//+!convidado_festa(dia(N), Hora) : true <-
//	.send("jarvis",achieve, nao_irei).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

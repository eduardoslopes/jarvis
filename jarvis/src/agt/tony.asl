// Agent tony in project jarvis

/* Initial beliefs and rules */
ir_reuniao(N).

/* Initial goals */


/* Plans */
+ir_reuniao(N) : N >= 10 <- .print("Irei a reuniao").

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

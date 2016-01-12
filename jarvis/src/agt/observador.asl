// Agent observador in project jarvis

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+oblUnfulfilled(obligation(Ag,_,achieved(Sch,_,Ag),_ ) )[artifact_id(AId)] 
   <- .print("Armadura ",Ag," não fez o que foi ordenado!").
   //Implementar o sistema de reputação.

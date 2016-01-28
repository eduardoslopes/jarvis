// Agent observador in project jarvis
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }

/* Initial beliefs and rules */

badGuys[N].
goodGuys[M].

/* Initial goals */

/* Plans */

+oblUnfulfilled(obligation(Ag,_,achieved(Sch,_,Ag),_ ) )[artifact_id(AId)] 
   <- .print("Agente ",Ag," não fez o que foi ordenado!");
   	  +badGuys[Ag];
   	  .kill_agent(Ag).
   		
+oblFulfilled(obligation(Ag,_,achieved(Sch,_,Ag),_ ) )[artifact_id(AId)] 
   <- 	.print("Agente ",Ag," fez corretamente o que lhe foi ordenado!");
		+goodGuys[Ag].
		
+!tem_armadura : true .
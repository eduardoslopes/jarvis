// Agent ajudante in project jarvis

/* Initial beliefs and rules */

/* Initial goals */

+!criar_armadura(Nome): true
	<- .print("Criando ", Nome);
	.create_agent(Nome ,"controladorArmadura.asl").
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

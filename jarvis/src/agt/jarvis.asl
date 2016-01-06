// Agent jarvis in project jarvis

/* Initial beliefs and rules */

/* Initial goals */

!criar_relogio.

/* Plans */

+!criar_relogio : true <-
	makeArtifact("relogio", "jarvis.Relogio", [], IDArtifact);
	focus(IDArtifact);
	startRelogio.

+reuniao : true <-
	.print("Tony, foi marcada uma reunião para amanhã às 10h");
	.send(tony, tell, ir_reuniao(10)).

+dobrar_seguranca : true <-
	.print("Dobrando segurança noturna");	
	.send(controladorArmadura, tell, noite(yes)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

// Agent jarvis in project jarvis

/* Initial beliefs and rules */
protecao_noturna_ativada("no").

/* Initial goals */
!criar_relogio.

/* Plans */

+!criar_relogio : true <-
	makeArtifact("relogio", "jarvis.Relogio", [], IDArtifact);
	focus(IDArtifact);
	startRelogio.

+tic : true <-
	protecaoNoturna.

+reuniao : true <-
	.print("Tony, foi marcada uma reunião para amanhã às 10h");
	.send(tony, tell, ir_reuniao(10)).

+dobrar_seguranca : protecao_noturna_ativada("no") <-
	.print("Dobrando segurança noturna");
	.send(controladorArmadura1, tell, posicionar);
	.send(controladorArmadura2, tell, posicionar);
	-+protecao_noturna_ativada("yes").
	
+desativar_seguranca_noturna : protecao_noturna_ativada("yes") <-
	.print("Desativando protecao noturna");
	.send(controladorArmadura1, tell, desposicionar);
	.send(controladorArmadura2, tell, desposicionar);
	-+protecao_noturna_ativada("no").
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

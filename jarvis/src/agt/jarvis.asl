// Agent jarvis in project jarvis

/* Initial beliefs and rules */
protecao_noturna_ativada("no").

/* Initial goals */
!criar_relogio.
!buscar_noticias.

/* Plans */

+!criar_relogio : true <-
	makeArtifact("relogio", "jarvis.Relogio", [], IDArtifact);
	focus(IDArtifact);
	startRelogio.
	
+!buscar_noticias: true <-
	makeArtifact("internet", "jarvis.Internet", [], IDArtifact);
	focus(IDArtifact);
	buscar_noticias.
	
+!avisar_local(Coord): Coord > 1 & Coord < 6 
	<- .print("Tony, existe perigo em ", Coord);
	.send(tony, tell, aviso_perigo(Coord)).
	
+!avisar_local(Coord): Coord < 2 | Coord >= 6 
	<- .print("Tony, existe perigo em ", Coord);
	.send(tony, tell, aviso_perigo(Coord)).

+tic : true <-
	protecaoNoturna.

+reuniao : true <-
	.print("Tony, foi marcada uma reunião para amanhã às 10h");
	.send(tony, tell, ir_reuniao(10)).

+dobrar_seguranca : protecao_noturna_ativada("no") <-
	.print("Dobrando segurança noturna");
	.send(controladorArmadura1, achieve, posicionar);
	.send(controladorArmadura2, achieve, posicionar);
	-+protecao_noturna_ativada("yes").
	
+desativar_seguranca_noturna : protecao_noturna_ativada("yes") <-
	.print("Desativando protecao noturna");
	.send(controladorArmadura1, achieve, desposicionar);
	.send(controladorArmadura2, achieve, desposicionar);
	-+protecao_noturna_ativada("no").
	
+nova_noticia(Noticia, Lugar) : true <-
	makeArtifact("gps", "jarvis.GPS", [], IDArtifact);
	focus(IDArtifact);
	busca_coordenada_local(Lugar, Coordenada);
	!avisar_local(Coordenada).
	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

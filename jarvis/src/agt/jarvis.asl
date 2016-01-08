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
	.print("Tony, foi marcada uma reunião para amanhã às 8h com Willian");
	.send(tony, achieve, ir_reuniao(8, "Willian"));
	.print("Tony, foi marcada uma reunião para amanhã às 10h com Pepper");
	.send(tony, achieve, ir_reuniao(10, "Pepper")).
	

+dobrar_seguranca : protecao_noturna_ativada("no") <-
	.print("Dobrando segurança noturna");
	.broadcast(achieve, posicionar);
	-+protecao_noturna_ativada("yes").
	
+desativar_seguranca_noturna : protecao_noturna_ativada("yes") <-
	.print("Desativando protecao noturna");
	.broadcast(achieve, desposicionar);
	-+protecao_noturna_ativada("no").
	
+nova_noticia(Noticia, Lugar) : true <-
	makeArtifact("gps", "jarvis.GPS", [], IDArtifact);
	focus(IDArtifact);
	busca_coordenada_local(Lugar, Coordenada);
	!avisar_local(Coordenada);
	-nova_noticia(Noticia, Lugar).
	

	
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

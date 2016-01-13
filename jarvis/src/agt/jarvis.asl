// Agent jarvis in project jarvis

/* Initial beliefs and rules */
protecao_noturna_ativada("no").

/* Initial goals */
!criar_relogio.
//!buscar_noticias.
!criar_agenda.
//!criar_gps.

/* Plans */

+!defender_ponto_interesse. 

+!criar_relogio : true <-
	makeArtifact("relogio", "jarvis.Relogio", [], IDArtifact);
	focus(IDArtifact);
	startRelogio.

+!criar_gps : true <-
	makeArtifact("gps", "jarvis.GPS", [], IDArtifact);
	focus(IDArtifact).
	
+!buscar_noticias: true <-
	makeArtifact("internet", "jarvis.Internet", [], IDArtifact);
	focus(IDArtifact);
	buscar_noticias.
	
+!criar_agenda : true <-
	makeArtifact("agenda", "jarvis.Agenda", [], IDArtifact);
	focus(IDArtifact).

+!avisar_local(Coord): Coord > 1 & Coord < 6 
	<- .print("Tony, existe perigo em ", Coord);
	.send(tony, tell, aviso_perigo(Coord)).
	
+!avisar_local(Coord): Coord < 2 | Coord >= 6 
	<- .print("Tony, existe perigo em ", Coord);
	.send(tony, tell, aviso_perigo(Coord)).
	
+!marcar_reuniao(Horario, Pessoa) : true
	<- .print("Confirmando reuniao para às ", Horario, "h com ", Pessoa);
	marcar_reuniao_agenda(Horario, Pessoa).
	
+!dia_a_dia.

+tic : true <-
	protecaoNoturna.

+reuniao(Horario, Pessoa) : true <-
	.print("Tony, foi marcada uma reunião para às ", Horario, "h com ", Pessoa);
	.send(tony, achieve, ir_reuniao(Horario, Pessoa)).

+dobrar_seguranca : protecao_noturna_ativada("no") <-
	.print("Dobrando segurança noturna");
	.broadcast(achieve, posicionar);
	-+protecao_noturna_ativada("yes").
	
+desativar_seguranca_noturna : protecao_noturna_ativada("yes") <-
	.print("Desativando protecao noturna");
	.broadcast(achieve, desposicionar);
	-+protecao_noturna_ativada("no").
	
+nova_noticia(Noticia, Lugar) : true <-
	busca_coordenada_local(Lugar, Coordenada);
	!avisar_local(Coordenada);
	-nova_noticia(Noticia, Lugar).
		
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

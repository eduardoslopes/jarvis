// Agent jarvis in project jarvis

/* Initial beliefs and rules */

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

+reuniao : true <-
	.print("Tony, foi marcada uma reunião para amanhã às 10h");
	.send(tony, tell, ir_reuniao(10)).

+dobrar_seguranca : true <-
	.print("Dobrando segurança noturna");
	.send(controladorArmadura1, tell, noite("yes"));
	.send(controladorArmadura2, tell, noite("yes"));	
	.send(controladorArmadura3, tell, noite("yes"));
	.send(controladorArmadura4, tell, noite("yes"));
	.send(controladorArmadura5, tell, noite("yes"));
	.send(controladorArmadura6, tell, noite("yes"));
	.send(controladorArmadura7, tell, noite("yes"));
	.send(controladorArmadura8, tell, noite("yes"));
	.send(controladorArmadura9, tell, noite("yes"));
	.send(controladorArmadura10, tell, noite("yes")).
	
+nova_noticia(Noticia, Lugar) : true <-
	makeArtifact("gps", "jarvis.GPS", [], IDArtifact);
	focus(IDArtifact);
	busca_coordenada_local(Lugar, Coordenada);
	!avisar_local(Coordenada).
	
	

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

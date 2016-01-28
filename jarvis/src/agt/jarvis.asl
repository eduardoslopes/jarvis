// Agent jarvis in project jarvis

/* Initial beliefs and rules */
protecao_noturna_ativada("no").
houve_jantar(false).
tony_acordado(true).

aviso_tony_estudar(false).

aviso_tony_academia(false).
	
aviso_tony_parque(false).

aviso_tony_mecanica(false).
	
aviso_tony_ler(false).

/* Initial goals */
!criar_relogio.
!criar_agenda.
!criar_geladeira.
!criar_garagem.
/* Plans */

+!defender_ponto_interesse. 

+!criar_relogio : true <-
	makeArtifact("relogio", "jarvis.Relogio", [], IDArtifact);
	focus(IDArtifact);
	startRelogio;
	.send(tony, tell, relogio(IDArtifact)).

+!criar_garagem : true <-
	makeArtifact("garagem", "objects.Garagem", [], IDArtifact);
	focus(IDArtifact);
	colocarCarros.

+!criar_geladeira : true <-
	makeArtifact("geladeira", "jarvis.Geladeira", [], IDArtifact);
	focus(IDArtifact).


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

//+!avisar_local(Coord) : tony_acordado(false) <-
//	.send(tony, tell, acordar).
	
+!marcar_reuniao(Horario, Pessoa) : true
	<- .print("Confirmando reuniao para às ", Horario, "h com ", Pessoa);
	marcar_reuniao_agenda(Horario, Pessoa).	

+!verificar_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante): true <-
	ingredientes_na_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante);
	.send(peper, tell, tem_na_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante)).
	
// O jantar foi confirmado
+!jantar_positivo : true <-
	-+houve_jantar(true).

// Sinal enviado pelo tony para avisar que vai dormir
+!dormi : true <-
	+tony_acordado(false).	

// Sinal enviado pelo tony para avisar que acordou
+!acordei : true <-
	+tony_acordado(true).
	
+!reuniao(Horario, Pessoa) : tony_acordado(true) <- 
	.print("Tony, foi marcada uma reunião para às ", Horario, "h com ", Pessoa);
	.send(tony, achieve, ir_reuniao(Horario, Pessoa)).
	
+!reuniao(Horario, Pessoa) : tony_acordado(false) <-
	.send(tony, tell, acordar);
	!reuniao(Horario, Pessoa).

+!escolher_carro : true 
<- .print("Ok tony, irei preparar um carro para o senhor prontamente!");
	.wait(1000);
	escolherUmCarro(Carro);
	.print("Tony, o seu ", Carro, " est� pronto!");
	.send(tony, tell, carro(Carro)).
	

+hora_jantar : houve_jantar(false) <-
	.send(peper, achieve, hora_jantar).

+tic : true <-
	habitosTony;
	protecaoNoturna.

+reuniao(Horario, Pessoa) : true <- !reuniao(Horario, Pessoa). 

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

+tony_estudar : aviso_tony_estudar(false) <-
	.print("Tony, está na sua hora de estudar robótica");
	-+aviso_tony_estudar(true);
	.send(tony,achieve, estudar_robotica).

+tony_academia : aviso_tony_academia(false) <-
	.print("Tony, vai malhar agora?");
	-+aviso_tony_academia(true);
	.send(tony,achieve, ir_academia).
	
+tony_parque : aviso_tony_parque(false) <-
	.print("Tony, já separei seus sapatos. Está na hora.");
	-+aviso_tony_parque(true);
	.send(tony,achieve, passear_parque).

+tony_mecanica : aviso_tony_mecanica(false) <-
	.print("Tony, as armaduras clamam por manutenção");
	-+aviso_tony_mecanica(true);
	.send(tony,achieve, manter_armaduras).
	
+tony_ler : aviso_tony_ler(false) <-
	.print("Tony, hora da leitura.");
	-+aviso_tony_ler(true);
	.send(tony,achieve, ler_livro).
		
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

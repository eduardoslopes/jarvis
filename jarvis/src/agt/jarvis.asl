// Agent jarvis in project jarvis

/* Initial beliefs and rules */
protecao_noturna_ativada("no").
houve_jantar(false).
tony_acordado(true).

/* Initial goals */
!criar_relogio.
!criar_agenda.
!criar_geladeira.
!criar_garagem.
!criar_arsenal.
!criar_arcondicionado.
/* Plans */

+!criar_arcondicionado : true
<- 	makeArtifact("arCondicionado", "objects.ArCondicionado", [1], IDArtifact);
	focus(IDArtifact);
	definirTemperatura(12,Temp);
	.print("Ar-condicionado ligado!");
	.print("Temperatura ambiente: ", Temp, " graus!");
	.send(tony, achieve, arCondicionado(12)).


+!modificarTemperatura(A, B) : true
<- 	modificarTemperatura(A, B, TempValor);
	.send(tony, achieve, arCondicionado(TempValor));
	.print("Tony, a temperatura foi alterada para ", TempValor, " graus!").

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
	
+!criar_arsenal : true 
	<- makeArtifact("arsenal", "jarvis.ArsenalArmaduras", [], IDArtifact);
	focus(IDArtifact);
	.broadcast(achieve, tem_armadura).

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
	
+!adiciona(NomeArmadura): true
	<- inserirNoArsenal(NomeArmadura).
	
+!enviar_armaduras(Coord): true
	<- selecionaArmaduras(Coord).

+!destruido(Nome): true
	<- percaNoArsenal(Nome).

+invoca(Arm, Coord): true 
	<- .print("Invocando Armadura ", Arm);
	 .send(Arm, achieve, ir_para(Coord));
	 .send(esbagacador_armaduras, achieve, julgar_armadura(Arm, Coord)).

+hora_jantar : houve_jantar(false) <-
	.send(peper, achieve, hora_jantar).

+tic : true <-
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
	
+criar_armadura(Nome): true
	<- .send(ajudante, achieve, criar_armadura(Nome)).
	

+acordar : true & tony_acordado(false)
<- .send(tony, achieve, ficar_acordado).
	//-+tony_acordado(true).

+dormir : true & tony_acordado(true)
<- .send(tony, achieve, ir_dormir).
	//-+tony_acordado(false).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

{ include("$jacamoJar/templates/org-obedient.asl") }
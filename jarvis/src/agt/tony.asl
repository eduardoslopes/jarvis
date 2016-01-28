// Agent tony in project jarvis

/* Initial beliefs and rules */

aviso_perigo(Coord).
carro(Carro).
relogio(IDArtifact).
ocupado(false).
//acordado(1).

/* Initial goals */

/* Plans */

+!estudar_robotica : ocupado(true) <-
	.print("Depois eu estudo. Estou ocupado!").
	
+!ir_academia : ocupado(true) <-
	.print("Não tenho como malhar agora").
	
+!passear_parque : ocupado(true) <-
	.print("Cooper? Só amanhã Jarvis").

+!manter_armaduras : ocupado(true) <-
	.print("As armaduras vão ter que esperar!").

+!ler_livro : ocupado(true) <-
	.print("Vou ter que deixar o livro para depois!").

+!estudar_robotica : ocupado(false) <-
	+ocupado(true);
	.wait(30000000);
	.print("Se aprofundando em robótica");
	+ocupado(false).
	
+!ir_academia : ocupado(false) <-
	+ocupado(true);
	.wait(30000000);
	.print("Malhando");
	+ocupado(false).
	
+!passear_parque : ocupado(false) <-
	+ocupado(true);
	.wait(30000000);
	.print("Hora do Cooper");
	+ocupado(false).
	

+!manter_armaduras : ocupado(false) <-
	+ocupado(true);
	.wait(30000000);
	.print("Realizando a manutenção das armaduras");
	+ocupado(false).
	

+!ler_livro : ocupado(false) <-
	+ocupado(true);
	.wait(30000000);
	.print("Lendo um livro");
	+ocupado(false).


+!posicionar.

+!desposicionar.

+relogio(IDArtifact) : true
<-lookupArtifact(IDArtifact).

+carro(Carro) : true
<- .print("Obrigado por ter me providenciado o meu ", Carro, " Jarvis!").

+!ir_reuniao(Horario, Pessoa) : Horario >= 10 & Horario <= 18
	<- .print("Jarvis, confirme minha presença na reuniao com ", Pessoa);
	+reunir(Horario);
	.send(jarvis, achieve, marcar_reuniao(Horario, Pessoa));
		!escolherVeiculo(Horario, Pessoa).

+!ir_reuniao(Horario, Pessoa) : Horario < 10 | Horario > 18 
	<- .print("Jarvis, nao irei a essa reuniao com ", Pessoa);
	+nao_marcar_reuniao(Horario, Pessoa);
	.send(jarvis, tell, nao_marcar_reuniao(Horario, Pessoa)).


//Novo plano para colocar um ve�culo para o Tony se locomover para suas reuni�es
+!escolherVeiculo(Horario, Pessoa) : true 
<- 	
	.print("Jarvis, por favor prepare um carro para a minha reuni�o com ", Pessoa, " as ", Horario);
	.send(jarvis, achieve, escolher_carro).


+!jantar(Carne, Cebola, Macarrao, Molho, Refrigerante): ocupado(false) & Macarrao == true & Molho == true <-
	.send(peper, achieve, cozinhar(true));
	+ocupado(true);
	.print("Adoraria jantar com voce, Pepper").

+!jantar(Carne, Cebola, Macarrao, Molho, Refrigerante): Macarrao == false | Molho == false <-
	.send(peper, achieve, cozinhar(false));
	.print("Hoje nao, Pepper. Estou com dor de cabeca...").
	
//
//+!convidar_festa : true <-
//	.send("jarvis", achieve, convidar_festa).
	

	
+dormir : true <-
	.print("Preciso dormir bem. Ser o homem de ferro n�o � f�cil");
	+ocupado(true);
	.send(jarvis, achieve, dormi).
	
+acordar : true <-
	.print("Ok, estou acordado");
	+ocupado(false);
	.send(jarvis, achieve, acordei).
	
+aviso_perigo(Coord): Coord > 1 & Coord < 5 
	<- .print("Jarvis, envie armaduras para coordenada ", Coord).
	
+aviso_perigo(Coord): Coord < 2 | Coord >= 5 
	<- .print("Jarvis, Nao me importo com este lugar! ", Coord).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

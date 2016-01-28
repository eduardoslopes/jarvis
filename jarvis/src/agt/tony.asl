// Agent tony in project jarvis

/* Initial beliefs and rules */

aviso_perigo(Coord).
carro(Carro).
//relogio(IDArtifact).
//acordado(1).

/* Initial goals */

/* Plans */

+!posicionar.

+!desposicionar.

+!encontrarRelogio : true
<- lookupArtifact("relogio", ID).


+!arCondicionado(A) : A >= 20 | A <= 15
 <- .send(jarvis, achieve, modificarTemperatura(16, 20));
 	.print("Jarvis, esta temperatura n�o me agrada, por favor modifique-a!"). 

+!arCondicionado(A) : A <= 20 | A >= 15
 <- .print("Jarvis, esta temperatura me agrada, obrigado!"). 


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


+!jantar(Carne, Cebola, Macarrao, Molho, Refrigerante): Macarrao == true & Molho == true <-
	.send(peper, achieve, cozinhar(true));
	.print("Adoraria jantar com voce, Pepper").

+!jantar(Carne, Cebola, Macarrao, Molho, Refrigerante): Macarrao == false | Molho == false <-
	.send(peper, achieve, cozinhar(false));
	.print("Hoje nao, Pepper. Estou com dor de cabeca...").
	
//
//+!convidar_festa : true <-
//	.send("jarvis", achieve, convidar_festa).
	
+!ir_dormir : true
<- .print("Obrigado por me informar o hor�rio Jarvis, estou indo dormir agora, at� amanh�!");
	.send(jarvis, tell, tony_acordado(false)).

+!ficar_acordado : true
<- 	.print("Hm.. que belo dia para destruir algo :D");
	.send(jarvis, tell, tony_acordado(true)).
	
	
+aviso_perigo(Coord): Coord > 1 & Coord < 5 
	<- .print("Jarvis, envie armaduras para coordenada ", Coord);
	.send(jarvis, achieve, enviar_armaduras(Coord)).
	
+aviso_perigo(Coord): Coord < 2 | Coord >= 5 
	<- .print("Jarvis, Nao me importo com ", Coord).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

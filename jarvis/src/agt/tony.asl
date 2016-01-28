// Agent tony in project jarvis

/* Initial beliefs and rules */

aviso_perigo(Coord).
carro(Carro).
acordado(true).

/* Initial goals */

/* Plans */

+!posicionar.

+!desposicionar.

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
	
+dormir : acordado(true) <-
	.print("Preciso dormir bem. Ser o homem de ferro não é fácil");
	.send(jarvis, achieve, dormi);
	-+acordado(false).	

+acordar : acordado(false) <-
	-+acordado(true);
	.print("Ok, estou acordado");
	.send(jarvis, achieve, acordei).
	
+aviso_perigo(Coord): Coord > 1 & Coord < 5 
	<- .print("Jarvis, envie armaduras para coordenada ", Coord);
	.send(jarvis, achieve, enviar_armaduras(Coord)).
	
+aviso_perigo(Coord): Coord < 2 | Coord >= 5 
	<- .print("Jarvis, Nao me importo com ", Coord).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

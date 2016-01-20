// Agent tony in project jarvis

/* Initial beliefs and rules */

aviso_perigo(Coord).

acordado(true).

/* Initial goals */

/* Plans */

+!posicionar.

+!desposicionar.

+!ir_reuniao(Horario, Pessoa) : Horario >= 10 & Horario <= 18
	<- .print("Jarvis, confirme minha presença na reuniao com ", Pessoa);
	+reunir(Horario);
	.send(jarvis, achieve, marcar_reuniao(Horario, Pessoa)).

+!ir_reuniao(Horario, Pessoa) : Horario < 10 | Horario > 18 
	<- .print("Jarvis, nao irei a essa reuniao com ", Pessoa);
	+nao_marcar_reuniao(Horario, Pessoa);
	.send(jarvis, tell, nao_marcar_reuniao(Horario, Pessoa)).

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
	<- .print("Jarvis, envie armaduras para coordenada ", Coord).
	
+aviso_perigo(Coord): Coord < 2 | Coord >= 5 
	<- .print("Jarvis, Nao me importo com este lugar! ", Coord).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

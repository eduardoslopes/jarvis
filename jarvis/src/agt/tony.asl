// Agent tony in project jarvis

/* Initial beliefs and rules */

aviso_perigo(Coord).

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
	
+aviso_perigo(Coord): Coord > 1 & Coord < 5 
	<- .print("Jarvis, envie armaduras para coordenada ", Coord).
	
+aviso_perigo(Coord): Coord < 2 | Coord >= 5 
	<- .print("Jarvis, Nao me importo com este lugar! ", Coord).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }

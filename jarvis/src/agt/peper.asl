// Agent peper in project jarvis

/* Initial beliefs and rules */

/* Initial goals */
//!criar_fogao.
//!criar_carteira.
//!criar_cardapio.
/* Plans */

+!posicionar.
+!desposicionar.

+!criar_objetosPeper : true .

+!criar_fogao : true <-
	makeArtifact("fogao", "jarvis.Fogao", [], IDArtifact);
	focus(IDArtifact).

+!criar_carteira : true <- 
	makeArtifact("carteira","peper.Carteira",[],IDArtifact);
	focus(IDArtifact).
	
+!criar_cardapio : true <-
	makeArtifact("cardapio","peper.Cardapio",[],IDArtifact);
	focus(IDArtifact);
	init.

+!tony_jantar(Carne, Cebola, Macarrao, Molho, Refrigerante):true <-
	.print("Quer jantar, Tony?");
	.send("tony", achieve, jantar(Carne, Cebola, Macarrao, Molho, Refrigerante)).
	
+!cozinhar(Confirmacao) : Confirmacao == true <- 
	.send("jarvis", achieve, passou_hora_jantar);
	.print("Farei o jantar para voce, Tony.");
	colocar_no_fogo.
	
+!falta(Macarrao,Molho) :  Macarrao== false | Molho == false<-
	.print("Certo! Então vou pedir comida!"); 
	!realizar_compra.

+!realizar_compra : true <-
	dinheiro(Valor);
	olharCardapio(Comida,Preco,NaoAcabouOpcoes);
	!decidir_compra(Comida,Preco,Valor,NaoAcabouOpcoes).
	
+!decidir_compra(Comida,Preco,Valor,NaoAcabouOpcoes): Preco <= Valor & NaoAcabouOpcoes<-
	fizEscolha;
	.send("jarvis", achieve, passou_hora_jantar);
	retirar_dinheiro(Preco);
	.print("Pedi ",Comida).
	
+!decidir_compra(Comida,Preco,Valor,NaoAcabouOpcoes): 
	Preco > Valor & NaoAcabouOpcoes <-
	!realizar_compra.
		
+!decidir_compra(Comida,Preco,Valor,NaoAcabouOpcoes): not NaoAcabouOpcoes <-	 
	fizEscolha;
	.send("jarvis", achieve, passou_hora_jantar);
	.print("Não pude pedir comida!").


+dormir : true <-
	.print("Dormindo").	
+acordar : true <-
	.print("Ok, estou acordado").

+!hora_jantar : true <- 
	.send("jarvis", achieve, verificar_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante)).
	
+tem_na_geladeira(Carne, Cebola, Macarrao, Molho, Refrigerante) : true <-
	!tony_jantar(Carne, Cebola, Macarrao, Molho, Refrigerante).

+comida_pronta : true <-
	.print("Comida está pronta").


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
//{ include("$jacamoJar/templates/org-obedient.asl") }

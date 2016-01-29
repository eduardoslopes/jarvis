// CArtAgO artifact code for project jarvis

package peper;

import java.util.Arrays;
import java.util.List;

import cartago.Artifact;
import cartago.OPERATION;
import cartago.OpFeedbackParam;
import objects.Comida;

public class Cardapio extends Artifact {
	private List<Comida> comidas;
	private int itemCardapio;
	
	@OPERATION
	void init() {
		itemCardapio = 0;
		comidas = Arrays.asList(new Comida("cuscuz gurme",150.0),new Comida("sushi",50.0),new Comida("pizza", 40.0),new Comida("shawarma",20.0),new Comida("pastel", 10.0));
	}
	
	@OPERATION
	void olharCardapio(OpFeedbackParam<String> comida,OpFeedbackParam<Double> preco,OpFeedbackParam<Boolean> opcoes){
		Comida c = comidas.get(itemCardapio);

		if(itemCardapio < comidas.size()){
			comida.set(c.getNome());
			preco.set(c.getPreco());
			opcoes.set(false);
			itemCardapio++;
		}else{
			comida.set("");
			preco.set(0.0);
			opcoes.set(true);
		}
	}
	
	@OPERATION
	void fizEscolha(){
		itemCardapio = 0;
	}
}

